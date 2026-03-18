#!/bin/bash

VCPKG_PATH=$HOME/Tools/Utilities/vcpkg
if [[ $PATH != *"$VCPKG_PATH"* && -x $VCPKG_PATH/vcpkg ]]; then
	export PATH=$VCPKG_PATH:$PATH
	
	VCPKG_COMP_BASH="vcpkg_completion.bash"
	if [[ -f $VCPKG_PATH/scripts/$VCPKG_COMP_BASH ]]; then
		source "$VCPKG_PATH/scripts/$VCPKG_COMP_BASH"
	fi

fi

MY_TOOLS_PATH="$HOME"/.local/bin
if [[ $PATH != *"$MY_TOOLS_PATH"* ]]; then
	export PATH=$MY_TOOLS_PATH:$PATH
fi

# Go tools if go is installed
if command -v go 1,2>/dev/null; then
	GOPATH=$(go env GOPATH)
	if [[ -d $GOPATH/bin && $PATH != *"$GOPATH"* ]]; then
		export PATH=$GOPATH/bin:$PATH
	fi
fi

if command -v direnv 1,2>/dev/null && [[ $(type -t _direnv_hook) != function ]]; then
	eval "$(direnv hook bash)"
fi

# Rust tools if cargo is installed
CARGO_BIN=$HOME/.cargo/bin
if [[ -f $HOME/.cargo/env  && $PATH != *"$CARGO_BIN"* ]]; then 
	source $HOME/.cargo/env
fi
