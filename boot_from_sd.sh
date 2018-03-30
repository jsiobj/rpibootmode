#!/bin/sh

if [ `id -u` -ne 0 ]; then
  echo Must be root to run this script
  exit 1
fi

mount /dev/mmcblk0p1 /media/sd/boot
if [ $? -ne 0 ]; then
  echo Failed mount SD boot fs
  exit 1
fi

mv /media/sd/boot/config.txt.disable /media/sd/boot/config.txt
if [ $? -ne 0 ]; then
  echo Failed to restore config.txt
  exit 1
fi

mv /media/sd/boot/start.elf.disable /media/sd/boot/start.elf
if [ $? -ne 0 ]; then
  echo Failed to restore start.elf
  exit 1
fi

reboot

