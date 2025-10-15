return { -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        { "j-hui/fidget.nvim", opts = {} }, { "folke/neodev.nvim", opts = {} },
        { "saghen/blink.cmp" }
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
            qmlls = {
                cmd = { (function()
                    local handle = assert(io.popen(
                        'locate -e bin/qmlls | grep -E -ve "(sysroot)|(debug)" | grep -E "(^/usr)|(Tools)" | head -n 1'))
                    local output = assert(handle:read("*a"))

                    handle:close()

                    return string.gsub(output, "\n", "")
                end)() }
            },
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

        local caps = require("blink.cmp").get_lsp_capabilities()
        for srv, val in pairs(servers) do
            val.capabilities = caps
            vim.lsp.config(srv, (val or { capabilities = caps }))
            vim.lsp.enable(srv)
        end
    end,
    opts = { features = { inlay_hints = { enabled = true } } }
}
