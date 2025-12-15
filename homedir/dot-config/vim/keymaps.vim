" Keymaps
map <leader><leader> :Buffers<CR>
map <C-p> :Files<CR>
map <C-f> :BLines<CR>
map <leader>f :LfNewTab<CR>
map <leader>b :NERDTreeToggle<CR>
map <leader><S-f> gg=G
nmap <C-a> ggVG
nnoremap <leader>u :UndotreeToggle<CR>

" Tabs
nmap th :tabprevious<CR>
nmap tl :tabnext<CR>
nmap tc :tabclose<CR>

" Buffers
nmap [b :bprevious<CR>
nmap ]b :bnext<CR>
nmap <leader>bca :%bd<CR>
nmap <leader>bco :%bd\|e#<CR>
nmap <leader>bcc :bdelete<CR>

" Move between splits
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

" Move between words
nmap <leader>h b
nmap <leader>l w

" Quickfix list
nmap <leader>cc :cclose<CR>
nmap <leader>co :copen<CR>

" Overscroll
nnoremap <expr> j line(".") == line('$') ? '<C-e>':'j'

" Add parentheses, quotes, double quotes and backticks on selection
vnoremap <leader>( c(<C-r>")<ESC>
vnoremap <leader>[ c[<C-r>"]<ESC>
vnoremap <leader>{ c{<C-r>"}<ESC>
vnoremap <leader>" c"<C-r>""<ESC>
vnoremap <leader>' c'<C-r>"'<ESC>
vnoremap <leader>` c`<C-r>"`<ESC>
