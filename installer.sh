#!/bin/sh
# EStalkerWebControl Plugin Installer
# Version: 1.1
# Author: MNASR

echo "Starting installation..."

sleep 3

if [ -d /usr/lib/enigma2/python/Plugins/Extensions/EStalkerWebControl ]; then
    echo "> Removing previous installation..."
    rm -rf /usr/lib/enigma2/python/Plugins/Extensions/EStalkerWebControl
fi

status_file='/var/lib/opkg/status'
package_name='enigma2-plugin-extensions-estalkerwebcontrol'

if [ -f "$status_file" ] && grep -q "$package_name" "$status_file"; then
    echo "> Removing old opkg package..."
    opkg remove "$package_name"
fi

sleep 2

echo "> Downloading EStalkerWebControl..."
wget -q -O /tmp/EStalkerWebControl.tar.gz "https://github.com/popking159/EStalkerWebControl/raw/refs/heads/main/EStalkerWebControl.tar.gz"

if [ $? -ne 0 ]; then
    echo "ERROR: Download failed!"
    exit 1
fi

echo "> Installing..."
tar -xzf /tmp/EStalkerWebControl.tar.gz -C /
if [ $? -ne 0 ]; then
    echo "ERROR: Extraction failed!"
    exit 1
fi

rm -f /tmp/EStalkerWebControl.tar.gz
sleep 2

sync
echo "========================================================="
echo "===                      FINISHED                     ==="
echo "===                       MNASR                       ==="
echo "========================================================="
echo "       EStalkerWebControl installed successfully!        "
echo "========================================================="

exit 0