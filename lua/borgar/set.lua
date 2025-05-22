-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers
vim.opt.nu = true;
vim.opt.relativenumber = true;

-- tabs and spaces
vim.opt.tabstop = 2;
vim.opt.softtabstop = 2;
vim.opt.shiftwidth = 2;
vim.opt.expandtab = true;
vim.opt.smartindent = true;

-- file backups
vim.opt.backup = false;
vim.opt.swapfile = false;
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir";
vim.opt.undofile = true;

-- System clipboard
vim.opt.clipboard = "unnamedplus";

-- search settings
vim.opt.ignorecase = true;
vim.opt.smartcase = true;
vim.opt.incsearch = true;
vim.opt.hlsearch = false;

-- appearance
vim.opt.termguicolors = true;

-- scrolling
vim.opt.scrolloff = 4;
vim.opt.sidescrolloff = 4;

vim.opt.signcolumn = "yes";
vim.opt.wrap = false;

vim.opt.updatetime = 50;

vim.opt.colorcolumn = "88";
