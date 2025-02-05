{ lib, config, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        dynamic_title = true;
        dimensions = {
          columns = 110;
          lines = 30;
        };
      };

      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Medium";
        };
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
      };
    };
  };

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
