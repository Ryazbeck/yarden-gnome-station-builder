#!/usr/bin/env bash


while getopts h:s:k:r: option
do
case "${option}"
in
h) HOTSPOT_STATE=${OPTARG};;
s) WSSID=${OPTARG};;
k) WKEY=${OPTARG};;
r) RESTART_WIFI=${OPTARG};;
esac
done


if [[ $HOTSPOT_STATE == 'start' ]]; then
  echo 'Starting Wifi AP and client...'
  ifdown --force wlan0
  ifdown --force ap0
  ifup ap0
  ifup wlan0
  sysctl -w net.ipv4.ip_forward=1
  iptables -t nat -A POSTROUTING -s 192.168.100.0/24 ! -d 192.168.100.0/24 -j MASQUERADE
  systemctl restart dnsmasq
elif [[ $HOTSPOT_STATE == 'stop' ]]; then
  echo 'Stopping Wifi AP...'
  ifdown --force ap0
fi


if [[ ! -z $WSSID && ! -z $WKEY ]]; then
  echo "Updating wpa_supplicant.conf..."
  cat << _EOF_ > /etc/wpa_supplicant/wpa_supplicant.conf
network={
  ssid="$WSSID"
  scan_ssid=1
  key_mgmt=WPA-PSK
  psk="$WKEY"
}
_EOF_
fi


if [[ $RESTART_WIFI ]]; then
  echo "Restarting wlan0..."
  ifdown --force wlan0 && ifup wlan0
fi