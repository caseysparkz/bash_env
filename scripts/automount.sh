#!/bin/sh
### If called from .bashrc, this script must be run as:
### $ nohup $SCRIPTS/automount.sh &

pathtoname() {
  udevadm info -p /sys/"$1" | awk -v FS== '/DEVNAME/ {print $2}'
}

stdbuf -oL -- udevadm monitor --udev -s block | while read -r -- _ _ event devpath _; do
  if [ "$event" = add ]; then
    devname=$(pathtoname "$devpath")
    udisksctl mount --block-device "$devname" --no-user-interaction;
    notify-send -t 10000 "Device mounted at $devname"
  fi
done
