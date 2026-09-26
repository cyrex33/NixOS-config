{ pkgs, ... }:

{
   home.username = "nixos";
   home.homeDirectory = "/home/nixos";
   home.stateVersion = "26.05";

   home.sessionVariables = {
     PATH = "$HOME/.local/bin:$PATH";
   };
  
   home.packages = with pkgs; [
	git
	vim
	firefox
	alacritty
        capitaine-cursors
        lufus
        telegram-desktop
        #legcord
        gamescope
        gamescope-wsi
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
	flameshot
    papirus-icon-theme
	fish
	wget
     ];
     
     xdg.configFile = {
 	 "alacritty/alacritty.toml".source = ./dotfiles/alacritty/alacritty.toml;
 	 "picom/picom.conf".source = ./dotfiles/picom/picom.conf;
         "fish/config.fish".source = ./dotfiles/fish/config.fish; 
	 "polybar/config.ini".source = ./dotfiles/polybar/config.ini;
 	 "rofi/config.rasi".source = ./dotfiles/rofi/config.rasi;
 	 "rofi/winter.rasi".source = ./dotfiles/rofi/winter.rasi;
      };

     home.file.".Xresources".text = ''
	Xcursor.theme: Bibata-Modern-Classic
	Xcursor.size: 20
      '';	


     programs.home-manager.enable = true;
   }


