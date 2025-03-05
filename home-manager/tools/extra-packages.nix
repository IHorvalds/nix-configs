{ pkgs, ...}:

{
  home.packages = with pkgs; [
    cheese
    whatsapp-for-linux
    discord
    obsidian

    bat
    devenv
    direnv
    glade

    ghostty
    fzf-make
    fzf-git-sh

    # JetBrains editors. They're good
    jetbrains.rust-rover
    jetbrains.clion
  ];
}
