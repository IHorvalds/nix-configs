{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "horvalds";
  home.homeDirectory = "/home/horvalds";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  # NixGL packages
  nixGL.packages = import <nixgl> { inherit pkgs; };

  home.file = {
  };

  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    bashrcExtra = ''
function get_git_branch() {
  if [[ ! -z $(git branch --show-current 2> /dev/null) ]]; then
    echo "{ git: $(git branch --show-current 2> /dev/null) }"
  fi
  echo ""
}

PROMPT_COMMAND='PS1_CMD1=$(get_git_branch)'
'' +
"PS1='\\[\\e[38;5;220m\\]\\u\\[\\e[37m\\]@\\[\\e[38;5;208m\\]\\h\\[\\e[0m\\] \\[\\e[37;3m\\]\\W\\[\\e[0m\\]\\[\\e[38;5;45m\\] \${PS1_CMD1}\\[\\e[0m\\]\n\$ '";
  };

  imports = [ 
    ./tools/git.nix 
    ./tools/compilers.nix 
    ./tools/utilities.nix
    ./tools/extra-packages.nix
  ];
}
