--notify
vim.notify = require("notify")
vim.notify.setup({
	timeout = 3000,
	max_width = 100,
	max_height = 100,
	top_down = false,
})
require("telescope").load_extension("notify")

--noice
require("noice").setup({
	messages = {
		-- NOTE: If you enable messages, then the cmdline is enabled automatically.
		-- This is a current Neovim limitation.
		enabled = true, -- enables the Noice messages UI
		view = "notify", -- default view for messages
		view_error = "notify", -- view for errors
		view_warn = "notify", -- view for warnings
		view_history = "messages", -- view for :messages
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
			view = "mini",
			filter = { event = "msg_showmode" },
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
				row = "100%",
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
		long_message_to_split = true, -- long messages will be sent to a split
	},
})

--colorizer
require("colorizer").setup({
	user_default_options = {
		names = false,
	},
})

--indent_blankline
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("tab:▎ ")
vim.opt.listchars:append("eol:↴")
require("ibl").setup({
	scope = {
		show_start = false,
		show_end = false,
	},
	whitespace = {
		remove_blankline_trail = false,
	},
	exclude = {
		filetypes = { "dashboard" },
	},
})

local db = require("dashboard")
db.setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		project = {
			enable = false,
		},
		shortcut = {
			{
				icon = "",
				desc = "Plugin",
				group = "@property",
				action = "Lazy",
				key = "l",
			},
			{
				icon = "󰈞",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Projects",
				group = "Label",
				action = "Telescope projects",
				key = "p",
			},
			{
				desc = " New File",
				group = "Number",
				action = "enew",
				key = "n",
			},
		},
	},
})
