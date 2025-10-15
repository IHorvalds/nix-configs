return {
    "duane9/nvim-rg",
    config = function()
        vim.g.rg_command = "rg --vimgrep --hidden --glob=!.git/*"
        vim.g.rg_map_keys = 0
        vim.keymap.set("n", "<leader>/", ":Rg<space>")
    end
}
