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

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
}
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
end
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

require("nvim-treesitter.configs").setup {}

require("treesj").setup {
  max_join_length = 1000,
}
