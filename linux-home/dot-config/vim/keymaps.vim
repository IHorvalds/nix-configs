" Keymaps
map <Leader><Leader> :Buffers<CR>
map <C-p> :Files<CR>
map <C-f> :BLines<CR>
map <Leader>f :LfNewTab<CR>
map <Leader>b :NERDTreeToggle<CR>
map <Leader><S-f> gg=G
nmap <C-a> ggVG

" Tabs
nmap th :tabprevious<CR>
nmap tl :tabnext<CR>
nmap tc :tabclose<CR>

" Buffers
nmap bh :bprevious<CR>
nmap bl :bnext<CR>
nmap bca :%bd<CR>
nmap bco :%bd\|e#<CR>
nmap bcc :bdelete<CR>

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

" Add parentheses, quotes, double quotes and backticks on selection
vnoremap <Leader>( c(<C-r>")<ESC>
vnoremap <leader>[ c[<C-r>"]<ESC>
vnoremap <leader>{ c{<C-r>"}<ESC>
vnoremap <leader>" c"<C-r>""<ESC>
vnoremap <leader>' c'<C-r>"'<ESC>
vnoremap <leader>` c`<C-r>"`<ESC>
