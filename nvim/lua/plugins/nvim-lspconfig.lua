return { -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        { "j-hui/fidget.nvim", opts = {} }, { "folke/neodev.nvim", opts = {} }
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach",
                { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func,
                        { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("gd", require("telescope.builtin").lsp_definitions,
                    "[G]oto [D]efinition")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map("gr", require("telescope.builtin").lsp_references,
                    "[G]oto [R]eferences")
                map("gi", require("telescope.builtin").lsp_implementations,
                    "[G]oto [I]mplementation")
                map("gt", require("telescope.builtin").lsp_type_definitions,
                    "Type [D]efinition")

                map("<leader><S-o>",
                    require("telescope.builtin").lsp_document_symbols,
                    "[D]ocument [S]ymbols")

                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and
                    client.server_capabilities.documentHighlightProvider then
                    local highlight_augroup =
                        vim.api.nvim_create_augroup("kickstart-lsp-highlight",
                            { clear = false })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" },
                        {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references
                        })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup(
                            "kickstart-lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({
                                group = "kickstart-lsp-highlight",
                                buffer = event2.buf
                            })
                        end
                    })
                end


                -- Diagnostic position
                vim.diagnostic.config({ virtual_lines = true })

                -- The following autocommand is used to enable inlay hints in your
                -- code, if the language server you are using supports them
                if client and client.server_capabilities.inlayHintProvider and
                    vim.lsp.inlay_hint then
                    -- Enable inlay hints by default
                    vim.lsp.inlay_hint.enable = true
                    map("<leader>th", function()
                        vim.lsp.inlay_hint.enable =
                            not vim.lsp.inlay_hint.is_enabled({})
                    end, "[T]oggle Inlay [H]ints")
                end
            end
        })

        -- LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP specification.
        --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require(
            "cmp_nvim_lsp").default_capabilities())

        local servers = {
            lua_ls = {
                cmd = { "lua-language-server" },
                settings = {
                    Lua = {
                        completion = { callSnippet = "Replace" },
                    }
                }
            },
            gopls = {},
            pylsp = { cmd = { "pylsp" } },
            rust_analyzer = {},
            ts_ls = {},
            qmlls = { cmd = { os.getenv("HOME") .. "/Qt/6.8.3/gcc_64/bin/qmlls" } },
            cmake = {
                cmd = { "cmake-language-server" },
                filetypes = { "cmake", "CMakeLists.txt" }
            },
            clangd = {
                on_attach = function()
                    vim.keymap.set("n", "<leader>o",
                        ":ClangdSwitchSourceHeader<CR>")
                    vim.keymap
                        .set("n", "<leader>i", ":ClangdShowSymbolInfo<CR>")
                end
            }
        }

        local lspcfg = require("lspconfig")
        for srv, val in pairs(servers) do
            lspcfg[srv].setup(val or {})
        end
    end,
    opts = { features = { inlay_hints = { enabled = true } } }
}
