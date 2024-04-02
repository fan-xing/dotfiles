--telescope

local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
local C = require("catppuccin.palettes").get_palette("mocha")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-b>"] = "results_scrolling_up",
				["<C-f>"] = "results_scrolling_down",
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-q>"] = "close",
				["<C-p>"] = action_layout.toggle_preview,
				["<C-=>"] = actions.send_to_qflist + actions.open_qflist,
				["<C-a>"] = require("telescope.actions").cycle_history_prev,
				["<C-g>"] = require("telescope.actions").cycle_history_next,
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
			},
			n = {
				["<C-b>"] = "results_scrolling_up",
				["<C-f>"] = "results_scrolling_down",
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-q>"] = "close",
				["<C-p>"] = action_layout.toggle_preview,
				["<C-=>"] = actions.send_to_qflist + actions.open_qflist,
				["<C-a>"] = require("telescope.actions").cycle_history_prev,
				["<C-g>"] = require("telescope.actions").cycle_history_next,
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
			},
		},
		prompt_prefix = " ",
		selection_caret = " ",
		multi_icon = "",
		layout_strategy = "horizontal",
		-- layout_strategy = "vertical",
		sorting_strategy = "ascending",
		dynamic_preview_title = true,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.80,
			},
			vertical = {
				mirror = false,
			},
			width = 0.80,
			height = 0.60,
			preview_cutoff = 120,
		},
		preview = {
			hide_on_startup = true,
			treesitter = false,
		},
		-- other defaults configuration here
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			-- "--trim", -- add this value
		},
	},
	extensions = {},
	pickers = {
		find_files = {
            fname_width = 70,
        },
		oldfiles = {
			fname_width = 70,
		},
		live_grep = {
			fname_width = 70,
		},
		grep_string = {
			fname_width = 70,
		},
		buffers = {
			fname_width = 70,
			mappings = {
				i = {
					["<C-d>"] = actions.delete_buffer,
				},
			},
		},
		lsp_document_symbols = {
			fname_width = 70,
			symbol_width = 70,
            ignore_symbols={"variable","field","string"},
		},
		lsp_dynamic_workspace_symbols = {
			fname_width = 70,
			symbol_width = 70,
            ignore_symbols = {"variable","field","string"},
		},
		lsp_references = {
			fname_width = 70,
            include_declaration = false,
		},
		lsp_definitions = {
			fname_width = 70,
		},
		lsp_implementations = {
			fname_width = 70,
		},
	},
})
require("telescope").load_extension("projects")
require("telescope").load_extension("undo")

--project
require("project_nvim").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	exclude_dirs = { "~/.config/nvim/*" },
})

local TelescopePrompt = {
	-- TelescopeBorder = {
	-- 	fg = C.mantle,
	-- 	bg = C.mantle,
	-- },
	-- TelescopeMatching = { fg = C.blue },
	-- TelescopeNormal = {
	-- 	bg = C.mantle,
	-- },
	-- TelescopePromptBorder = {
	-- 	fg = C.surface0,
	-- 	bg = C.surface0,
	-- },
	-- TelescopePromptNormal = {
	-- 	fg = C.text,
	-- 	bg = C.surface0,
	-- },
	TelescopePreviewTitle = {
		fg = C.base,
		bg = C.green,
		bold = true ,
	},
	TelescopePromptTitle = {
		fg = C.base,
		bg = C.red,
		bold = true ,
	},
	TelescopeResultsTitle = {
		fg = C.mantle,
		bg = C.lavender,
		bold = true ,
	},
}
for hl, col in pairs(TelescopePrompt) do
	vim.api.nvim_set_hl(0, hl, col)
end
