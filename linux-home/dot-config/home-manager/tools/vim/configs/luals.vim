if executable('lua-language-server')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'lua-laguage-server',
        \ 'cmd': {server_info->['lua-language-server']},
        \ 'allowlist': ['lua'],
        \ })
endif

