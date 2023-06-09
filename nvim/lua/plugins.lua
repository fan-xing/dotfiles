return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    'sainnhe/gruvbox-material',
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "debugloop/telescope-undo.nvim",
    "ahmedkhalf/project.nvim",
    "folke/noice.nvim",
    "rcarriga/nvim-notify",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    {
        "ray-x/guihua.lua",
        "ray-x/go.nvim",
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
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
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            -- "hrsh7th/cmp-nvim-lsp-signature-help",
            "saadparwaiz1/cmp_luasnip",
            -- "onsails/lspkind.nvim",
        },
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
    },
    "nvim-lualine/lualine.nvim",
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
        event = { "UIEnter" },
    },
    "danymat/neogen",
    'numToStr/Comment.nvim',
    "NvChad/nvim-colorizer.lua",
    "voldikss/vim-translator",
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        },
        lazy = true,
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
    'Wansmer/treesj',
    "folke/which-key.nvim",
    "folke/todo-comments.nvim",
    "nvim-tree/nvim-tree.lua",
    'Bekaboo/dropbar.nvim',
}
