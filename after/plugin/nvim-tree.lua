require("nvim-tree").setup {
  filters = {
    enable = false,
  },
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true,
      ignore_list = {},
    },
    exclude = false,
  },
  actions = {
    open_file = {
      resize_window = false,
    },
  },
}
