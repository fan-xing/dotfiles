--catppuccin
local catppuccin = require("catppuccin")
-- configure it
catppuccin.setup({
    transparent_background = true,
    term_colors = true,
    integrations = {
        notify = true,
        dap = {
            enabled = true,
            enable_ui = true,
        },
        indent_blankline = {
            enabled = false,
        },
    },
    flavour = "mocha", -- latte, frappe, macchiato, mocha
})

-- gruvbox
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_diagnostic_text_highlight=1

-- vim.cmd([[colorscheme catppuccin]])
vim.cmd([[colorscheme gruvbox-material]])
