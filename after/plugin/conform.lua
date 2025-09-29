require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
  },
  format_on_save = function()
    -- run :EslintFixAll if eslint is available
    local clients = vim.lsp.get_clients()

    for _, client in ipairs(clients) do
      if client.name == "eslint" then
        vim.cmd.EslintFixAll();
      end
    end

    require("conform").format()
  end,
  default_format_opts = {
    lsp_format = "fallback"
  }
})
