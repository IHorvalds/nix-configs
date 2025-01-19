USAGE="./copy-config.sh <root of nixos config>/ <admin user name>"

NIXOS_CFG_ROOT=$1
ADMIN_USER=$2
if [[ -z $NIXOS_CFG_ROOT || -z $ADMIN_USER ]]; then
	echo $USAGE
	exit 1
fi

NIXOS_CFG_ROOT=$(realpath $NIXOS_CFG_ROOT)

MINIMAL_FILES=$(find $NIXOS_CFG_ROOT -name "configuration.nix")

if [[ $MINIMAL_FILES != *"/configuration.nix"* ]]; then
	echo "Target directory does not contain configuration.nix"
	exit 1
fi

HARDWARE_CONFIG=$(find $NIXOS_CFG_ROOT -name "hardware-configuration.nix")

if [[ $HARDWARE_CONFIG == "" ]]; then
	if ! cp -f /etc/nixos/hardware-configuration.nix $NIXOS_CFG_ROOT/ ; then
		echo "Failed to copy hardware-configuration.nix to ${NIXOS_CFG_ROOT}"
		exit 1
	fi

	chown $ADMIN_USER:users $NIXOS_CFG_ROOT/hardware-configuration.nix
fi

# Back up previous configuration and delete it
BACKUP_CFG=prev-cfg.tar.gz
cd /etc
tar czf $BACKUP_CFG ./nixos/

if ! rm -rf /etc/nixos/* ; then
	echo "Failed to clean up /etc/nixos directory"
	exit 1
fi

if ! find $NIXOS_CFG_ROOT -mindepth 1 -maxdepth 1 -print -exec ln -s {} /etc/nixos/ \; ; then
	echo "Failed to build symlinks from ${NIXOS_CFG_ROOT} to /etc/nixos"
	echo ""
	echo "To restore the previous configuration, extract prev-cfg.tar.gz in /etc/nixos"
	exit 1
fi
