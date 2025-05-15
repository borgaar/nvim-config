local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)

  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = true,
    })
  end, opts)

  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "E", vim.diagnostic.open_float, opts)

  vim.keymap.set("n", "<leader>rn", function()
    local clients = vim.lsp.get_active_clients({ filter = { bufnr = bufnr } })

    vim.lsp.buf.rename()
  end, opts)

  vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, opts)
end

local servers = { "lua_ls", "cssls", "html", "jdtls", "kotlin_language_server", "tailwindcss",
  "rust_analyzer" }

-- Iterate over all servers and apply default_on_attach and capabilities
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = default_on_attach,
  })
end

-- Configure pyright for strong typing
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = default_on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
        autoImportCompletions = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

-- TypeScript and Vue
local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

lspconfig.ts_ls.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = volar_path,
        languages = { "vue" },
      },
    },
    preferences = {
      importModuleSpecifierPreference = "non-relative",
      importModuleSpecifierEnding = "minimal"
    }
  },
})

lspconfig.volar.setup {}

lspconfig.eslint.setup({
  capabilities = capabilities,
  on_attach = default_on_attach,
  filtypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
})

-- Flutter & Dart
require("flutter-tools").setup {
  widget_guides = {
    enabled = true,
  },
  lsp = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      default_on_attach(client, bufnr)

      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.code_action({
            apply = true,
            filter = function(command)
              --print(command.title)
              return command.title == "Fix All"
            end
          })

          vim.wait(300)

          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end,
  }
}
