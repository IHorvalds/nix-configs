-- Open new empty buffer, close previous one.
-- Useful for when you mistype a file name and you don't want to create a new one
vim.keymap.set("n", "<C-q>", ":enew | bd#<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
               {desc = "Go to previous [D]iagnostic message"})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
               {desc = "Go to next [D]iagnostic message"})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
               {desc = "Show diagnostic [E]rror messages"})
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
               {desc = "Open diagnostic [Q]uickfix list"})

-- Leftover from kickstart
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {desc = "Exit terminal mode"})

-- Default indentation
vim.keymap.set("n", "<leader><S-f>", "gg=G",
               {desc = "Apply default indentation to entire buffer"})

-- Move between splits
vim.keymap.set("n", "<C-h>", "<C-w><C-h>",
               {desc = "Move focus to the left window"})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>",
               {desc = "Move focus to the right window"})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>",
               {desc = "Move focus to the lower window"})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>",
               {desc = "Move focus to the upper window"})

-- Resize panes < >
vim.keymap.set("n", "<leader><", "<C-w><", {desc = "Resize pane left"})
vim.keymap.set("n", "<leader>>", "<C-w>>", {desc = "Resize pane right"})
vim.keymap.set("n", "<leader>=", "<C-w>=", {desc = "Even horizontal split"})

-- Move, close, navigate tabs
vim.keymap.set("n", "th", ":tabprevious<CR>", {desc = "Move to previous tab"})
vim.keymap.set("n", "tl", ":tabnext<CR>", {desc = "Move to next tab"})
vim.keymap.set("n", "tc", ":tabclose<CR>", {desc = "Close current tab"})

-- Move between words simpler
vim.keymap.set("n", "<leader>l", "e", {desc = "Simpler map to end of word"})
vim.keymap.set("n", "<leader>h", "b",
               {desc = "Simpler map to beginning of word"})

-- Quickfix list
vim.keymap
    .set("n", "<leader>cc", ":cclose<CR>", {desc = "Close quick fix list"})
vim.keymap.set("n", "<leader>co", ":copen<CR>", {desc = "Open quick fix list"})

-- Overscroll
vim.keymap.set("n", "<expr>j", "line('.') == line('$') ? '<C-e>' : 'j'")
