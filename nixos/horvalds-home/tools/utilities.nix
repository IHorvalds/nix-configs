{ lib, config, ... }:
{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      theme = "Monokai Pro Spectrum";
      font-size = 10;
      font-family = "Fira Code";
    };
  };

  programs.neovim = {
    enable = true;
    
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      gh_key = {
        hostname = "github.com";
        user = "git";
        identityFile = "${config.home.homeDirectory}/.ssh/gh_fedora_mbp13";
      };
      pistachio = {
        hostname = "pistachio.taylorlab.home";
        user = "horvalds";
        identityFile = "${config.home.homeDirectory}/.ssh/pistachio";
      };
    };
  };
}
