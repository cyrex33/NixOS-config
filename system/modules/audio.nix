{ pkgs, ... }:

{
  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraLadspaPackages = [ pkgs.deepfilternet ];
  };
}
