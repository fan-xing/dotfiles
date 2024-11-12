--telescope

local action_layout = require "telescope.actions.layout"
local actions = require "telescope.actions"
require("telescope").setup {
  defaults = {
    path_display = { "filename_first" },
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
    selection_caret = " ",
    multi_icon = "",
    -- layout_strategy = "horizontal",
    layout_strategy = "center",
    dynamic_preview_title = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.80,
        width = 0.60,
        height = 0.60,
        preview_cutoff = 120,
      },
      center = {
        anchor = "E",
        width = 0.50,
        height = 0.40,
      },
    },
    preview = {
      hide_on_startup = true,
      treesitter = false,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
  pickers = {
    find_files = {
      fname_width = 70,
      theme = "ivy",
    },
    oldfiles = {
      fname_width = 70,
      theme = "ivy",
      only_cwd = true,
    },
    live_grep = {
      fname_width = 70,
      theme = "ivy",
    },
    grep_string = {
      fname_width = 70,
    },
    buffers = {
      fname_width = 70,
      theme = "ivy",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
      },
    },
    lsp_document_symbols = {
      fname_width = 70,
      symbol_width = 70,
      ignore_symbols = { "variable", "string" },
      theme = "ivy",
    },
    lsp_dynamic_workspace_symbols = {
      fname_width = 70,
      symbol_width = 70,
      ignore_symbols = { "variable", "string" },
      theme = "ivy",
    },
    lsp_references = {
      fname_width = 70,
      include_declaration = false,
      theme = "ivy",
    },
    lsp_definitions = {
      fname_width = 70,
      theme = "ivy",
    },
    lsp_implementations = {
      fname_width = 70,
      theme = "ivy",
    },
  },
}
require("telescope").load_extension "projects"

--project
require("project_nvim").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  exclude_dirs = { "~/.config/nvim/*" },
}
