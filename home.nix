{ config, pkgs, ... }:


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
     
     services = {
       polybar = {
         enable = true;
         script = "polybar main &";
     };

     }; 
     #programs.bash = {
	#enable = true;
	#shellAliases = {
	   #rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
     #};
     #initExtra = ''
	#eval "$(starship init bash)"
      #'';
   #};

     home.file.".Xresources".text = ''
	Xcursor.theme: Bibata-Modern-Classic
	Xcursor.size: 20
      '';	


     programs.home-manager.enable = true;
   }


