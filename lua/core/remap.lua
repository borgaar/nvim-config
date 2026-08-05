vim.g.mapleader = " "

-- Open file explorer
vim.keymap.set("n", "<leader>e", ":Ex<CR>")

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Open documentation" })
vim.keymap.set("n", "E", vim.diagnostic.open_float, { desc = "Open diagnostics" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Find files
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Window navigation
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- Resize windows
local smart_splits = require("smart-splits")
vim.keymap.set("n", "<C-k>", function()
	smart_splits.resize_up(2)
end)
vim.keymap.set("n", "<C-j>", function()
	smart_splits.resize_down(2)
end)
vim.keymap.set("n", "<C-h>", function()
	smart_splits.resize_left(5)
end)
vim.keymap.set("n", "<C-l>", function()
	smart_splits.resize_right(5)
end)

-- Swap windows
vim.keymap.set("n", "<leader>h", smart_splits.swap_buf_left)
vim.keymap.set("n", "<leader>j", smart_splits.swap_buf_down)
vim.keymap.set("n", "<leader>k", smart_splits.swap_buf_up)
vim.keymap.set("n", "<leader>l", smart_splits.swap_buf_right)

-- Toggle split orientation
local function toggle_split_simple()
	if vim.fn.winnr("$") < 2 then
		return
	end

	vim.cmd("wincmd t")
	local winrestcmd_before = vim.fn.winrestcmd()

	vim.cmd("wincmd K")

	if vim.fn.winrestcmd() == winrestcmd_before then
		vim.cmd("wincmd t")
		vim.cmd("wincmd H")
	end
end

vim.keymap.set("n", "<leader>d", toggle_split_simple, { desc = "Toggle split orientation" })

-- Open split
vim.keymap.set("n", "<leader>s", ":vsplit %<CR><C-w>w", { desc = "Toggle vertical split" })

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

-- Open terminal
local function open_terminal_rightmost()
	-- Open window bottom right
	vim.cmd("botright 50vnew")

	-- Set width of the window
	vim.cmd("vertical resize 80")

	-- Open terminal in said window
	vim.cmd("terminal")

	-- Start insert
	vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>t", open_terminal_rightmost)

vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]], { desc = "Move to left window" })
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]], { desc = "Move to below window" })
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]], { desc = "Move to above window" })
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]], { desc = "Move to right window" })
vim.keymap.set("t", "<A-n>", [[<C-\><C-n>]], { desc = "Unfocus" })

-- Open floating terminal
vim.keymap.set(
	"n",
	"<A-i>",
	":FloatermNew --height=0.9 --width=0.6 --wintype=float<CR>",
	{ desc = "Open floating terminal" }
)
