{ config, pkgs, ... }:

{
  services.xserver.windowManager.bspwm = {
    enable = true;
    configFile = pkgs.writeShellScript "bspwmrc" ''
      #!/usr/bin/env bash

      ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &
  
      exec > ~/.cache/bspwmrc.log 2>&1
      set -x

      alacritty &

      #pgrep -x sxhkd > /dev/null || sxhkd &
      
      sxhkd &

      xset s off
      xset -dpms
      xset s noblank

      xsetroot -solid "#2E3440" &

      nvidia-settings -a CurrentMetaMode = "DP-4: 2560x1440_240 #HDMI-0: 1920x1080_180 { ForceFullCompositionPipeline = On }"

      feh --bg-scale ~/Downloads/mountains.jpg

      #xrandr --output DP-4 --mode 2560x1440 --rate 240 --primary
      #xrandr --output HDMI-0 --mode 1920x1080 --rate 180 --right-of DP-4 
 
      bspc monitor -d 1 2 3 4 5 6 7 8 9
 
      bspc config border_width          2
      bspc config window_gap            10


      bspc config split_ratio           0.5
      bspc config borderless_monocle    true
      bspc config gapless_monocle       true
      bspc config focus_follows_pointer true     

      #polybar left & polybar center & polybar right &
    '';

  };
   
}
