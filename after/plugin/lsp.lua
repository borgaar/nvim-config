local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- C
vim.lsp.config(
  'c',
  {
    cmd = {'clangd'},
    filetypes = {'c', 'cpp'},
    capabilities = capabilities
  }
)
vim.lsp.enable('c')

-- C#
-- vim.lsp.config(
--   'csharp',
--   {
--     cmd = {'roslyn-language-server', '--stdio'},
--     filetypes = {'cs'},
--   }
-- )
-- vim.lsp.enable('csharp')

-- Rust
vim.lsp.config(
  'rust',
  {
    cmd = {'rust-analyzer'},
    filetypes = {'rust'},
    capabilities = capabilities
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

-- TailwindCSS
vim.lsp.config(
  'tailwindcss',
  {
    cmd = {'tailwindcss-language-server', '--stdio'},
    filetypes = {'typescript', 'typescriptreact', 'javascript', 'javascriptreact'}
  }
)
vim.lsp.enable('tailwindcss')

-- Lua
vim.lsp.config(
  'lua',
  {
    cmd = {'lua-language-server'},
    filetypes = {'lua'},
    settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
  }
)
vim.lsp.enable('lua')

-- Lean
vim.lsp.config(
  'lean',
  {
    cmd = {'lean', '--server'},
    filetypes = {'lean'}
  }
)
vim.lsp.enable('lean')

vim.lsp.config(
    'xml',
    {
        cmd = {'lemminx'},
        filetypes = {'xml'}
    }
)
vim.lsp.enable('xml')
