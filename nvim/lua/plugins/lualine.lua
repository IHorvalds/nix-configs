return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"f-person/git-blame.nvim",
		"olivercederborg/poimandres.nvim",
	},
	opts = {
		theme = "poimandres",
	},
	config = function()
		vim.g.gitblame_display_virtual_text = 0
		local git_blame = require("gitblame")

		require("lualine").setup({
			sections = {
				lualine_c = {
					{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
				},
			},
		})
	end,
}
