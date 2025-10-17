return {
    -- Easy move lines and selections
    "matze/vim-move",
    config = function()
        vim.g.move_key_modifier_visualmode = "C"
    end,
}
