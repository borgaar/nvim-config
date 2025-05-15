vim.g.mapleader = " ";

-- Open file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)

-- Find files
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>fw', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize windows
local smart_splits = require("smart-splits")
vim.keymap.set("n", "<A-k>", function() smart_splits.resize_up(2) end)
vim.keymap.set("n", "<A-j>", function() smart_splits.resize_down(2) end)
vim.keymap.set("n", "<A-h>", function() smart_splits.resize_left(5) end)
vim.keymap.set("n", "<A-l>", function() smart_splits.resize_right(5) end)

-- Swap windows
vim.keymap.set("n", "<leader>h", smart_splits.swap_buf_left)
vim.keymap.set("n", "<leader>j", smart_splits.swap_buf_down)
vim.keymap.set("n", "<leader>k", smart_splits.swap_buf_up)
vim.keymap.set("n", "<leader>l", smart_splits.swap_buf_right)

-- Swap lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor at the start when appending
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Open terminal and navigation out of terminal
vim.keymap.set("n", "<leader>t", ":botright vnew +terminal<CR>", { desc = "Open terminal on the right" })
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { desc = "Move to left window" })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { desc = "Move to below window" })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { desc = "Move to above window" })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { desc = "Move to right window" })
vim.keymap.set('t', '<C-n>', [[<C-\><C-n>]], { desc = "Unfocus" })

-- Open floating terminal
vim.keymap.set("n", "<A-i>", ":FloatermNew --height=0.6 --width=0.6 --wintype=float<CR>",
  { desc = "Open floating terminal" })

-- Flutter
vim.keymap.set("n", "<F5>", ":FlutterRun<CR>", { desc = "Flutter run", silent = true })
vim.keymap.set("n", "<F6>", ":FlutterReload<CR>", { desc = "Flutter reload", silent = true })
vim.keymap.set("n", "<F7>", ":FlutterRestart<CR>", { desc = "Flutter restart", silent = true })
vim.keymap.set("n", "<F8>", ":FlutterQuit<CR>", { desc = "Flutter quit", silent = true })
