{ pkgs, programs, ... }:
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
      lf-vim
      vim-cool
      vim-move
      vim-monokai
      nerdtree
      vim-commentary
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
      let g:mapleader=" "
      set listchars="tab:» ","trail:·","nbsp=␣"
      set autochdir
      set hlsearch
      set noshowmode
      let g:airline_theme="badwolf"
      let g:colorscheme="sortbet"

      map <Leader>b :NERDTreeToggle<CR>
    '';

  };
}
