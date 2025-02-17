nnoremap <SPACE> <Nop>
let g:mapleader = " "
set listchars = "tab:» ","trail:·","nbsp=␣"
set noautochdir
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
Plug 'mileszs/ack.vim'

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
so ~/vimcfgs/ack.vim

" Keymaps
map <Leader><Leader> :Buffers<CR>
map <C-p> :Files<CR>
map <C-f> :BLines<CR>
map <Leader><C-f> :vimgrep 
map <Leader>f :LfNewTab<CR>
map <Leader>b :NERDTreeToggle<CR>
map <Leader><S-f> gg=G

" Tabs
nmap th :tabprevious<CR>
nmap tl :tabnext<CR>
nmap tc :tabclose<CR>

" Close current split
nmap wc <C-w>c
" Move between splits
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

" Move between words
nmap <Leader>h b
nmap <Leader>l w

" Quickfix list
nmap <Leader>cc :cclose<CR>
nmap <Leader>co :copen<CR>

" Overscroll
nnoremap <expr> j line(".") == line('$') ? '<C-e>':'j'
