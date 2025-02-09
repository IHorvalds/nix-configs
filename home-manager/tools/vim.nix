{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lf
  ];

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-airline-themes
      vim-bufferline
      vim-go
      vim-toml
      lf-vim
      vim-cool
      vim-move
      nerdtree
      vim-commentary
      vim-devicons
      nord-vim
      vim-fugitive
      fzf-vim

      vim-lsp
      vim-lsp-settings
    ];
    extraConfig = builtins.readFile ./vim/vimrc;
  };


  home.file."vimcfgs" = {
    source = ./vim/configs;
    recursive = true;
  };
}
