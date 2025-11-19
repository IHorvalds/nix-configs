" Theme
if has("termguicolors")
  set termguicolors
endif

let g:codedark_transparent=1
let g:codedark_italics=1
colorscheme codedark

" Status line
let g:airline_theme="codedark"
let g:airline_powerline_fonts=1

" Move key
let g:move_key_modifier_visualmode='C'

" NERDTree and lf
let g:NERDTreeHijackNetrw=0
let g:lf_replace_netrw=1
let g:lf_map_keys=0
let g:lf_command_override='lf -command "set hidden"'
