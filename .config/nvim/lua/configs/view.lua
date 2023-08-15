require("catppuccin").setup {
  transparent_background = true, -- disables setting the background color.
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  integrations = {
    notify = true,
  },
}
vim.cmd.colorscheme "catppuccin"

--notify
local notify = require "notify"
notify.setup {
  timeout = 3000,
  max_width = 100,
  max_height = 100,
  top_down = false,
}
require("telescope").load_extension "notify"

--noice
require("noice").setup {
  messages = {
    enabled = true, -- enables the Noice messages UI
    view = "notify", -- default view for messages
    view_error = "notify", -- view for errors
    view_warn = "notify", -- view for warnings
    view_history = "notify", -- view for :messages
    view_search = "mini", -- view for search count messages. Set to `false` to disable
  },
  lsp = {
    progress = {
      enabled = true,
      view = "mini",
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    signature = {
      enabled = true,
    },
    hover = {
      enabled = true,
    },
  },
  routes = {
    {
      filter = { event = "msg_show", error = true, find = "Pattern not found" },
      opts = { skip = true },
    },
    {
      filter = { event = "msg_show", warning = true, find = "已查找到" },
      opts = { skip = true },
    },
    {
      filter = { event = "msg_show", find = "written" },
      opts = { skip = true },
    },
    {
      filter = { warning = true, find = "NotifyBackground" },
      opts = { skip = true },
    },
  },
  views = {
    mini = {
      position = {
        col = "50%",
        row = "99%",
      },
    },
    cmdline_popup = {
      position = {
        row = "80%",
        col = "50%",
      },
    },
  },
  presets = {
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
}

--indent_blankline
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "tab:▎ "
vim.opt.listchars:append "eol:↴"
-- require("ibl").setup {
--   scope = {
--     show_start = false,
--     show_end = false,
--   },
--   whitespace = {
--     remove_blankline_trail = false,
--   },
--   exclude = {
--     filetypes = { "dashboard" },
--   },
-- }
require("nvim-web-devicons").setup {}

require("lualine").setup {
  options = {
    component_separators = { left = " ", right = " " },
    section_separators = { left = " ", right = " " },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename" },
    lualine_c = { "lsp_status", "diagnostics", "branch", "diff" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "selectioncount", "location" },
  },
  tabline = {
    lualine_a = { "windows" },
    lualine_z = { "tabs" },
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
