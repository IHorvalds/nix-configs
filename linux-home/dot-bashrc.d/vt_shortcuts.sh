# Shortcuts for long commands
export CDB="-DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
export VCPKG_TOOLCHAIN="-DCMAKE_TOOLCHAIN_FILE=/home/dcroitoru/Tools/vcpkg/scripts/buildsystems/vcpkg.cmake"
export SDKTOOL_PATH=/home/dcroitoru/Tools/SDKs/QT/Tools/sdktool/libexec/qtcreator/sdktool
export MJ="-j$(nproc)"

# Aliases
function d7ssh() {
	if [[ "$1" =~ ^[0-9]+$ ]]; then
		_user="root"
		_ip="192.168.5.$1"
	else
		_user=$1
		_ip="192.168.5.$2"
	fi

	ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" ${_user}@${_ip}
}

function d7scp() {
	_loc="/home/root"
	if [[ "$1" =~ ^[0-9]+$ ]]; then
		_user="root"
		_ip="192.168.5.$1"
		_file="$2"

		if [[ -n $3 ]]; then
			_loc="$3"
		fi

	else
		_user=$1
		_ip="192.168.5.$2"

		_file="$3"

		if [[ -n $4 ]]; then
			_loc="$4"
		fi
	fi

	scp -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" ${_file} ${_user}@${_ip}:${_loc}
}
