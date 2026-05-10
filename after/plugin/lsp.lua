local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- C
vim.lsp.config(
  'c',
  {
    cmd = {'clangd'},
    filetypes = {'c', 'h'},
    capabilities = capabilities
  }
)
vim.lsp.enable('c')

-- Rust
vim.lsp.config(
  'rust',
  {
    cmd = {'rust-analyzer'},
    filetypes = {'rust'}
  }
)
vim.lsp.enable('rust')

-- Python
vim.lsp.config(
  'python',
  {
    cmd = {'pyright-langserver', '--stdio'},
    filetypes = {'python'}
  }
)
vim.lsp.enable('python')

-- Typescript & Javascript
vim.lsp.config(
  'typescript',
  {
    cmd = {'typescript-language-server', '--stdio'},
    filetypes = {'typescript', 'typescriptreact', 'javascript', 'javascriptreact'}
  }
)
vim.lsp.enable('typescript')

-- Lua
vim.lsp.config(
  'lua',
  {
    cmd = {'lua-language-server'},
    filetypes = {'lua'}
  }
)
vim.lsp.enable('lua')
