{ pkgs, ... }:

{
  imports =
     [ 
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

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
     polkit_gnome
     polkit
     nvidia-vaapi-driver
     qbittorrent
     krb5
     steam
     ntfs3g
     pavucontrol
     cloudflare-warp
     git
     wget
     wine
  ];

  system.stateVersion = "26.05";
}

