" Auto install VimPlug and install the plugins
if empty(glob(g:vimCfgDir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.g:vimCfgDir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'crusoexia/vim-monokai'
Plug 'rust-lang/rust.vim'
Plug 'bling/vim-bufferline'
Plug 'yukimura1227/vim-yazi'
Plug 'voldikss/vim-floaterm'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-commentary'
Plug 'romainl/vim-cool'
Plug 'matze/vim-move'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'mileszs/ack.vim'
Plug 'mbbill/undotree'
Plug 'thinca/vim-breadcrumbs'

" LSP configurations
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'preservim/tagbar'

" Debug adapter
let g:vimspector_enable_mappings = 'HUMAN'
Plug 'puremourning/vimspector'

" mnemonic 'di' = 'debug inspect'
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

call plug#end()
