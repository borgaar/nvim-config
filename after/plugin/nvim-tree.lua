require("nvim-tree").setup {
  filters = {
    enable = false,
  },
  view = {
    side = "right",
    width = 40,
  },
  update_focused_file = {
    enable = true,
    update_root = false,
    exclude = false,
  },
  actions = {
    open_file = {
      resize_window = false,
    },
  },
}
