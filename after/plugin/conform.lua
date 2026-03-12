conform = require("conform")
conform.setup({
  formatters_by_ft = {
    javascript = { "eslint_d", "prettier" },
    typescript = { "eslint_d", "prettier" },
    javascriptreact = { "eslint_d", "prettier" },
    typescriptreact = { "eslint_d", "prettier" },
    vue = { "eslint_d", "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    yaml = { "prettier" },
    yml = { "prettier" },
    rust = { "jonathans_crazy_aah_formatter", lsp_format = "never" }
  },
  formatters = {
    jonathans_crazy_aah_formatter = {
      command = "./fmt.sh",
    }
  }
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    --conform.format()
  end,
})
