{ config, pkgs, ...}:
{
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.powerline-fonts
  ];
}
