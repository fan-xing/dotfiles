return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  {
    "nvim-telescope/telescope-symbols.nvim",
    lazy = false,
  },
  "folke/noice.nvim",
  "rcarriga/nvim-notify",
  "muniftanjim/nui.nvim",
  {
    "fatih/vim-go",
    lazy = false,
  },
  "onsails/lspkind.nvim",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "hrsh7th/cmp-cmdline",
    event = { "CmdlineEnter" },
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },
  "danymat/neogen",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
  },
  "akinsho/toggleterm.nvim",
  "akinsho/git-conflict.nvim",
  "lewis6991/gitsigns.nvim",
  "ggandor/leap.nvim",
  "numtostr/comment.nvim",
  {
    "voldikss/vim-translator",
    lazy = false,
  },
  "windwp/nvim-autopairs",
  "stevearc/quicker.nvim",
  "wansmer/treesj",
  "folke/which-key.nvim",
  {
    "sbdchd/neoformat",
    lazy = false,
  },
  "Bekaboo/dropbar.nvim",
  {
    "kawre/leetcode.nvim",
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
  },
  "nvim-lualine/lualine.nvim",
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
  },
}
