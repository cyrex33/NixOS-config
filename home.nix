{ pkgs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
  home.stateVersion = "26.05";

  home.sessionPath = [ "$HOME/.local/bin" ];

  home.packages = with pkgs; [
    git
    alacritty
    capitaine-cursors
    lufus
    telegram-desktop
    qbittorrent
    wine
    pavucontrol
    gamescope
    pipx
    mangohud
    easyeffects
    heroic
    vesktop
    bibata-cursors
    protonplus
    curl
    fastfetch
    htop
    btop
    neovim
    feh
    thunar
    polybar
    nerd-fonts.jetbrains-mono
    rofi
    dunst
    picom
    sxhkd
    #flameshot
    papirus-icon-theme
    wget
  ];

  home.file."Pictures/wallpapers".source = ./assets/wallpapers;

  xdg.configFile = {
    "alacritty/alacritty.toml".source = ./dotfiles/alacritty/alacritty.toml;
    "picom/picom.conf".source = ./dotfiles/picom/picom.conf;
    #"fish/config.fish".source = ./dotfiles/fish/config.fish;
    "polybar/config.ini".source = ./dotfiles/polybar/config.ini;
    "rofi/config.rasi".source = ./dotfiles/rofi/config.rasi;
    "rofi/winter.rasi".source = ./dotfiles/rofi/winter.rasi;
  };

  programs.fish = {
    enable = true;
    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
  ];
  interactiveShellInit = ''
    fastfetch
  '';
  };

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
    x11.enable = true;
    gtk.enable = true;
  };

  programs.home-manager.enable = true;
}
