{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
      font-size = 10;
      font-family = "Monaspace";
    };
  };

  programs.neovim = {
    enable = true;
    
  };

  programs.ssh = {
    enable = true;
    matchBlocks."<home.username>".identitiesOnly = true;
  };

  # Extra utilities
  # home.packages = home.packages ++ [
  #   pkgs.vcpkg
  #   pkgs.linuxKernel.packages.linux_zen.xpadneo
  #   pkgs.plymouth
  #   pkgs.catppuccin-plymouth
  # ];
}
