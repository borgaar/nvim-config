local cmp = require("cmp")

cmp.setup({
  expand = function(args)
    require('luasnip').lsp_expand(args.body)
  end,
  sources = {
    -- { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
  },
  window = {
    completion = {
      col_offset = -3,
      side_padding = 0,
      winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },
    },
    documentation = {
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },
      winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
    },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.scroll_docs(-1),
    ['<C-j>'] = cmp.mapping.scroll_docs(1),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
})
