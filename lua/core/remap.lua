vim.g.mapleader = " ";

-- Open file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)
-- Collapse all directories in file explorer
vim.keymap.set("n", "<leader>cf", function()
  local api = require("nvim-tree.api")
  api.tree.collapse_all()
end, { desc = "Collapse all except current file path" })

-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Open documentation' })
vim.keymap.set('n', 'E', vim.diagnostic.open_float, { desc = 'Open diagnostics' })

-- Find files
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>b', ":Telescope buffers<CR>", { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>fw', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Window navigation
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- Resize windows
local smart_splits = require("smart-splits")
vim.keymap.set("n", "<C-k>", function() smart_splits.resize_up(2) end)
vim.keymap.set("n", "<C-j>", function() smart_splits.resize_down(2) end)
vim.keymap.set("n", "<C-h>", function() smart_splits.resize_left(5) end)
vim.keymap.set("n", "<C-l>", function() smart_splits.resize_right(5) end)

-- Swap windows
vim.keymap.set("n", "<leader>h", smart_splits.swap_buf_left)
vim.keymap.set("n", "<leader>j", smart_splits.swap_buf_down)
vim.keymap.set("n", "<leader>k", smart_splits.swap_buf_up)
vim.keymap.set("n", "<leader>l", smart_splits.swap_buf_right)

-- Toggle split orientation
local function toggle_split_simple()
  if vim.fn.winnr('$') < 2 then return end

  vim.cmd('wincmd t')
  local winrestcmd_before = vim.fn.winrestcmd()

  vim.cmd('wincmd K')

  if vim.fn.winrestcmd() == winrestcmd_before then
    vim.cmd('wincmd t')
    vim.cmd('wincmd H')
  end
end

vim.keymap.set('n', '<leader>s', toggle_split_simple, { desc = 'Toggle split orientation' })

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
local function open_terminal_rightmost()
  -- Find nvim-tree window
  local tree_win = nil
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_option(buf, 'filetype') == 'NvimTree' then
      tree_win = win
      break
    end
  end

  if tree_win then
    vim.api.nvim_set_current_win(tree_win)
    vim.cmd("rightbelow 50vnew")
  else
    vim.cmd("botright 50vnew")
  end

  vim.cmd("terminal")
  -- Force the width and make it fixed
  vim.cmd("vertical resize 40")
  --vim.wo.winfixwidth = true -- Prevent this window from being resized
  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>t", open_terminal_rightmost)

vim.keymap.set("n", "<leader>t", open_terminal_rightmost)

vim.keymap.set("n", "<leader>t", open_terminal_rightmost)
vim.keymap.set('t', '<A-h>', [[<C-\><C-n><C-w>h]], { desc = "Move to left window" })
vim.keymap.set('t', '<A-j>', [[<C-\><C-n><C-w>j]], { desc = "Move to below window" })
vim.keymap.set('t', '<A-k>', [[<C-\><C-n><C-w>k]], { desc = "Move to above window" })
vim.keymap.set('t', '<A-l>', [[<C-\><C-n><C-w>l]], { desc = "Move to right window" })
vim.keymap.set('t', '<A-n>', [[<C-\><C-n>]], { desc = "Unfocus" })

-- Open floating terminal
vim.keymap.set("n", "<A-i>", ":FloatermNew --height=0.6 --width=0.6 --wintype=float<CR>",
  { desc = "Open floating terminal" })

-- Flutter
vim.keymap.set("n", "<F5>", ":FlutterRun<CR>", { desc = "Flutter run", silent = true })
vim.keymap.set("n", "<F6>", ":FlutterReload<CR>", { desc = "Flutter reload", silent = true })
vim.keymap.set("n", "<F7>", ":FlutterRestart<CR>", { desc = "Flutter restart", silent = true })
vim.keymap.set("n", "<F8>", ":FlutterQuit<CR>", { desc = "Flutter quit", silent = true })
