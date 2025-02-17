-- Open new empty buffer, close previous one.
-- Useful for when you mistype a file name and you don't want to create a new one
vim.keymap.set("n", "<C-q>", ":enew | bd#<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize panes
vim.keymap.set("n", "<leader><", "<C-w><", { desc = "Resize pane left" })
vim.keymap.set("n", "<leader>>", "<C-w>>", { desc = "Resize pane right" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Even horizontal split" })

-- Move, close, navigate tabs
vim.keymap.set("n", "<M-a><shift><left>", ":tabprevious<CR>", { desc = "Move to previous tab" })
vim.keymap.set("n", "<M-a><shift><right>", ":tabnext<CR>", { desc = "Move to next tab" })
vim.keymap.set("n", "<M-a>x", ":tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<M-a><shift>n", ":tabnew<CR>", { desc = "Open new tab" })

-- Move, close buffers
vim.keymap.set("n", "<M-a><left>", ":b#<CR>", { desc = "Navigate to previous buffer" })
vim.keymap.set("n", "<M-a><right>", ":bn<CR>", { desc = "Navigate to next buffer" })
vim.keymap.set("n", "<M-a>l", ":buffers<CR>", { desc = "Show buffers" })

-- Move between words simpler
vim.keymap.set("n", "<leader>l", "e", { desc = "Simpler map to end of word" })
vim.keymap.set("n", "<leader>h", "b", { desc = "Simpler map to beginning of word" })
