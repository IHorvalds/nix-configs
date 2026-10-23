# MacOS specific stuff


if [[ "$OSTYPE" == "darwin"* ]]; then
	# shellcheck source=~/.ghcup/env
	[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
fi
