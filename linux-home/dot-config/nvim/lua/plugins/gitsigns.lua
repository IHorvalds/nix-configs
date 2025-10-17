return { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
        },
    },
    config = function()
        require("gitsigns").setup({
            on_attach = function()
                local gitsigns = require("gitsigns")

                -- Navigation
                vim.keymap.set("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end)

                vim.keymap.set("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end)

                -- Actions
                vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk)
                vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)

                vim.keymap.set("v", "<leader>hs", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)

                vim.keymap.set("v", "<leader>hr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)

                -- Preview
                vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
                vim.keymap.set("n", "<leader>hi", gitsigns.preview_hunk_inline)

                vim.keymap.set("n", "<leader>hd", gitsigns.diffthis)
            end,
        })
    end,
}
