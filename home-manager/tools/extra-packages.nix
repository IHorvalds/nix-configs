{ config, lib, pkgs, ...}: 

{
  home.packages = [
    pkgs.firefox
    pkgs.stow
    pkgs.vcpkg

    pkgs.transmission_4
    pkgs.vlc
    pkgs.protonvpn-gui
    pkgs.vscode # todo: configure vscode key bindings and settings

    pkgs.nerd-fonts.monaspace
    pkgs.linuxKernel.packages.linux_zen.xpadneo
  ];
}
