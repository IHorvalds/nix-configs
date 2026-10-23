vim.lsp.config("lua_ls", {
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".stylua" },
	settings = {
		Lua = {
			codelens = { enable = true },
			diagnostics = { globals = { "vim" } }
		}
	}
})
vim.lsp.enable({ "lua_ls" })
