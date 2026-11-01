#!/usr/bin/env bash

add_to_path() {
	if [ -d "$1" ] && ! grep -qF "$1" <<<"$PATH"; then
		PATH="$1:$PATH"
	fi
}

source_script() {
	if [ -f "$1" ]; then 
		source "$1"
	fi
}

add_to_path "/usr/local/my_tools/bin"
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/.cargo/bin"

# Go tools if go is installed
if command -v go &>/dev/null; then
	add_to_path $(go env GOPATH)
fi

# Nix packages (environment) if it exists
source_script "$HOME/.nix-profile/etc/profile.d/nix.sh"

# Glasgow Haskell Compiler environment, if I've got it
source_script "$HOME/.ghcup/env"

VCPKG_PATH="$HOME/Tools/Staging/vcpkg"
if [ -x "$VCPKG_PATH/vcpkg" ]; then
	add_to_path "$VCPKG_PATH"
	source_script "$VCPKG_PATH/scripts/vcpkg_completion.bash"
fi

if command -v direnv 1,2>/dev/null && [[ $(type -t _direnv_hook) != function ]]; then
	eval "$(direnv hook bash)"
fi

export PATH