{ config, pkgs, ... }:

{
  programs.gamemode.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  powerManagement.cpuFreqGovernor = "performance";

    services.lact = {
    enable = true;
  };
}

