--toggleterm
require("toggleterm").setup({
    size = 20,
    open_mapping = [[<c-\>]],
})

--custom lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        float_opts = {
            border = "double",
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
require("diffview").setup({
    view = {
        -- Configure the layout and behavior of different types of views.
        -- Available layouts:
        --    |'diff1_plain'
        --    |'diff2_horizontal'
        --    |'diff2_vertical'
        --    |'diff3_horizontal'
        --    |'diff3_vertical'
        --    |'diff3_mixed'
        --    |'diff4_mixed'
        -- For more info, see ':h diffview-config-view.x.layout'.
        default = {
            -- Config for changed files, and staged files in diff views.
            layout = "diff2_horizontal",
        },
        merge_tool = {
            -- Config for conflicted files in diff views during a merge or rebase.
            layout = "diff3_mixed",
            disable_diagnostics = false, -- Temporarily disable diagnostics for conflict buffers while in the view.
        },
        file_history = {
            -- Config for changed files in file history views.
            layout = "diff2_vertical",
        },
    },
})
