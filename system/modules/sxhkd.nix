{ pkgs, ... }:

{
  services.xserver.windowManager.bspwm.sxhkd = {
    configFile = pkgs.writeShellScript "sxhkdrc" ''

      super + shift + r
        bspc wm -r

      super + Return
        alacritty

      super + d
        rofi -show drun

      super + q
        bspc node -c

      super + c
        bspc node -k

      super + f
        bspc node -t fullscreen

      super + t
        bspc node -t tiled

      super + space
        bspc node -t floating

      super + {1-9}
        bspc desktop -f {1-9}

      super + shift + {1-9}
        bspc node -d {1-9}

      super + h
        bspc node -f west

      super + j
        bspc node -f south

      super + k
        bspc node -f north

      super + l
        bspc node -f east

      super + shift + h
        bspc node -s west

      super + shift + j
        bspc node -s south

      super + shift + k
        bspc node -s north

      super + shift + l
        bspc node -s east
    '';
  };
}
