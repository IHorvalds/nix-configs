vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
	{ src = "https://github.com/Bekaboo/dropbar.nvim" }
})

require("dropbar").setup({})

local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = group,
	once = true,
	callback = function()
		require("blink.cmp").setup({
			keymap = { preset = "super-tab" },
			appearance = {
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true,
			},
			completion = {
				documentation = { auto_show = true },
				ghost_text = { enabled = vim.g.ai_cmp }
			},
			sources = {
				default = { "lsp", "snippets", "path", "buffer" }
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = { enabled = true }
		})
	end
})
