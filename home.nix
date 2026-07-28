{ config, pkgs, ... }:


{
   home.username = "nixos";
   home.homeDirectory = "/home/nixos";
   home.stateVersion = "26.05";

   home.packages = with pkgs; [
	git
	vim
	firefox
	alacritty
	curl
	fastfetch
	htop
	btop
	neovim
        polybar
        rofi
	dunst
	picom
	sxhkd
	flameshot
	discord
	steam
	fish
	wget
     ];

     programs.bash = {
	enable = true;
	shellAliases = {
	   rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
       };
     };


     programs.home-manager.enable = true;
   }
