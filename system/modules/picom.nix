{ config, pkgs, ... }:

{
  services.picom = {

    # Базовые опции
    backend = "glx";
    vSync = true;

    # Прозрачность
    inactiveOpacity = 0.95;
    activeOpacity = 1.0;
    opacityRules = [
      "100:class_g == 'Alacritty'"
      "100:class_g == 'Rofi'"
      "95:class_g == 'Firefox'"
    ];

    # ВСЕ остальные настройки — только через settings
    settings = {
      # Тени
      shadow = true;
      shadow-radius = 12;
      shadow-offset-x = -5;
      shadow-offset-y = -5;
      shadow-opacity = 0.4;
      shadow-exclude = [
        "class_g ?= 'Polybar'"
        "class_g ?= 'Rofi'"
        "class_g ?= 'Alacritty'"
      ];

      # Плавность
      fading = true;
      fade-delta = 5;
      fade-in-step = 0.03;
      fade-out-step = 0.03;

      # Закругление углов
      corner-radius = 0.0;
      rounded-corners-exclude = [
        "class_g ?= 'Polybar'"
      ];

      # Производительность
      xrender-sync-fence = true;
      glx-no-stencil = true;
      use-damage = true;
    };
  };
}
