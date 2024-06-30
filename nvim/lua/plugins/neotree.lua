return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,
			use_libuv_file_watcher = false,
		})

		vim.keymap.set("n", "<leader>b", ":Neotree filesystem toggle left<CR>", {})
		vim.cmd(":Neotree filesystem reveal left")
	end,
}