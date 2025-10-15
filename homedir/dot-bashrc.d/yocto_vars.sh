export YOCTO_VARIANT=${YOCTO_SELECTED:-nxp}
export YOCTO_DOWNLOADS=/home/dcroitoru/yocto/downloads/${YOCTO_VARIANT}
export YOCTO_SSTATE=/home/dcroitoru/yocto/sstate/${YOCTO_VARIANT}
export YOCTO_SHARED_GROUP=dcroitoru
export YOCTO_IMAGE=yocto

# Yocto docker script
YOCTO_DOCKER_SH=/home/dcroitoru/Development/sdk-project-d7/docker/yocto
if [[ $PATH != *"$YOCTO_DOCKER_SH"* ]]; then
  export PATH="$YOCTO_DOCKER_SH:$PATH"
fi

