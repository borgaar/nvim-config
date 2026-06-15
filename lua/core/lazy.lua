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

    -- Colorscheme
    {
      "ellisonleao/gruvbox.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("gruvbox").setup({
          italic = {
            strings = false,
            emphasis = false,
            comments = false,
            operators = false,
            folds = false,
          },
        })
        vim.cmd("colorscheme gruvbox")
      end,
    },

    -- Formatting
    {
      'stevearc/conform.nvim',
      opts = {},
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
      dependencies = { "hrsh7th/cmp-nvim-lsp" }
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

  install = { colorscheme = { "gruvbox", "habamax" } },
  checker = { enabled = true },
})
