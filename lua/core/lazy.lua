local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = {
		-- Telescope
		{
			"nvim-telescope/telescope.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
		},

		-- Treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			branch = "main",
			lazy = false,
			build = ":TSUpdate",
			opts = {
				install_dir = vim.fn.stdpath("data") .. "/site",
			},
		},

		-- Colorschemes
		{
			"edeneast/nightfox.nvim",
			lazy = false,
			config = true,
		},
		{
			"ellisonleao/gruvbox.nvim",
			priority = 1000,
			opts = {
				italic = {
					strings = false,
					emphasis = false,
					comments = true,
					folds = false,
				},
			},
		},
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
				},
			},
		},
		{
			"rebelot/kanagawa.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("kanagawa").setup({
					commentStyle = { italic = false },
					keywordStyle = { italic = false },
					statementStyle = { bold = true },
				})
			end,
		},

		-- Formatting
		{
			"stevearc/conform.nvim",
			config = true,
		},

		{
			"seblyng/roslyn.nvim",
			-- @module 'roslyn.config'
			-- @type RoslynNvimConfig
		},

		-- Diagnostics
		{
			"folke/trouble.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {},
		},

		-- Completions
		{
			"hrsh7th/nvim-cmp",
			dependencies = { "hrsh7th/cmp-nvim-lsp" },
		},

		-- Status line
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {
				options = {
					theme = "gruvbox",
				},
			},
		},

		-- Smart splits
		{ "mrjones2014/smart-splits.nvim", opts = {} },

		-- Floating terminal
		{ "voldikss/vim-floaterm" },

		-- Autopairs
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {},
		},

		-- Surround
		{
			"kylechui/nvim-surround",
			version = "*",
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup()
			end,
		},
	},

	install = { missing = true },
	checker = { enabled = true },
})
