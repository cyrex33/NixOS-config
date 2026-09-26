{ config, ... }:

{
  hardware.graphics.enable = true;
 
  hardware.nvidia = {
        modesetting.enable = true;
        open = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
 };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.sessionVariables = {
     __GL_SYNC_DISPLAY_DEVICE = "DP-4";
     __GL_VDPAU_LOG_FLUSH = "1";
     __GL_SYNC_TO_VBLANK = "0";
    MOZ_DISABLE_RDD_SANDBOX = "1";
    NVD_BACKEND = "direct";
 };
}
