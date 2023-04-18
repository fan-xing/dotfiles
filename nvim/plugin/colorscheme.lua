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
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
})

-- gruvbox
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_diagnostic_text_highlight = 1

require("tokyonight").setup({
    style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = true, -- Enable this to disable setting the background color
    styles = {
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    }
})

-- vim.cmd([[colorscheme catppuccin]])
-- vim.cmd([[colorscheme gruvbox-material]])
vim.cmd([[colorscheme tokyonight]])
