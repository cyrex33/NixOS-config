{ pkgs, ... }:

{
  hardware.enableRedistributableFirmware = true;

  hardware.firmware = with pkgs; [ linux-firmware ];

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
 };
}
