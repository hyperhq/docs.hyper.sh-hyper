#!/bin/bash

SCRIPT_NAME=`basename "$0"`

### config begin ###
HYPER_BIN="hyper --config ~/.hyper"
SFTP_USER="backupdata"                  # You can change the username
SFTP_PORT="2222"                 # Set the port of the SFTP server container
MKPWD_IMAGE_NAME="atmoz/makepasswd"
SFTP_IMAGE_NAME="atmoz/sftp"
CONTAINER_NAME="sftpserver"
PWD_CACHE_DIR="/tmp/hyper/sftp"
### config end ###


function show_usage() {
cat <<EOF
Usage: ./${SCRIPT_NAME} <action> [options]

action:
    help      # show help for quick start
    generate  # generate encrypted passwords
    start     # start a SFTP server container in hyper.sh
    status    # show the status of SFTP server container
    view      # view the config for sftp
    delete    # delete the SFTP server container
    clean     # delete the SFTP server container, FIP and the password cache file
EOF

exit 1
}

function show_help() {
check_sftp_container
cat <<EOF
Example:

# start a SFTP server container in hyper.sh, then copy the files in the volume from hyper.sh to localhost
./${SCRIPT_NAME} generate            # genereate SFTP password
./${SCRIPT_NAME} start vol1 vol2     # start SFTP server container, run 'hyper volume ls' to get the volume name
./${SCRIPT_NAME} view                # get SFTP server IP and account

#download file with non-interactive mode
sftp -P ${SFTP_PORT} ${SFTP_USER}@$FIP:/vol1/file1 .   # root dir for SFTP is '/home/${SFTP_USER}', all volumes are mounted in this dir.

#download dir with interactive mode
sftp -P ${SFTP_PORT} ${SFTP_USER}@${FIP}
sftp> ls
sftp> get -Pr *
sftp> exit

# show usage
./${SCRIPT_NAME}

# list sftp root dir in hyper container($CONTAINER_NAME)
hyper exec -it ${CONTAINER_NAME} ls /home/${SFTP_USER}

# enter the hyper container($CONTAINER_NAME)
hyper exec -it ${CONTAINER_NAME} bash

# get sftp account
./${SCRIPT_NAME} view

# get sftp hyper container info
./${SCRIPT_NAME} status

# delete the sftp container only
./${SCRIPT_NAME} delete

# delete SFTP server container, FIP and SFTP server password file
./${SCRIPT_NAME} clean
EOF
}

function quit() {
  echo $@
  exit 1
}

function ensure_docker_image() {
  IMAGE="$1"
  echo "> ensure docker image $IMAGE"
  eval "${HYPER_BIN} images ${IMAGE} | grep '${IMAGE}' "
  if [ $? -ne 0 ]; then
    eval "${HYPER_BIN} pull ${IMAGE}"
     if [ $? -ne 0 ]; then
        quit ">error: failed to pull docker image ${IMAGE}"
     fi
  else
    echo ">docker image ${IMAGE} is pulled"
  fi
}

function generate_password() {
  if [[ -f ${PWD_CACHE_DIR}/password_plain ]] && [[ -f ${PWD_CACHE_DIR}/password_crypt  ]]; then
    echo ">read exist password for SFTP server from ${PWD_CACHE_DIR}"
    SFTP_PWD=$(cat ${PWD_CACHE_DIR}/password_plain)
    SFTP_CRYPT_PWD=$(cat ${PWD_CACHE_DIR}/password_crypt)
  fi

  if [[ "${SFTP_PWD}" == "" ]] || [[ ${SFTP_CRYPT_PWD} == "" ]]; then
    which makepasswd >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo ">generate new password for SFTP server with local makepasswd"
      RESULT=$(makepasswd --crypt-md5)
      if [ $? -ne 0 ]; then
        quit "error: failed to generate password with local makepasswd"
      fi
    else
      ensure_docker_image "${MKPWD_IMAGE_NAME}"
      echo ">generate new password for SFTP server with hyper"
      RESULT=$(eval "${HYPER_BIN} run -it --rm ${MKPWD_IMAGE_NAME} --crypt-md5")
      if [ $? -ne 0 ]; then
        quit "error: failed to generate password with hyper"
      fi
      SFTP_PWD=$(echo -n $RESULT | awk '{print $1}')
      SFTP_CRYPT_PWD=$(echo -n $RESULT | awk '{print $2}' | tr -d "\\r")
      mkdir -p ${PWD_CACHE_DIR}
      echo $SFTP_PWD > ${PWD_CACHE_DIR}/password_plain
      echo $SFTP_CRYPT_PWD > ${PWD_CACHE_DIR}/password_crypt
      echo -e "\n>The password files have been stored to ${PWD_CACHE_DIR}"
      echo "> delete docker image ${MKPWD_IMAGE_NAME}"
      eval "${HYPER_BIN} rmi -f ${MKPWD_IMAGE_NAME}"
    fi
  else
    echo ">password for SFTP server is exist, skip generate the new one"
  fi
  echo -e "SFTP_PWD:\n plain=> ${SFTP_PWD}\n encrypted=> ${SFTP_CRYPT_PWD}"
}

