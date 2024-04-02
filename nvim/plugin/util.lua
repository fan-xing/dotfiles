--leap
require("leap").add_default_mappings()
vim.keymap.del({ 'x', 'o' }, 'x')
vim.keymap.del({ 'x', 'o' }, 'X')
vim.keymap.set('n', 's', function ()
  local focusable_windows = vim.tbl_filter(
    function (win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )
  require('leap').leap { target_windows = focusable_windows }
end)

--neogen
require("neogen").setup({
    snippet_engine = "luasnip",
})

--translator 翻译
vim.api.nvim_command("let g:translator_default_engines = ['bing', 'google', 'haici', 'youdao']")

-- nvim-tree
local function tree_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set('n', 'x', api.node.navigate.parent_close, opts('Close Directory'))
end
require("nvim-tree").setup({
    on_attach = tree_on_attach,
    view = {
        width = "25%",
    },
    filters = {
        dotfiles = true,
    },
    modified = {
        enable = true,
    },
})

--autopairs
local npairs = require("nvim-autopairs")
npairs.setup({
    fast_wrap = {
        map = "<C-'>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
        disable_filetype = { "TelescopePrompt" },
    },
})

--comment
require('Comment').setup({
    padding = true,
    toggler = {
        line = '<leader>c ',
        block = '<leader>cb',
    },
    opleader = {
        line = '<leader>c ',
        block = '<leader>cb',
    },
})

require('bqf').setup({
    auto_enable = true,
    auto_resize_height = true, -- highly recommended enable
    preview = {
        win_height = 12,
        win_vheight = 12,
        delay_syntax = 80,
        border_chars = { '┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█' },
        show_title = false,
        should_preview_cb = function(bufnr, qwinid)
            local ret = true
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            local fsize = vim.fn.getfsize(bufname)
            if fsize > 250 * 1024 then
                -- skip file size greater than 100k
                ret = false
            elseif bufname:match('^fugitive://') then
                -- skip fugitive buffer
                ret = false
            end
            return ret
        end
    },
    -- make `drop` and `tab drop` to become preferred
    func_map = {
        drop = 'o',
        openc = 'O',
        split = '<C-s>',
        tabdrop = '<C-t>',
        -- set to empty string to disable
        tabc = '',
        ptogglemode = 'Z',
        sclear = 'ca',
        stogglebuf = 'zb',
    },
    filter = {
        fzf = {
            action_for = { ['ctrl-s'] = 'split', ['ctrl-t'] = 'tab drop' },
            extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' }
        }
    }
})

require("which-key").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    window = {
        margin = { 0, 0, 0, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]

        border = "single",        -- none, single, double, shadow
    },
})
require("todo-comments").setup({
    signs = false, -- show icons in the signs column
    highlight = {
        multiline = false,
        keyword = "bg",
        after = ""
    }
})
