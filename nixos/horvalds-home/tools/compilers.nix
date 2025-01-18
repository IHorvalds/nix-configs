{ config, lib, pkgs, ... }:
{
  programs.go = {
    enable = true;
    telemetry = {
      mode = "off";
    };
  };
}
