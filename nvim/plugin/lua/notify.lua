--notify
vim.notify = require("notify")
vim.notify.setup({
    stages = "slide",
    fps = 30,
    icons = {
        ERROR = " ",
        WARN = " ",
        INFO = " ",
        DEBUG = " ",
        TRACE = " ",
    },
    top_down = false,
    minimum_width = 80,
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
    }
})
