{ pkgs, ...}:

{
  home.packages = with pkgs; [
    cheese
    whatsapp-for-linux
    discord
    obsidian

    bat
    devenv

    ghostty
    fzf-make
    fzf-git-sh
  ];
}
