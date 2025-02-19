return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "bash", "c", "cpp", "go", "diff", "html", "lua", "luadoc",
            "markdown", "vim", "vimdoc", "json"
        },
        auto_install = true
    },
    config = function(_, opts)
        require("nvim-treesitter.install").prefer_git = true
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup(opts)
    end
}
