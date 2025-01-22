{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.users.horvalds = {
    home.stateVersion = "24.11";

    nixpkgs.config.allowUnfree = true;

    home.file = {};

    programs.home-manager.enable = true;

    programs.bash = {
      enable = true;
      bashrcExtra = builtins.readFile ./tools/cool-bash-prompt.sh;
    };

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    imports = [
      ./tools/git.nix
      ./tools/compilers.nix
      ./tools/utilities.nix
      ./tools/extra-packages.nix
      ./tools/tmux.nix
      ./tools/vscode.nix
      ./tools/easy-effects.nix
      ./tools/kmonad.nix
    ];
  };
}
