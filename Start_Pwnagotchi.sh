#!/bin/bash

# Add debug output
echo "Stopping Bettercap and Pwnagotchi..."
sleep 2

# Stop Bettercap and Pwnagotchi
pkill bettercap
sleep 2
pkill pwnagotchi
sleep 2

# Stop monitor mode if necessary
echo "Stopping monitor mode..."
source /system/xbin/monstart-nh
sleep 2
source /system/xbin/monstop-nh
sleep 2
source /system/xbin/monstop-nh
sleep 2

# Start gpsd
echo "Starting gpsd..."
gpsd -N -n -D5 tcp://localhost:4352 &
sleep 2

# Restart Bettercap with LD_PRELOAD
echo "Restarting Bettercap..."
LD_PRELOAD=/lib/libnexmonkali.so servicectl restart bettercap &
sleep 3

# Start Pwnagotchi
echo "Starting Pwnagotchi..."
systemctl restart pwnagotchi
sleep 2
LD_PRELOAD=/system/lib/libnexmonkali.so pwnagotchi
