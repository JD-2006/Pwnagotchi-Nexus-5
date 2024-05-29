The primary goal was to be able to use the internal wifi of the Nexus 5 to use Pwnagotchi and Nethunter.
<br />
<br />

There is the easy way:using the Nexus Root Toolkit https://www.wugfresh.com/nrt/

There is the harder way:

    Download ADB and fastboot (depends on OS/distro)
    Put phone into fastboot by holding down vol down + power
    Warning this will wipe device In terminal on computer: fastboot oem unlock && fastboot reboot
    Reboot back into fastboot
    In terminal on computer: fastboot flash recovery TWRP_multirom_hammerhead_20160210.img
    Now boot into recovery by either using menu in fastboot or holding volume up + power.

Flashing in TWRP

If you have made into recovery you will want to copy the NethunterOS zip file to your device and maybe also the radio zip file.

    Always make a backup of a working OS under the backup tab. Select system/data/boot
    Wipe any previous ROMs by going to wipe tab. Select Advanced Wipe & system/data/cache
    Finaly go to install button and select NethunterOS zip file.

Setting Up

Reboot your device. When it starts up the first time it will reboot once, don't be nervours.

After your device loads go through the normal CM set up. Copy the kalifs-full.tar.xz from your computer to your device. Then:

    Go to the Nethunter app
    Go to "Kali Chroot Manger" after accepting permissions. If previous Chroot was found click "Remove Chroot" first.
    Click on "Install Chroot" > Use SDCARD > Use Full
    Exit out of app and run Nethunter terminal app and launch into Kali terminal


-- Flash TWRP recovery
https://eu.dl.twrp.me/hammerhead/twrp-3.6.0_9-0-hammerhead.img.html
<br />
<br />

-- Flash ROM
The base ROM is lineage-14.1-20190126-nightly-hammerhead-signed.zip.
https://androidfilehost.com/?fid=1395089523397901793
<br />
<br />

-- Flash Nethunter in TWRP
nethunteros-nethunter-hammerhead-cm-14.1-hammerhead.zip.
https://build.nethunter.com/nethunteros/CM14_1/hammerhead/nethunteros-nethunter-hammerhead-cm-14.1-hammerhead.zip
<br />
<br />

-- Install chroot through Nethunter app - Do not update packages yet
Rename to kalifs-full.tar.xz
I am pretty sure this is the chroot I ended up going with. It should be Python 3.9.
https://build.nethunter.com/kalifs/kalifs-20190228/kalifs-armhf-full.tar.xz
<br />
<br />

-- Install an Android file manager capable of exploring system root.
-- Install Nexmon through Nethunter Store app
Make sure to install all the tools. To /system/xbin
<br />
<br />

-- Keep an eye on the file permissions and that they match files previously in the folders.
-- Download and rename fw_bcmdhd.bin.nexmon to fw_bcmdhd.bin, and put it in /etc/firmware on Nexus system.
https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-devices/-/tree/master/nougat/hammerhead/nexmon-fw
<br />
<br />

-- Download and copy files to system root and chroot - Following file location structure. Some of these files I am not sure if they need to be in Nexus system or not but it's just what I did as I was testing the Hijacker app as well.
https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-devices/-/tree/master/nougat/hammerhead/system
<br />
<br />
-- Start Nethunter app and enable ssh service and start
-- I connected the phone to my pc and used the 'tethering through usb' to connect WinSCP and Putty.
<br />
<br />
-- Through Putty - Make sure your chroot is using python 3.9. It's bad enough we are going to change repositories but trying to change python versions is a real pita!
nano /etc/apt/sources.list
Change sources:
deb http://deb.debian.org/debian bullseye main contrib non-free
<br />
<br />
-- As I was not going to use metasploit or exploit db or xfce and they take up a bunch of room, plus no reason to take forever updating if you are not going to use them.
apt-get purge exploitdb metasploit-framework xfce*
<br />
<br />
apt-get update
apt-get upgrade
<br />
<br />
-- To continue use the accompanying text file as this is long enough and it was already created. Thanks.
