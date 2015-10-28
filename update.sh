#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"


stage3="$(wget -qO- 'http://distfiles.gentoo.org/releases/amd64/autobuilds/latest-stage3-amd64.txt' | grep -v '#' | awk '{print $1}')"


if [ -z "$stage3" ]; then
	echo >&2 'wtf failure'
	exit 1
fi

url="http://distfiles.gentoo.org/releases/amd64/autobuilds/$stage3"
name="$(basename "$stage3")"

( set -x; wget -N "$url" )

base="${name%%.*}"
image="gentoo-temp:$base"
container="gentoo-temp-$base"

# bzcat thanks to https://code.google.com/p/go/issues/detail?id=7279
( set -x; bzcat -p "$name" | docker import - "$image" )

docker rm -f "$container" > /dev/null 2>&1 || true
( set -x; docker run -t --name "$container" "$image" bash -exc $'
	export MAKEOPTS="-j$(nproc)"
	#pythonTarget="$(emerge --info | sed -n \'s/.*PYTHON_TARGETS="\\([^"]*\\)".*/\\1/p\')"
	#pythonTarget="${pythonTarget##* }"
	pythonTarget="python2_7"
	echo \'PYTHON_TARGETS="\'$pythonTarget\'"\' >> /etc/portage/make.conf
	echo \'PYTHON_SINGLE_TARGET="\'$pythonTarget\'"\' >> /etc/portage/make.conf
	mkdir /usr/portage
mkdir -p /etc/portage/repos.conf/
echo "[DEFAULT]
main-repo = gentoo

[gentoo]
location = /usr/portage
sync-type = rsync 
sync-uri = rsync://rsync.namerica.gentoo.org/gentoo-portage
" > /etc/portage/repos.conf/gentoo.conf
	emerge --sync
	eselect profile set default/linux/amd64/13.0
	emerge -j --newuse --deep --with-bdeps=y @system @world
	emerge -C editor ssh man man-pages openrc e2fsprogs service-manager
	emerge -j layman
	emerge --depclean
	rm -rf /usr/portage/packages
' )

xz="$base.tar.xz"
( set -x; docker export "$container" | xz -9 > "$xz" )

docker rm "$container"
docker rmi "$image"

echo 'FROM scratch' > Dockerfile
echo "ADD $xz /" >> Dockerfile
echo 'CMD ["/bin/bash"]' >> Dockerfile

( set -x; docker build -t "sabayon/gentoo-stage3-base-amd64" . )
