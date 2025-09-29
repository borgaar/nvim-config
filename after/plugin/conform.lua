require("conform").setup({
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
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 1000,
  },
})
