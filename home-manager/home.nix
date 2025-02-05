{ config, lib, pkgs, ... }:
{
  home.username = "horvalds";
  home.homeDirectory = "/home/horvalds";

  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  home.file = {};

  programs.bash = {
    enable = true;
    bashrcExtra = '' 
      ${builtins.readFile ./tools/bash-aliases.sh}
      ${builtins.readFile ./tools/cool-bash-prompt.sh}
      '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  imports = [
    ./tools/git.nix
    ./tools/compilers.nix
    ./tools/utilities.nix
    ./tools/extra-packages.nix
    ./tools/tmux.nix
    ./tools/vscode.nix
    ./tools/vim.nix
    ./tools/easy-effects.nix
    ./tools/kmonad.nix
    ./fonts/nerdfont.nix
  ];
}
