return {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("poimandres").setup({
            bold_vert_split = true,
            dim_nc_background = true,
        })
    end,
}
