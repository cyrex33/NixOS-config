{ pkgs, ... }:

{
  hardware.enableRedistributableFirmware = true;

  #hardware.firmware = with pkgs; [ linux-firmware ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
 };
}
