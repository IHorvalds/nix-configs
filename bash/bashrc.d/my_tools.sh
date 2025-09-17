#!/bin/bash

VCPKG_PATH=$HOME/Tools/Utilities/vcpkg
if [[ $PATH != *"$VCPKG_PATH"* && -x $VCPKG_PATH/vcpkg ]]; then
	export PATH=$VCPKG_PATH:$PATH
	
	if [[ -f $VCPKG_PATH/scripts/vcpkg_completion.bash ]]; then
		source $VCPKG_PATH/scripts/vcpkg_completion.bash
	fi

fi

MY_TOOLS_PATH=/usr/local/my_tools/bin
if [[ $PATH != *"$MY_TOOLS_PATH"* ]]; then
	export PATH=$MY_TOOLS_PATH:$PATH
fi

if [[ $(type -t _direnv_hook) != function ]]; then
  eval "$(direnv hook bash)"
fi
