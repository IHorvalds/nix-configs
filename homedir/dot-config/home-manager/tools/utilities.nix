{ config, ... }:
{
  
  programs.neovim = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "${config.home.homeDirectory}/.ssh/gh_fedora_mbp13";
      };
      "pistachio.taylorlab.home" = {
        hostname = "pistachio.taylorlab.home";
        user = "horvalds";
        identityFile = "${config.home.homeDirectory}/.ssh/pistachio";
      };
    };
  };
}
