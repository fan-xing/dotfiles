return {
  "nvim-lua/plenary.nvim",
  -- "nvim-telescope/telescope.nvim",
  {
    "nvim-telescope/telescope-symbols.nvim",
    lazy = false,
  },
  "folke/noice.nvim",
  "rcarriga/nvim-notify",
  "muniftanjim/nui.nvim",
  "neovim/nvim-lspconfig",
  {
    "fatih/vim-go",
    lazy = false,
  },
  "onsails/lspkind.nvim",
  --    {
  -- 	"hrsh7th/nvim-cmp",
  -- 	dependencies = {
  -- 		"hrsh7th/cmp-nvim-lsp",
  -- 		"hrsh7th/cmp-buffer",
  -- 		"hrsh7th/cmp-path",
  -- 		"saadparwaiz1/cmp_luasnip",
  -- 	},
  -- },
  {
    "hrsh7th/cmp-cmdline",
    event = { "CmdlineEnter" },
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
  },
  --    {
  -- 	"L3MON4D3/LuaSnip",
  -- 	dependencies = {
  -- 		"rafamadriz/friendly-snippets",
  -- 	},
  -- },
  "danymat/neogen",
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  "akinsho/toggleterm.nvim",
  "akinsho/git-conflict.nvim",
  "ggandor/leap.nvim",
  "numtostr/Comment.nvim",
  {
    "voldikss/vim-translator",
    lazy = false,
  },
  "windwp/nvim-autopairs",
  "stevearc/quicker.nvim",
  "wansmer/treesj",
  -- "folke/which-key.nvim",
  {
    "famiu/bufdelete.nvim",
    lazy = false,
  },
  {
    "sbdchd/neoformat",
    lazy = false,
  },
  "Bekaboo/dropbar.nvim",
}
