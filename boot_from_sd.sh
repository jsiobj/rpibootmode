#!/bin/sh

reboot=1

enable_file() {
  filename=$1

  mv $filename.disable $filename
  if [ $? -ne 0 ]; then
    echo WAR Could not "enable" $filename
    reboot=0
  else
    echo INF File $filename "enabled"
  fi
}

if [ "`id -u`" -ne "0" ]; then
  echo Must be root to run this script
  exit 1
fi

if [ `mount | grep " / " | grep "/dev/sd" | wc -l` -ne 1 ]; then
  echo ERR Looks like not booted from USB. Stopping
  exit 1
fi

mount | grep /media/sd/boot >/dev/null 2>&1
if [ $? -ne 0 ]; then 
  echo INF Mounting /dev/mmcblk0p1 on /media/sd/boot
  mount /dev/mmcblk0p1 /media/sd/boot
  if [ $? -ne 0 ]; then
    echo ERR Failed mount SD boot fs
    exit 1
  fi
else
  echo INF /media/boot/sd already mounted
fi

enable_file /boot/config.txt
enable_file /boot/start.elf

if [ $reboot -eq 1 ]; then
  echo INF Rebooting
<<<<<<< HEAD
  reboot
=======
  #reboot
>>>>>>> 2343aad88fe6b4d1c5729ce8c6dc021c8956121b
else
  echo INF Not rebooting
fi
