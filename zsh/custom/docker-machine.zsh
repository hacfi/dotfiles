alias dm='docker-machine'

local DOCKER_MACHINE_NAME_FILE=$HOME/.docker/machine/name

function dmuse() {
  local dmstatus=$(docker-machine status $1)
  if [[ $dmstatus != "Running" ]]; then
    docker-machine start $1
  fi

  eval "$(docker-machine env $1)"

  echo $1 > $DOCKER_MACHINE_NAME_FILE
}

function dmstop() {
  docker-machine stop $1
  unset DOCKER_TLS_VERIFY DOCKER_HOST DOCKER_CERT_PATH DOCKER_MACHINE_NAME
  rm -f $DOCKER_MACHINE_NAME_FILE
}


if test -f "$DOCKER_MACHINE_NAME_FILE"; then
  local dmname=$(head -n 1 $DOCKER_MACHINE_NAME_FILE)
  local dmstatus=$(docker-machine status $dmname)
  if [[ $dmstatus == "Running" ]]; then
    eval "$(docker-machine env $dmname)"
  else
    rm -f $DOCKER_MACHINE_NAME_FILE
  fi
fi

return;

local dmstatus=$(docker-machine status siroop)
if [[ $dmstatus == "Running" ]]; then
  eval "$(docker-machine env siroop)"
fi
