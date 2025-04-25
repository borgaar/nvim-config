local config = require("session_manager.config")

require("session_manager").setup {
  autoload_mode = config.AutoloadMode.CurrentDir,
  autosave_last_session = true,
}

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = "SessionLoadPost",
  callback = function()
    require('nvim-tree.api').tree.toggle(false, true)
  end,
})

