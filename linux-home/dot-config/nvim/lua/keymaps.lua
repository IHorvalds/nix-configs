-- Open new empty buffer, close previous one.
-- Useful for when you mistype a file name and you don't want to create a new one
vim.keymap.set("n", "<C-q>", ":enew | bd#<CR>")

-- Diagnostic keymaps
local goto_diag = function(jump)
    return function()
        vim.diagnostic.jump({ count = jump, float = true })
    end
end

vim.keymap.set("n", "[d", goto_diag(-1), { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", goto_diag(1), { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Leftover from kickstart
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Default indentation
vim.keymap.set("n", "<leader><S-f>", "gg=G", { desc = "Apply default indentation to entire buffer" })

-- Move between splits
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize panes < >
vim.keymap.set("n", "<leader><", "<C-w><", { desc = "Resize pane left" })
vim.keymap.set("n", "<leader>>", "<C-w>>", { desc = "Resize pane right" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Even horizontal split" })

-- Move, close, navigate tabs
vim.keymap.set("n", "th", ":tabprevious<CR>", { desc = "Move to previous tab" })
vim.keymap.set("n", "tl", ":tabnext<CR>", { desc = "Move to next tab" })
vim.keymap.set("n", "tc", ":tabclose<CR>", { desc = "Close current tab" })

-- Move, close, navigate buffers
vim.keymap.set("n", "bh", ":BufferPrevious<CR>", { desc = "Move to previous buffer" })
vim.keymap.set("n", "bl", ":BufferNext<CR>", { desc = "Move to next buffer" })
vim.keymap.set("n", "bcc", ":BufferClose<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "bca", ":BufferCloseAll <bar> BufferClose<CR>", { desc = "Close all buffers" })
vim.keymap.set("n", "bco", ":BufferCloseAllButCurrentOrPinned<CR>", { desc = "Close all other buffers except pinned" })

-- Move between words simpler
vim.keymap.set("n", "<leader>l", "e", { desc = "Simpler map to end of word" })
vim.keymap.set("n", "<leader>h", "b", { desc = "Simpler map to beginning of word" })

-- Quickfix list
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { desc = "Close quick fix list" })
vim.keymap.set("n", "<leader>co", ":copen<CR>", { desc = "Open quick fix list" })
vim.keymap.set("n", "<leader>cn", ":cnext<CR>", { desc = "Next entry in quick fix" })
vim.keymap.set("n", "<leader>cp", ":cprev<CR>", { desc = "Previous entry in quick fix" })

-- Overscroll
vim.keymap.set("n", "j", function()
    if vim.fn.line(".") == vim.fn.line("$") then
        return "<c-e>"
    else
        return "<down>"
    end
end, { remap = true, expr = true, desc = "Overscroll" })

-- Add parentheses, quotes, double quotes and backticks on selection
vim.keymap.set("v", "<leader>(", "c(<C-c>pa)<C-c>", { desc = "Add parentheses around selection" })
vim.keymap.set("v", "<leader>[", "c[<C-c>pa]<C-c>", { desc = "Add square brackets around selection" })
vim.keymap.set("v", "<leader>{", "c{<C-c>pa}<C-c>", { desc = "Add brackets around selection" })
vim.keymap.set("v", '<leader>"', 'c"<C-c>pa"<C-c>', { desc = "Add double quotes around selection" })
vim.keymap.set("v", "<leader>'", "c'<C-c>pa'<C-c>", { desc = "Add quotes around selection" })
vim.keymap.set("v", "<leader>`", "c`<C-c>pa`<C-c>", { desc = "Add backticks around selection" })
