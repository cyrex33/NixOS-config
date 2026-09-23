{ pkgs, ... }:

{
  services.xserver = {
     enable = true;
     displayManager.sddm.enable = true;
     desktopManager.xfce.enable = false;
   };
  #displayManager.setupCommands = ''
    #${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 2560x1440 --rate 240.00
  #'';
  #};

  services.xserver.libinput = {
    enable = true;
    mouse = {
        accelProfile = "flat";
        accelSpeed = "0";
        naturalScrolling = false;
   };
 };

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "gtk";
  };

  fonts.packages = with pkgs; [
        jetbrains-mono
  ];
}
