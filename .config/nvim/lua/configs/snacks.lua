local dashboard = {}

local layout = {
  layout = {
    box = "vertical",
    backdrop = false,
    row = -1,
    width = 0,
    height = 0.4,
    border = "top",
    title = " {title} {live} {flags}",
    title_pos = "left",
    { win = "input", height = 1, border = "bottom" },
    {
      box = "horizontal",
      { win = "list", border = "none" },
      { win = "preview", title = "{preview}", width = 0.6, border = "left" },
    },
  },
}
require("snacks").setup {
  dashboard = dashboard,
  scroll = { enabled = true },
  indent = { enabled = true },
  words = { enabled = true },
  bigfile = { enabled = true },
  picker = {
    layout = layout,
    formatters = { file = { filename_first = true } },
    win = {
      input = {
        keys = {
          ["<c-q>"] = { "close", mode = { "i", "n" } },
          ["<c-p>"] = { "toggle_preview", mode = { "i", "n" } },
          ["<c-g>"] = { "history_forward", mode = { "i", "n" } },
          ["<c-a>"] = { "history_back", mode = { "i", "n" } },
          ["<c-=>"] = { "qflist", mode = { "i", "n" } },
        },
      },
      list = {
        keys = {
          ["<c-q>"] = "close",
          ["<c-p>"] = "toggle_preview",
          ["<c-=>"] = "qflist",
        },
      },
      preview = {
        keys = {
          ["<c-q>"] = "close",
          ["<c-p>"] = "toggle_preview",
          ["<c-=>"] = "qflist",
        },
      },
    },
    filter = { cwd = true },
  },
}
