{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
      ../../system/modules/boot.nix
      ../../system/modules/networking.nix
      ../../system/modules/audio.nix
      ../../system/modules/graphics.nix
      ../../system/modules/nvidia.nix
      ../../system/modules/desktop.nix
      ../../system/modules/storage.nix
      ../../system/modules/virtualization.nix
      ../../system/modules/gaming.nix
      ../../system/modules/system.nix
      ../../system/modules/warp.nix
      ../../system/modules/bspwm.nix
      ../../system/modules/sxhkd.nix
    ];

  networking.hostName = "nixos"; # Define your hostname.

  #networking.useDHCP = true;
  #networking.enableIPv6 = false;
  #networking.wireless.athUserRegulatoryDomain = "RU";
  time.timeZone = "Europe/Moscow";

  programs.firefox.enable = true;

  #environment.sessionVariables = {
    #MOZ_DISABLE_RDD_SANDBOX = "1";
    #NVD_BACKEND = "direct";
   #};

  environment.systemPackages = with pkgs; [
     pkgs.polkit_gnome
     polkit
     nvidia-vaapi-driver
     qbittorrent
     krb5
     steam
     bottles
     ntfs3g
     pavucontrol
     cloudflare-warp
     git
     wget
     pkgs.wine
  ];

  system.stateVersion = "26.05";
}

