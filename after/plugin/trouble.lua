require("trouble").setup {}

-- Configure diagnostics to show inline with custom icons
vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- ● ■ ▎
    source = "if_many",
    spacing = 4,
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "-",  -- Error icon (Font Awesome)
      [vim.diagnostic.severity.WARN] = "-",   -- Warning icon (Font Awesome)
      [vim.diagnostic.severity.INFO] = "-",   -- Info icon (Font Awesome)
      [vim.diagnostic.severity.HINT] = "-➤",   -- Hint icon (Font Awesome)
    },
  },
})
