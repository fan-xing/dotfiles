-- go
vim.cmd [[
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_mod_fmt_autosave = 0
]]

-- lsp
require("mason").setup {
  ui = {
    -- Whether to automatically check for new versions when opening the :Mason window.
    check_outdated_packages_on_open = false,
    border = "single",
    icons = {
      -- The list icon to use for installed packages.
      package_installed = "",
      -- The list icon to use for packages that are installing, or queued for installation.
      package_pending = "◯",
      -- The list icon to use for packages that are not installed.
      package_uninstalled = "",
    },
  },
}
require("mason-lspconfig").setup {
  automatic_enable = true,
}
local lua_lsp_settings = {
  Lua = {
    workspace = {
      library = {
        vim.fn.expand "$VIMRUNTIME/lua",
        vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
        "${3rd}/luv/library",
      },
    },
  },
}
vim.lsp.config("lua_ls", {
  settings = lua_lsp_settings,
})
vim.diagnostic.config {
  virtual_text = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
}

require("nvim-treesitter.configs").setup {
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}

require("treesitter-context").setup {}

require("treesj").setup {
  max_join_length = 1000,
}

require("dropbar").setup {}
