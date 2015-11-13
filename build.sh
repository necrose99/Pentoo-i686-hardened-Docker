suffix=$3 # e.g. -hardened
arch=$1
busybox_version=$2
#dist="http://distfiles.gentoo.org/releases/${arch}/autobuilds/"
#stage3="$(wget -q -O- ${dist}/latest-stage3-${busybox_version}${suffix}.txt | tail -n 1 | cut -f 1 -d ' ')"

mkdir newWorldOrder; cd newWorldOrder
echo "Downloading and extracting ${stage3}..."
wget -q -c "ftp://pentoo.west.us.mirror.inerail.net/pentoo/Pentoo_x86_hardened/pentoo-x86-hardened-2015.0_RC4.2.iso"
7z e -r pentoo-x86-hardened-2015.0_RC4.2.iso
rm -f pentoo-x86-hardened-2015.0_RC4.2.iso syslinux.cfg README.txt livecd
rm -r isolinux
unsquashfs -f -d /newWorldOrder /newWorldOrder/image.squashfs
unsquashfs -f -d /newWorldOrder/newWorldOrder/portage-20151029.lzm  
unsquashfs -f -d /newWorldOrder/newWorldOrder/pentoo_overlay-20151029.lzm
rm -f *.lzm
cd modules && mv /newWorldOrder
wget -q -O /busybox "http://www.busybox.net/downloads/binaries/latest/busybox-${busybox_version}"
chmod +x /busybox
/busybox rm -rf /lib* /usr /var /bin /sbin /opt /mnt /media /root /home /run /tmp
/busybox cp -fRap lib* /
/busybox cp -fRap bin boot home media mnt opt root run sbin tmp usr var /
/busybox cp -fRap etc/* /etc/
cd /
#commit suicide
/busybox rm -rf newWorldOrder /busybox /build.sh /linuxrc




# Self destruct
rm -f /Dockerfile /build.sh

echo "Bootstrapped ${stage3} into /:"
ls --color -lah
