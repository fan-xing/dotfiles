local M = {
  ui = {
    cmp = {
      icons = true,
      lspkind_text = true,
      style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
    },
    telescope = { style = "bordered" }, -- borderless / bordered
    tabufline = {
      enabled = true,
      lazyload = true,
    },
    statusline = {
      theme = "minimal", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "block",
      order = { "mode", "file", "diagnostics", "git", "%=", "lsp_msg", "%=", "lsp", "cwd", "cursor" },
    },
  },
  nvdash = {
    load_on_startup = true,
    buttons = {
      { txt = "  Recent Files", keys = " fm", cmd = "Telescope oldfiles" },
      { txt = "  Find File", keys = " ff", cmd = "Telescope find_files" },
      { txt = "󰈭  Find Word", keys = " rg", cmd = "Telescope live_grep" },
      { txt = "󱥚  Themes", keys = " th", cmd = ":lua require('nvchad.themes').open()" },
      { txt = "  Mappings", keys = " ch", cmd = "NvCheatsheet" },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashFooter",
        no_gap = true,
      },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    },
  },
  base46 = {
    theme = "catppuccin",
    transparency = false,
  },
}
return M
