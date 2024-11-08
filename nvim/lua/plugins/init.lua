return {
  "nvim-lua/plenary.nvim",
  {
    "nvim-telescope/telescope-symbols.nvim",
    lazy = false,
  },
  "ahmedkhalf/project.nvim",
  "folke/noice.nvim",
  "rcarriga/nvim-notify",
  "muniftanjim/nui.nvim",
  {
    "fatih/vim-go",
    lazy = false,
  },
  "onsails/lspkind.nvim",
  {
    "hrsh7th/cmp-cmdline",
    event = { "CmdlineEnter" },
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
  {
    "famiu/bufdelete.nvim",
    lazy = false,
  },
  {
    "sbdchd/neoformat",
    lazy = false,
  },
  "Bekaboo/dropbar.nvim",
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
