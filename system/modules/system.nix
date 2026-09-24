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
  };

  nix.settings = {
    auto-optimise-store = true;
    max-jobs = "auto";
 };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.flatpak.enable = true;

  nixpkgs.config.allowUnfree = true;

  users.users.nixos = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "audio" "libvirtd"  ];
  };
}
