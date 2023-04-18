return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        'sainnhe/gruvbox-material',
    },
    {
        'folke/tokyonight.nvim'
    },
    "nvim-lua/plenary.nvim",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-symbols.nvim",
            "debugloop/telescope-undo.nvim",
        },
    },
    "ahmedkhalf/project.nvim",
    {
        "folke/noice.nvim",
        dependencies = {
            "rcarriga/nvim-notify",
            "MunifTanjim/nui.nvim",
        }
    },
    "neovim/nvim-lspconfig",
    {
        "ray-x/guihua.lua",
        "ray-x/go.nvim",
        requires = { -- optional packages
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    "onsails/lspkind.nvim",
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
            "jay-babu/mason-nvim-dap.nvim",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "saadparwaiz1/cmp_luasnip",
            "lukas-reineke/cmp-under-comparator",
        },
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "nvim-lualine/lualine.nvim",
    },
    "nvim-tree/nvim-web-devicons", -- optional dependency
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    },
    "akinsho/toggleterm.nvim",
    "lewis6991/gitsigns.nvim",
    {
        "sindrets/diffview.nvim",
    },
    "ggandor/leap.nvim",
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
    },
    "danymat/neogen",
    'numToStr/Comment.nvim',
    "NvChad/nvim-colorizer.lua",
    "kyazdani42/nvim-tree.lua",
    "voldikss/vim-translator",
    "ellisonleao/glow.nvim", --依赖glow
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        },
    },
    "windwp/nvim-autopairs",
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
    },
    {
        'kevinhwang91/nvim-bqf',
        dependencies = {
            'junegunn/fzf',
        }
    },
    'sbdchd/neoformat',
    {
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        }
    },
    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
    "folke/which-key.nvim",
}
