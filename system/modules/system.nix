{
  nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
 };

  nix.settings = {
    substituters = [
       "https://nixos-cache-proxy.cofob.dev"
    ];

    auto-optimise-store = true;
    max-jobs = "auto";
    experimental-features = [ "nix-command" "flakes" ];
  };

  zramSwap = {
    enable = true;
    memoryPercent = 25;
  };

  time.timeZone = "Europe/Moscow";
	
  services.flatpak.enable = true;

  nixpkgs.config.allowUnfree = true;

  users.users.nixos = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "audio" "libvirtd"  ];
  };
}
