
{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
      ../../system/modules/bspwm.nix
      ../../system/modules/sxhkd.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 1;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  nix.gc = {
	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 14d";
};  
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager.dns = "none";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  networking.networkmanager.enable = true;
  #networking.useDHCP = true;
  networking.networkmanager.wifi.powersave = false;
  #networking.enableIPv6 = false;
  networking.networkmanager.wifi.scanRandMacAddress = false;
  #networking.wireless.athUserRegulatoryDomain = "RU";

  #networking.networkmanager.settings = {
    #device = {
      #"wifi.scan-rand-mac-address" = "no";
    #};
    #connection = {
      #"wifi.bgscan" = "off";
 #};
 #};
  boot.extraModprobeConfig = ''
    options mt76_usb disable_usb_aspm=1
    options mt76_connac_core disable_amsdu=1
    options mt76_core disable_aspm=1
  '';

  hardware.enableRedistributableFirmware = true;

  hardware.pulseaudio.enable = false;
  
  security.rtkit.enable = true;

  #services.resolved.enable = true;

  services.pipewire = {
    enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraLadspaPackages = [ pkgs.deepfilternet ];
  };
  
  hardware.firmware = with pkgs; [ linux-firmware ];
 
  nix.settings = {
    substituters = [
       "https://nixos-cache-proxy.cofob.dev"
       "https://cache-nixos.org"
    ];
    http-connections = 128;
    max-substitution-jobs = 128;
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
 };	

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  programs.gamemode.enable = true;

  nix.settings = {
    auto-optimise-store = true;
    max-jobs = "auto";
    cores = 8;
 };

  boot.cleanTmpDir = true;

  time.timeZone = "Europe/Moscow";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
  security.polkit.enable = true;

  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      # pkgs.xdg-desktop-portal-wlr  # For wlroots/sway/etc. if needed
    ];
    config.common.default = "gtk";
  };

  fonts.packages = with pkgs; [
	jetbrains-mono
  ];


  hardware.nvidia = {
        modesetting.enable = true;
        open = false;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
 };
  
  environment.sessionVariables = {
  __GL_SYNC_DISPLAY_DEVICE = "DP-4"; 
  __GL_VDPAU_LOG_FLUSH = "1";
  __GL_SYNC_TO_VBLANK = "0";
 };
  
  fileSystems."/mnt/storage" = {
       device = "/dev/sda3";
       fsType = "ext4";
       options = [ "defaults" "nofail" "exec" ];
 };

  services.xserver = {
     enable = true;
     displayManager.sddm.enable = true;
     desktopManager.xfce.enable = false;
     videoDrivers = [ "nvidia" ];

     displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --mode 2560x1440 --rate 240.00
  '';
  };

  services.lact = {
    enable = true;
  };

  services.xserver.libinput = {
    enable = true;
    mouse = {
	accelProfile = "flat";
	accelSpeed = "0";
	naturalScrolling = false;
   };
 }; 
  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  users.users.nixos = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "audio" "groups" "libvirtd"  ]; # Enable ‘sudo’ for the user.
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true; 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.sessionVariables = {
    MOZ_DISABLE_RDD_SANDBOX = "1";
    NVD_BACKEND = "direct";
   };

  environment.systemPackages = with pkgs; [
     pkgs.polkit_gnome
     polkit
     nvidia-vaapi-driver
     steam
     bottles
     ntfs3g
     pavucontrol
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

