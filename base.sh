apt update
apt -y upgrade
apt -y install live-build
mkdir -p .build/debian-live
cd .build/debian-live
lb config -d bullseye --debian-installer live --debian-installer-distribution bullseye --debian-installer-gui false --apt-indices false --apt-recommends false --archive-areas "main contrib non-free" --debootstrap-options "--variant=minbase" --firmware-chroot false --memtest none
cp ~/pkgs.list.chroot ./config/package-lists/
mkdir -p config/includes.chroot_after_packages/etc/skel
cp ./.profile config/includes.chroot_after_packages/etc/skel
cp ./.bashrc config/includes.chroot_after_packages/etc/skel
lb build
