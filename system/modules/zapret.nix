{ config, pkgs, ... }:

{
  systemd.services.zapret = {
    description = "Zapret (Discord/YouTube)";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "/home/nixos/zapret-discord-youtube-linux/service.sh start";
      ExecStop = "/home/nixos/zapret-discord-youtube-linux/service.sh stop";
      Restart = "always";
      RestartSec = 10;
    };
  };
}
