require("plugins.lsp-setup")

require("lsp.luals")
require("lsp.clangd")
require("lsp.rust")
require("lsp.golang")
require("lsp.python")
require("lsp.dockerfile")
require("lsp.bashls")

vim.keymap.set("n", "<leader>ca", vim.diagnostic.open_float)

vim.opt.pumheight = 5
vim.opt.pumborder = "rounded"

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		vim.lsp.inlay_hint.enable(true)

		-- Auto-format ("lint") on save.
		if not client:supports_method('textDocument/willSaveWaitUntil')
		    and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end

		if client and client:supports_method 'textDocument/codeLens' then
			vim.lsp.codelens.enable(true)
		end
	end,
})
