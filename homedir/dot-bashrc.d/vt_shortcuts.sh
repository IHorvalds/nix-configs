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

alias fdb="sudo uuu -v -b flash_system_dev_image.uuu signed-imx-boot-imx8qxp-d7-sd.bin-flash vt-image-dev-imx8qxp-d7.wic.zst"
alias fudb="sudo uuu -v -b flash_system_dev_image.uuu imx-boot-imx8qxp-d7-sd.bin-flash vt-image-dev-imx8qxp-d7.wic.zst"
alias frb="sudo uuu -v -b flash_system_release_image.uuu signed-imx-boot-imx8qxp-d7-sd.bin-flash vt-image-base-imx8qxp-d7.wic.zst"
alias furb="sudo uuu -v -b flash_system_release_image.uuu imx-boot-imx8qxp-d7-sd.bin-flash vt-image-base-imx8qxp-d7.wic.zst"

get_d7_sdk() {
	local dest=${1:-.}
	URL=$(curl -s d7-builds:8000 | jq -r '.sdk_root | to_entries | max_by(.key) | .value[] | .url | select(contains("linux"))')
	echo "${dest}/${URL##*/}"
	(cd "${dest}" && curl -O "$URL")
}

install_d7_sdk() {
	local archive=$1
	(
		trap 'rm -rf ${tmpdir}' EXIT

		tmpdir=$(mktemp -d)
		tar xvf "${archive}" -C "${tmpdir}"
		cd "${tmpdir}" || exit
		version=$(echo "$archive" | rev | cut -c 5-14 | rev)
		./installer-linux.sh --accept-eula "${HOME}/Tools/SDKs/d7-sdk-${version}"
	)
}
