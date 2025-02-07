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
    settings = {
      expandtab = true;
      ignorecase = true;
      mouse = "a";
      relativenumber = true;
      shiftwidth = 2;
      smartcase = true;
      tabstop = 2;
      undofile = true;
      undodir = [ "/tmp/" ];
    };
    extraConfig = ''
      nnoremap <SPACE> <Nop>
      let g:mapleader = " "
      set listchars = "tab:» ","trail:·","nbsp=␣"
      set autochdir
      set hlsearch
      set noshowmode
      let g:airline_theme = "nord"
      let g:airline_powerline_fonts = 1
      colorscheme nord
      let g:NERDTreeHijackNetrw = 0
      let g:lf_replace_netrw = 1 

      map <Leader>b :NERDTreeToggle<CR>
      map <Leader><S-f> gg=G
    '';

  };
}
