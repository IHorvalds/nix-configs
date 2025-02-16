nnoremap <SPACE> <Nop>
let g:mapleader = " "
set listchars = "tab:» ","trail:·","nbsp=␣"
set autochdir
set hlsearch
set noshowmode

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'crusoexia/vim-monokai'
Plug 'bling/vim-bufferline'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'romainl/vim-cool'
Plug 'matze/vim-move'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'cespare/vim-toml'
Plug 'nordtheme/vim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'

" LSP configurations
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

set nu
set rnu
set expandtab
set ignorecase
set mouse="a"
set shiftwidth=2
set smartcase
set tabstop=2

set undodir="tmp"
set undofile

colorscheme nord
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
let g:airline_theme="nord"
let g:move_key_modifier_visualmode='C'
let g:airline_powerline_fonts=1
let g:NERDTreeHijackNetrw=0
let g:lf_replace_netrw=1
let g:lf_map_keys=0
let g:lf_command_override='lf -command "set hidden"'
if has("termguicolors")
  set termguicolors
endif

so ~/vimcfgs/language-servers.vim

map <C-p> :Buffers<CR>
map <C-l> :Files<CR>
map <Leader>f :LfNewTab<CR>
map <Leader>b :NERDTreeToggle<CR>
map <Leader><S-f> gg=G
nmap th :tabprevious<CR>
nmap tl :tabnext<CR>
nmap tc :tabclose<CR>

" Overscroll
nnoremap <expr> j line(".") == line('$') ? '<C-e>':'j'
