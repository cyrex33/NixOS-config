{ pkgs, ... }:

{
    "bar/mybar" = {
      width = "100%";
      height = "28px";
      background = "#2E3440";
      foreground = "#ECEFF4";
      border-size = "0px";
      padding-left = 1;
      padding-right = 1;
      module-margin = 1;
      font-0 = "JetBrains Mono:size=10;2";
      modules-left = "bspwm";
      modules-center = "date";
      modules-right = "pulseaudio memory network";
      tray-position = "right";
    };

    "module/bspwm" = {
      type = "internal/bspwm";
      label-focused = "%name%";
      label-focused-background = "#3B4252";
      label-focused-foreground = "#88C0D0";
      label-focused-padding = 2;
      label-occupied = "%name%";
      label-occupied-padding = 2;
      label-empty = "%name%";
      label-empty-foreground = "#4C566A";
      label-empty-padding = 2;
    };

    "module/date" = {
      type = "internal/date";
      interval = 5;
      date = "%H:%M  %d.%m.%Y";
      label = "%date%";
      label-foreground = "#88C0D0";
    };

    "module/pulseaudio" = {
      type = "internal/pulseaudio";
      format-volume = "墳 <label-volume>";
      label-volume = "%percentage%%";
      label-muted = " muted";
      label-muted-foreground = "#4C566A";
    };

    "module/memory" = {
      type = "internal/memory";
      interval = 3;
      format = "<label>";
      label = " %percentage_used%%";
      label-foreground = "#8FBCBB";
    };

    "module/network" = {
      type = "internal/network";
      interface-type = "wireless";
      interval = 5;
      format-connected = "直 <label-connected>";
      label-connected = "%essid%";
      format-disconnected = "睊 disconnected";
      label-disconnected-foreground = "#4C566A";
  };
}
