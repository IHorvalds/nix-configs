# Nix Package Manager
if [ -e "$HOME"/.nix-profile/etc/profile.d/nix.sh ]; then
	# shellcheck source=/dev/null
	source "$HOME"/.nix-profile/etc/profile.d/nix.sh;
fi
