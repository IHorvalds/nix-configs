{ pkgs, config, ... }:
rec {
  xdg.enable = true;

  xdg.configFile.kmonadMBP2015Config = {
    source = ./mbp-2015.kbd;
    target = "./kmonad/mbp-2015.kbd";
  };

  systemd.user.services.kmonad = {
    Unit = {
      Description = "Start KMonad service";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };

    Service = {
      ExecStart = "/run/current-system/sw/bin/kmonad ${config.xdg.configHome}/kmonad/mbp-2015.kbd";
    };
  };
}