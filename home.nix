
{ config, pkgs, ... }:


{
   home.username = "nixos";
   home.homeDirectory = "/home/nixos";
   home.stateVersion = "26.05";
  
   home.packages = with pkgs; [
	git
	vim
        starship
	firefox
	alacritty
        capitaine-cursors
        bibata-cursors
	curl
	fastfetch
        lact
	htop
	btop
	neovim
        feh
        thunar
        polybar
        zapret
        nerd-fonts.jetbrains-mono
        rofi
	dunst
        discord
  	picom
	sxhkd
	flameshot
        papirus-icon-theme
	fish
	wget
     ];

     programs.bash = {
	enable = true;
	shellAliases = {
	   rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
     };
     initExtra = ''
	eval "$(starship init bash)"
      '';
   };

     home.file.".Xresources".text = ''
	Xcursor.theme: Bibata-Modern-Classic
	Xcursor.size: 18
      '';	


     programs.home-manager.enable = true;
   }


