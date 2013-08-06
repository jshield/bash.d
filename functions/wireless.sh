stop_wireless () 
{ 
    sudo systemctl stop wpa_supplicant@$1;
    sudo systemctl stop dhcpcd@$1
}
stop_wireless () 
{ 
    sudo systemctl stop wpa_supplicant@$1;
    sudo systemctl stop dhcpcd@$1
}
