-- open a terminal window in the $cwd
vim.keymap.set(
    "",
    "<leader>`",
    "<ESC><cmd>split<CR> | <cmd>res 15<CR> | <cmd>term<CR>i",
    { desc = "Open terminal in cwd" }
)
