return {
    'mileszs/ack.vim',
    lazy = false,
    config = function()
        vim.g.ackprg = 'rg --vimgrep --type-not sql --smart-case'
        vim.g.ack_autoclose = 1
        vim.g.ack_use_cword_for_empty_search = 1
        vim.cmd("abbreviate Ack Ack!")

        vim.keymap.set("n", "<leader>/", ":Ack!<Space>")

        vim.keymap.set("n", "<silent> [q", ":cprevious<CR>")
        vim.keymap.set("n", "<silent> ]q", ":cnext<CR>")
    end
}
