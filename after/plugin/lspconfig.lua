
vim.lsp.config("lua_ls", {})
vim.lsp.enable("lua_ls")

vim.lsp.config("cssls", {})
vim.lsp.enable("cssls")

vim.lsp.config("html", {})
vim.lsp.enable("html")

vim.lsp.config("jdtls", {})
vim.lsp.enable("jdtls")

vim.lsp.config("kotlin_language_server", {})
vim.lsp.enable("kotlin_language_server")

vim.lsp.config("tailwindcss", {})
vim.lsp.enable("tailwindcss")

vim.lsp.config("gopls", {})
vim.lsp.enable("gopls")

vim.lsp.config("ruff", {})
vim.lsp.enable("ruff")

vim.lsp.config("lemminx", {})
vim.lsp.enable("lemminx")

vim.lsp.config("asm_lsp", {})
vim.lsp.enable("asm_lsp")

vim.lsp.config("rust_analyzer", {})
vim.lsp.enable("rust_analyzer")

vim.lsp.config("eslint", {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
})
vim.lsp.enable("eslint")

vim.lsp.config("clangd", {})
vim.lsp.enable("clangd")

-- Configure pyright for strong typing
vim.lsp.config("pyright", {
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
vim.lsp.enable("pyright")

-- TypeScript and Vue
local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

vim.lsp.config("ts_ls", {
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
vim.lsp.enable("ts_ls")

require("flutter-tools").setup {
  widget_guides = {
    enabled = true,
  },
}
