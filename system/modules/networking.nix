{
   networking.networkmanager.dns = "none";
   networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
   networking.networkmanager.enable = true;
   networking.networkmanager.wifi.powersave = false;
   networking.networkmanager.wifi.scanRandMacAddress = false;

   boot.extraModprobeConfig = ''
    options mt76_usb disable_usb_aspm=1
    options mt76_connac_core disable_amsdu=1
    options mt76_core disable_aspm=1
  '';
}

