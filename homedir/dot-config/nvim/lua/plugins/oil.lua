vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

local oil = require("oil")
oil.setup({
	columns = {
		"icon",
		"permissions",
		"mtime"
	},
	view_options = {
		show_hidden = true
	},
	float = {
		max_width = 200,
		max_height = 200,
		border = 2
	}
})

vim.keymap.set("n", "<leader>f", oil.open, { desc = "Open Oil window in a float" })
