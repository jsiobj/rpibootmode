#!/bin/sh

reboot=1

disable_file() {
  filename=$1

  mv $filename $filename.disable
  if [ $? -ne 0 ]; then
    echo WAR Could not "disable" $filename
    reboot=0
  else 
    echo INF File $filename "disabled"
  fi
}

if [ `id -u` -ne 0 ]; then
  echo ERR Must be root to run this script
  exit 1
fi

if [ `mount | grep " / " | grep "/dev/sd" | wc -l` -eq 1 ]; then
  echo WAR Looks like already booted on USB
  reboot=0
fi

disable_file /boot/config.txt 
disable_file /boot/start.elf

if [ $reboot -eq 1 ]; then
  echo INF Rebooting
  reboot
else
  echo INF Not rebooting
fi
