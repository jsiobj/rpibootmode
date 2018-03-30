#!/bin/sh

mv /boot/config.txt /boot/config.txt.disable
mv /boot/start.elf /boot/start.elf.disable

reboot
