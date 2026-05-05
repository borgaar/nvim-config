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
      tag = "0.1.8",
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

    -- Diagnostics
    {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {},
    },

    -- Completions
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        -- Snippet engine
        {
          "L3MON4D3/LuaSnip",
          dependencies = { "rafamadriz/friendly-snippets" },
          config = function()
            -- Load VSCode-style snippets from friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
        "saadparwaiz1/cmp_luasnip",
        -- Sources
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
            ["<C-f>"]     = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"]     = cmp.mapping.abort(),
            ["<CR>"]      = cmp.mapping.confirm({ select = true }),
            -- Tab to cycle through completions
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
          }),
        })
      end,
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
