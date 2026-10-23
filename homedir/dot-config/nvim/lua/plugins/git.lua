--[[
-- Add git-signs and git blame
--]]
vim.pack.add({
	{
		src = "https://github.com/f-person/git-blame.nvim",
		name = "git-blame"
	},
	{
		src = "https://github.com/lewis6991/gitsigns.nvim"
	}
})

require("gitblame").setup({
	enabled = true,
})

local gitsigns = require("gitsigns")
gitsigns.setup({
	on_attach = function(bufnr)
		-- Actions
		vim.keymap.set("n", "<leader>ghs", gitsigns.stage_hunk)
		vim.keymap.set("n", "<leader>ghr", gitsigns.reset_hunk)

		vim.keymap.set("v", "<leader>ghs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		vim.keymap.set("v", "<leader>ghr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		vim.keymap.set("n", "<leader>ghS", gitsigns.stage_buffer)
		vim.keymap.set("n", "<leader>ghR", gitsigns.reset_buffer)
		vim.keymap.set("n", "<leader>ghp", gitsigns.preview_hunk)
		vim.keymap.set("n", "<leader>ghi", gitsigns.preview_hunk_inline)

		vim.keymap.set("n", "<leader>ghb", function()
			gitsigns.blame_line({ full = true })
		end)

		vim.keymap.set("n", "<leader>ghd", gitsigns.diffthis)

		vim.keymap.set("n", "<leader>ghD", function()
			gitsigns.diffthis(".")
		end)
	end
})

local function trim(s)
	return s:match("^%s*(.-)%s*$")
end

vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle Git Blame" })
vim.keymap.set("n", "<leader>sh", function()
		local h = vim.fn.system({ "git", "rev-parse", "--short", "HEAD" })
		vim.fn.setreg("c", trim(h))
	end,
	{ desc = "Git short revision" }
)
vim.keymap.set("n", "<leader>hh", function()
		local h = vim.fn.system({ "git", "rev-parse", "HEAD" })
		vim.fn.setreg("c", trim(h))
	end,
	{ desc = "Git revision" }
)
