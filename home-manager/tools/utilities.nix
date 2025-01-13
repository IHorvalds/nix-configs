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
}
