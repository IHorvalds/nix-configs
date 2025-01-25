{ pkgs, programs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [];
    settings = {
      expandtab = true;
      ignorecase = true;
      mouse = "a";
      relativenumber = true;
      shiftwidth = 2;
      smartcase = true;
      tabstop = 2;
      undofile = true;
    };
    extraConfig = ''
      set listchars="tab:» ","trail:·","nbsp=␣"
      set autochdir
      set hlsearch
    '';

  };
}
