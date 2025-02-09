{ pkgs, ...}:

{
  home.packages = with pkgs; [
    cheese
    whatsapp-for-linux
    discord
    obsidian

    bat

    wezterm
    fzf-make
    fzf-git-sh
  ];
}
