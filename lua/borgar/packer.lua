-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { "ellisonleao/gruvbox.nvim", config = function()
    require("gruvbox").setup {
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
    }

    vim.cmd("colorscheme gruvbox")
  end }

  use { 'nvim-treesitter/nvim-treesitter', run = function() vim.cmd('TSUpdate') end }

  use { 'mbbill/undotree' }

  use { 'tpope/vim-fugitive' }

  -- LSPs
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }

  -- Diagnostics
  use { "folke/trouble.nvim", requries = "nvim-tree/nvim-web-devicons" }

  -- Completions
  use { 'hrsh7th/nvim-cmp' }
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      { 'rafamadriz/friendly-snippets' }
    }
  }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'saadparwaiz1/cmp_luasnip' }

  -- GitHub Copilot
  use { 'github/copilot.vim' }

  -- File explorer
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

  -- Status line
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

  -- Smart splits
  use { 'mrjones2014/smart-splits.nvim' }

  use { 'voldikss/vim-floaterm' }

  use { 'Shatur/neovim-session-manager', requires = { 'nvim-lua/plenary.nvim' } }

  use { 'nvim-flutter/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup {}
    end,
  }

  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup()
    end
  }

  use { "windwp/nvim-ts-autotag", config = function()
    require("nvim-ts-autotag").setup {}
  end }
end)
