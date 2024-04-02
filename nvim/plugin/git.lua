--toggleterm
require("toggleterm").setup({
    size = 20,
    open_mapping = [[<C-\>]],
    shell = "zsh"
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

--custom lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    float_opts = {
        border = "none",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

function _lazygit_toggle()
    lazygit.dir = vim.fn.expand("%:p:h")
    lazygit:toggle()
end

require("gitsigns").setup({
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return "<Ignore>"
        end, { expr = true })

        -- Actions
        map("n", "<leader>hp", gs.preview_hunk)
        map("n", "<leader>hR", gs.reset_hunk)
    end,
    current_line_blame_opts = {
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    }
})

require('blame').setup({
    merge_consecutive = false,
})
require('git-conflict').setup({
    default_mappings = {
        ours = 'o',
        theirs = 't',
        none = '0',
        both = 'b',
        next = 'n',
        prev = 'p',
    },
})
