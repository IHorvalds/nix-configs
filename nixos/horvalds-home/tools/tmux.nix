{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    newSession = true;
    extraConfig = ''
      set-option -sg escape-time 10
      set -g status-position top
    '';
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.nord
    ];
  };
}
