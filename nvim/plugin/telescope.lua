--telescope

local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-b>"] = "results_scrolling_up",
                ["<C-f>"] = "results_scrolling_down",
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-q>"] = "close",
                ["<C-p>"] = action_layout.toggle_preview,
                ["<C-=>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-a>"] = require("telescope.actions").cycle_history_prev,
                ["<C-g>"] = require("telescope.actions").cycle_history_next,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            },
            n = {
                ["<C-b>"] = "results_scrolling_up",
                ["<C-f>"] = "results_scrolling_down",
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-q>"] = "close",
                ["<C-p>"] = action_layout.toggle_preview,
                ["<C-=>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-a>"] = require("telescope.actions").cycle_history_prev,
                ["<C-g>"] = require("telescope.actions").cycle_history_next,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            },
        },
        prompt_prefix = " ",
        selection_caret = " ",
        multi_icon = "",
        --layout_strategy = "center",
        layout_strategy = "horizontal",
        --layout_strategy = "vertical",
        sorting_strategy = "ascending",
        dynamic_preview_title = true,
        layout_config = {
            center = {
                width = 0.7,
                prompt_position = "top",
                mirror = "true",
            },
            vertical = {
                width = 0.7,
                prompt_position = "top",
                --mirror = "true",
                height = 0.7,
            },
            horizontal = {
                width = 0.7,
                prompt_position = "top",
                preview_width = 0.7,
                height = 0.5,
            },
            -- other layout configuration here
        },
        preview = {
            hide_on_startup = true,
            treesitter = false,
        },
        -- other defaults configuration here
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim", -- add this value
        },
    },
    extensions = {},
    pickers = {
        find_files = {
            theme = "ivy",
        },
    },
})
require("telescope").load_extension("projects")
require("telescope").load_extension("undo")

--project
require("project_nvim").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
})
