{
  nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
 };

  nix.settings = {
    substituters = [
       "https://nixos-cache-proxy.cofob.dev"
       "https://cache-nixos.org"
    ];
    http-connections = 128;
    max-substitution-jobs = 128;
  };

  nix.settings = {
    auto-optimise-store = true;
    max-jobs = "auto";
    cores = 8;
 };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.flatpak.enable = true;

  services.lact = {
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  users.users.nixos = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "audio" "groups" "libvirtd"  ];
  };
}
