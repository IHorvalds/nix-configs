" Theme
if has("termguicolors")
	set termguicolors
endif

let g:codedark_transparent=1
let g:codedark_italics=1
colorscheme codedark

" Status line
let g:airline_theme="base16_snazzy"
let g:airline_powerline_fonts=1

" Move key
let g:move_key_modifier_visualmode='C'

" Highlight trailing whitespace to make it painfully visible
highlight TrailingWhitespace ctermbg=red guibg=red
augroup trailing_ws
	autocmd!
	autocmd ColorScheme * highlight TrailingWhitespace ctermbg=red guibg=red
	autocmd VimEnter,WinNew * if !exists('w:trailing_ws')
		\ | let w:trailing_ws = matchadd('TrailingWhitespace', '\s\+$') | endif
augroup END
