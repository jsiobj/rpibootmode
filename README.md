# Choosing boot from SD or USB
WORK IN PROGESS

Those scripts should allow to boot from SD or USB by renaming files on /boot on the SD card.

Install those 2 scripts on both USB and SD card.

This have been tested on RPI 2 and 3.

## How to use

* Boot normally from SD
* Run `sudo boot_from_usb.sh`
* The Pi should reboot and start from USB device
* Once booted from USB, you can mount the SD card and do what ever you need (backuping the SD card as an img file for instance)
* Run `sudo boot_from_sd.sh`
* The Pi should reboot on the SD card (if you did not mess too much with it...)
