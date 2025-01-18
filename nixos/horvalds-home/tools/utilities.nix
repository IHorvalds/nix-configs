{ ... }:
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
  };
}
