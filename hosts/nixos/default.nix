

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

  #networking.networkmanager.settings = {
    #device = {
      #"wifi.scan-rand-mac-address" = "no";
    #};
    #connection = {
      #"wifi.bgscan" = "off";
 #};
 #};

  time.timeZone = "Europe/Moscow";

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  programs.firefox.enable = true;

  #environment.sessionVariables = {
    #MOZ_DISABLE_RDD_SANDBOX = "1";
    #NVD_BACKEND = "direct";
   #};

  environment.systemPackages = with pkgs; [
     pkgs.polkit_gnome
     polkit
     nvidia-vaapi-driver
     steam
     bottles
     ntfs3g
     pavucontrol
     cloudflare-warp
     git
     wget
     pkgs.wine
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}

