#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
  echo "[-] sudo required"
  exit 1
fi

SSID="mipt-ng"

echo "[$] configuring SSID connection settings..."

if nmcli connection show "$SSID" >/dev/null 2>&1; then
    echo "[+] $SSID's profile already exists"

    read -sp ">>> new password? [input]: " NEW_PASSWORD
    echo ""

    if [ -n "$PASSWORD" ]; then
        echo "[*] saving new password..."
        nmcli connection modify "$SSID" 802-11-wireless-security.psk "$PASSWORD"
    else
        echo "[$] old password has been kept"
    fi
else
    echo "[-] $SSID's profile wasn't found, preparing one..."

    while [ -z "$PASSWORD" ]; do
        read -sp ">>> password? [input]: " NEW_PASSWORD
        echo ""
        if [ -z "$PASSWORD" ]; then
            echo "[!] password shouldn't be empty! [input]: "
        fi
    done

    nmcli connection add type wifi con-name "$SSID" ssid "$SSID" -- 802-11-wireless-security.key-mgmt wpa-psk 802-11-wireless-security.psk "$PASSWORD"
fi

echo "[*] MAC-address configuring..."
nmcli connection modify "$SSID" wifi.cloned-mac-address permanent

echo "[$] connecting to '$SSID'..."
if nmcli connection up "$SSID"; then
    echo "[+] nice!"
    echo "    - MAC: $(ip link show wlan0 | awk '/link\/ether/ {print $2}')"
    echo "    - IP:  $(hostname -I | awk '{print $1}')"
else
    echo "[-] failed to connect to '$SSID'"
    echo "    password: '$(sudo nmcli -s -g 802-11-wireless-security.psk connection show $SSID)'"
    exit 1
fi
