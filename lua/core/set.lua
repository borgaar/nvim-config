-- netrw
--vim.g.netrw_keepdir = 0

-- Autoread
vim.o.autoread = true

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs and spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- file backups
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- appearance
vim.opt.termguicolors = true

-- scrolling
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4

vim.opt.signcolumn = "yes"
vim.opt.wrap = false

vim.opt.updatetime = 50

vim.opt.colorcolumn = "88"

-- Automatically reload buffer from disk when disk is modified
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	callback = function()
		if vim.fn.mode() == "n" then
			vim.cmd("silent! checktime")
		end
	end,
})
vim.api.nvim_create_autocmd("FileChangedShell", {
	callback = function()
		vim.v.fcs_choice = "reload"
	end,
})

vim.cmd.colorscheme("gruvbox")

vim.diagnostic.setqflist()

-- Refresh setqflist on new diagnostics
vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		vim.diagnostic.setqflist({ open = false })
	end,
})
