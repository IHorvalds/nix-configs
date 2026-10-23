vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" })
-- Show me those trailing spaces
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "red", ctermbg = "red" })
	end
})

local function set_trailiang_whitespace_match()
	local is_float = vim.api.nvim_win_get_config(0).relative ~= ""
	local is_editing_window = not is_float and vim.bo.buftype == ''
	local match_id = vim.w.trailing_whitespace_match

	if is_editing_window and not match_id then
		vim.w.trailing_whitespace_match = vim.fn.matchadd("TrailingWhitespace", [[\s\+\%#\@<!$]])
	elseif not is_editing_window and match_id then
		pcall(vim.fn.matchdelete, match_id)
		vim.w.trailing_whitespace_match = nil
	end
end

vim.api.nvim_create_autocmd({ "VimEnter", "WinNew", "BufWinEnter" }, {
	callback = set_trailiang_whitespace_match })

vim.cmd("colorscheme kanagawa")
