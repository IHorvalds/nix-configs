-- Slightly more than aliases or shortcuts

-- Reopen and write file as sudo because I am stupid
-- and cannot remember where the fuck I am
vim.api.nvim_create_user_command('SudoIamStupid',
	function()
		vim.cmd(":w !sudo tee % >/dev/null")
	end, {})
