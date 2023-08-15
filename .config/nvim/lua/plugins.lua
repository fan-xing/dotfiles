return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		priority = 1000,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		priority = 1000,
	},
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	"debugloop/telescope-undo.nvim",
	"ahmedkhalf/project.nvim",
	"folke/noice.nvim",
	"rcarriga/nvim-notify",
	"muniftanjim/nui.nvim",
	"neovim/nvim-lspconfig",
	"nvimdev/lspsaga.nvim",
	{
		"ray-x/go.nvim",
		"ray-x/guihua.lua",
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"jay-babu/mason-nvim-dap.nvim",
			"thehamsta/nvim-dap-virtual-text",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
	"danymat/neogen",
	"nvim-lualine/lualine.nvim",
	"nvim-tree/nvim-web-devicons", -- optional dependency
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	"akinsho/toggleterm.nvim",
	"lewis6991/gitsigns.nvim",
	"fabijanzulj/blame.nvim",
	"akinsho/git-conflict.nvim",
	"ggandor/leap.nvim",
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "uienter" },
		main = { "ibl" },
		-- tag = "v2.20.8"
	},
	"numtostr/comment.nvim",
	"nvchad/nvim-colorizer.lua",
	"voldikss/vim-translator",
	"windwp/nvim-autopairs",
	{
		"glepnir/dashboard-nvim",
		event = "vimenter",
	},
	{
		"kevinhwang91/nvim-bqf",
		dependencies = {
			"junegunn/fzf",
		},
	},
	"sbdchd/neoformat",
	"wansmer/treesj",
	"folke/which-key.nvim",
	"folke/todo-comments.nvim",
	"nvim-tree/nvim-tree.lua",
	"famiu/bufdelete.nvim",
}
