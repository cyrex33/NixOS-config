{ pkgs, ... }:

{
  imports = [
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
    krb5
    nixfmt
  ];

  system.stateVersion = "26.05";
}
