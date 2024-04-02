--catppuccin
local catppuccin = require("catppuccin")
-- configure it
catppuccin.setup({
	transparent_background = true,
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
	integrations = {
		cmp = true,
		notify = true,
		noice = true,
		dap = true,
		dap_ui = true,
		leap = true,
		mini = true,
		which_key = true,
		telescope = {
			enabled = true,
			-- style = "nvchad",
		},
		gitsigns = true,
		lsp_saga = true,
		mason = true,
	},
	flavour = "mocha", -- latte, frappe, macchiato, mocha
})
require("nightfox").setup({
	options = {
		transparent = true,
	},
	palettes = {
		nightfox = {
			sel0 = "#2F4F4F",
		},
		terafox = {
			sel0 = "#2F4F4F",
		},
	},
})
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme nightfox")
vim.cmd("colorscheme terafox")
