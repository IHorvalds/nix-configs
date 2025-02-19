return { -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim", {"nvim-telescope/telescope-ui-select.nvim"},
        {"nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font}
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {require("telescope.themes").get_dropdown()}
            }
        })

        -- Enable Telescope extensions if they are installed
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
        pcall(require("telescope").load_extension, "grep_string")

        -- See `:help telescope.builtin`
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>f", function()
            builtin.find_files({cwd = os.getenv("PWD")})
        end, {desc = "[S]earch [F]iles"})
        vim.keymap.set("n", "<leader>ss", builtin.builtin,
                       {desc = "[S]earch [S]elect Telescope"})
        vim.keymap.set("n", "<leader>sw", function()
            builtin.grep_string({search = vim.fn.input("Grep > ")})
        end, {desc = "[S]earch current [W]ord"})
        vim.keymap.set("n", "<leader>sg", builtin.live_grep,
                       {desc = "[S]earch by [G]rep"})
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics,
                       {desc = "[S]earch [D]iagnostics"})
        vim.keymap.set("n", "<leader>sr", builtin.resume,
                       {desc = "[S]earch [R]esume"})
        vim.keymap.set("n", "<leader>s.", builtin.oldfiles,
                       {desc = '[S]earch Recent Files ("." for repeat)'})
        vim.keymap.set("n", "<leader><leader>", builtin.buffers,
                       {desc = "[ ] Find existing buffers"})

        vim.keymap.set("n", "<C-f>", function()
            builtin.current_buffer_fuzzy_find(
                require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false
                }))
        end, {desc = "Fuzzily search in current buffer"})

        vim.keymap.set("n", "<leader>s/", function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files"
            })
        end, {desc = "Search in Open Files"})

    end
}