function read_password() {
  if [[ -f ${PWD_CACHE_DIR}/password_plain ]] && [[ -f ${PWD_CACHE_DIR}/password_crypt  ]]; then
    echo ">read exist password for SFTP server from ${PWD_CACHE_DIR}"
    SFTP_PWD=$(cat ${PWD_CACHE_DIR}/password_plain)
    SFTP_CRYPT_PWD=$(cat ${PWD_CACHE_DIR}/password_crypt)
    if [[ "${SFTP_PWD}" == "" ]] || [[ ${SFTP_CRYPT_PWD} == "" ]]; then
      quit "error: password under ${PWD_CACHE_DIR} is invalid, please run './${SCRIPT_NAME} generate' again"
    fi
  else
    quit "error: failed to read password under ${PWD_CACHE_DIR}, please run './${SCRIPT_NAME} generate' first"
  fi
}

function get_free_fip() {
  FIP=`eval "${HYPER_BIN} fip ls -f dangling=true | grep -v Floating | head -n 1"`
  if [ "${FIP}" == "" ]; then
    echo "> There is no unused FIP, allocate a new FIP now"
    FIP=`eval "${HYPER_BIN} fip allocate -y 1"`
  fi
  if [ "$FIP" == "" ]; then
    quit "error: failed to allocate FIP"
  else
    echo "> FIP for SFTP server is $FIP"
  fi
}

function start_sftp_container() {
  # read password
  read_password

  # check volume list
  if [ $# -eq 0 ];then
    quit ">error: please specify the volume names to attach to the SFTP server container, for example: './$SCRIPT_NAME start vol1 vol2 vol3 ...', use 'hyper volume ls' to get the volume name"
  fi
  for v in $@
  do
    VOL_LIST=$"${VOL_LIST} -v ${v}:/home/${SFTP_USER}/${v} "
  done

  eval "${HYPER_BIN} ps -fa name=${CONTAINER_NAME} | grep ${CONTAINER_NAME}"
  if [ $? -eq 0 ]; then
    quit ">error: there is already a hyper container named '${CONTAINER_NAME}', please run './${SCRIPT_NAME} delete' first"
  fi

  ensure_docker_image ${SFTP_IMAGE_NAME}

  echo "> start the SFTP server container in hyper.sh"
  eval "${HYPER_BIN} run -d --name ${CONTAINER_NAME} \
      ${VOL_LIST} \
      -p ${SFTP_PORT}:22 \
      ${SFTP_IMAGE_NAME} '${SFTP_USER}:${SFTP_CRYPT_PWD}:e:1001:0'"

  get_free_fip
  eval "${HYPER_BIN} fip attach ${FIP} ${CONTAINER_NAME}"

  check_sftp_container
}

function check_sftp_container() {
  echo "> check sftp container"
  RLT=$(eval "${HYPER_BIN} ps -fa name=${CONTAINER_NAME} | grep -v CONTAINER")
  if [ $? -ne 0 ]; then
    quit "error: hyper container '${CONTAINER_NAME}' not exist, please run './${SCRIPT_NAME} start <volume list>' first"
  fi
  FIP=$(echo ${RLT} | awk '{print $NF}')
  if [[ "${FIP}" == "" ]] || [[ "${FIP}" == "sftpserver" ]]; then
    quit "error: The container ${CONTAINER_NAME} is not assigned FIP, please delete (./${SCRIPT_NAME} delete) and start(./${SCRIPT_NAME} start) the container again"
  fi
  echo ">${CONTAINER_NAME} is ready"
}

function show_sftp_container_status() {
  eval "${HYPER_BIN} ps -fa name=${CONTAINER_NAME}"
}

function view_sftp_config() {
  check_sftp_container
  read_password
cat <<EOF
SFTP server ip: $FIP
SFTP username : ${SFTP_USER}
SFTP password : ${SFTP_PWD}
SFTP root dir : /home/${SFTP_USER}
Example       :  sftp -P ${SFTP_PORT} ${SFTP_USER}@$FIP:/data/hello.txt .    #'data' is the volume name, the full file path in container is /home/${SFTP_USER}/data/hello.txt
EOF
}

function delete_fip_of_sftp_container() {
  echo "delete FIP of sftp container"
  RLT=$(eval "${HYPER_BIN} ps -fa name=${CONTAINER_NAME}| grep -v CONTAINER")
  FIP=$(echo $RLT | awk '{print $NF}')
  if [ "${FIP}" != "" ]; then
    eval "${HYPER_BIN} fip detach ${CONTAINER_NAME}"
    if [ $? -ne 0 ];then
      quit "error: failed to detach ${FIP} from hyper container(${CONTAINER_NAME})"
    fi
    eval "${HYPER_BIN} fip release ${FIP}"
    if [ $? -ne 0 ]; then
      quit "error: failed to release ${FIP}"
    fi
  else
    echo "skip: there is no FIP to detach"
  fi
}
function delete_sftp_container() {
  echo "delete hyper container ${CONTAINER_NAME}"
  eval "${HYPER_BIN}  rm -f ${CONTAINER_NAME}"
}
function delete_cache_file() {
  echo "> delete cached password file"
  rm -rf ${PWD_CACHE_DIR}
}

### main ###
case $1 in
  generate)
  generate_password
  ;;
  start)
  shift
  start_sftp_container $@
  ;;
  status)
  show_sftp_container_status
  ;;
  view)
  view_sftp_config
  ;;
  delete)
  delete_sftp_container
  ;;
  help)
  show_help
  ;;
  clean)
  delete_cache_file
  check_sftp_container
  delete_fip_of_sftp_container
  delete_sftp_container
  ;;
  *)
  show_usage
  ;;
esac
