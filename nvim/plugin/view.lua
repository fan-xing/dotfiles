--notify
vim.notify = require("notify")
vim.notify.setup({
    fps = 60,
    icons = {
        WARN = " ",
    },
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
            enabled = false,
        },
    },
    routes = {
        {
            filter = { event = "msg_show", error = true, find = "找不到模式" },
            opts = { skip = true },
        },
        {
            filter = { event = "msg_show", warning = true, find = "已查找到" },
            opts = { skip = true },
        },
        {
            filter = { event = "msg_show", find = "已写入" },
            opts = { skip = true },
        },
        {
            view = 'mini',
            filter = { event = 'msg_showmode' },
        },
        {
            filter = { warning = true, find = "NotifyBackground" },
            opts = { skip = true },

        }
    }
})

--colorizer
require("colorizer").setup({
    names = false
})

--indent_blankline
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("tab:  ")
vim.opt.listchars:append("eol:↴")
require("indent_blankline").setup({
    -- for example, context is off by default, use this to turn it on
    --show_current_context = true,
    --show_current_context_start = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
})

local db = require('dashboard')
db.setup({
    theme = 'hyper',
    config = {
        week_header = {
            enable = true,
        },
        project = {
            enable = false,
        },
        shortcut = {
            { desc = ' Plugin', group = '@property', action = 'Lazy', key = 'l' },
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f',
            },
            {
                desc = ' Projects',
                group = 'Label',
                action = 'Telescope projects',
                key = 'p',
            },
            {
                desc = ' dotfiles',
                group = 'Number',
                action = 'Telescope dotfiles',
                key = 'd',
            },
        },
    },
})
