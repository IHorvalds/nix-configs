return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup()

		-- Document existing key chains
		require("which-key").add({
			{ "<leader>c", name = "[C]ode", desc = "which_key_ignore" },
			{ "<leader>d", name = "[D]ocument", desc = "which_key_ignore" },
			{ "<leader>r", name = "[R]ename", desc = "which_key_ignore" },
			{ "<leader>s", name = "[S]earch", desc = "which_key_ignore" },
			{ "<leader>w", name = "[W]orkspace", desc = "which_key_ignore" },
			{ "<leader>t", name = "[T]oggle", desc = "which_key_ignore" },
			{ "<leader>h", name = "Git [H]unk", desc = "which_key_ignore" },
		})
		-- visual mode
		require("which-key").add({
			mode = { "v" },
			{ "<leader>h", desc = "Git [H]unk" },
		})
	end,
}
