{ config, lib, pkgs, ...}: 

{
  home.packages = [
    pkgs.firefox
    pkgs.stow
    pkgs.waybar
    pkgs.rofi
    pkgs.nerd-fonts.monaspace

    pkgs.vcpkg
    pkgs.linuxKernel.packages.linux_zen.xpadneo
    pkgs.plymouth
    pkgs.catppuccin-plymouth
  ];
}
