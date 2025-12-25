--leap
require("leap").setup {}

--neogen
require("neogen").setup {
  snippet_engine = "luasnip",
}

--translator 翻译
vim.api.nvim_command "let g:translator_default_engines = ['bing', 'google', 'haici', 'youdao']"

-- nvim-tree
local function tree_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "x", api.node.navigate.parent_close, opts "Close Directory")
end
require("nvim-tree").setup {
  on_attach = tree_on_attach,
  update_focused_file = {
    enable = true,
  },
  view = {
    width = "20%",
    centralize_selection = true,
  },
  filters = {
    dotfiles = true,
    git_ignored = false,
  },
  modified = {
    enable = true,
  },
  renderer = {
    highlight_git = "all",
    highlight_modified = "all",
  },
}
local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
vim.api.nvim_create_autocmd("User", {
  pattern = "NvimTreeSetup",
  callback = function()
    local events = require("nvim-tree.api").events
    events.subscribe(events.Event.NodeRenamed, function(data)
      if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
        data = data
        Snacks.rename.on_rename_file(data.old_name, data.new_name)
      end
    end)
  end,
})

--autopairs
local npairs = require "nvim-autopairs"
npairs.setup {
  fast_wrap = {
    map = "<C-'>",
    chars = { "{", "[", "(", '"', "'", "“", "‘", "（", "）" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey = "Comment",
    disable_filetype = { "TelescopePrompt" },
  },
}

--comment
require("Comment").setup {
  padding = true,
  toggler = {
    line = "<leader>c ",
    block = "<leader>cb",
  },
  opleader = {
    line = "<leader>c ",
    block = "<leader>cb",
  },
}

require("which-key").setup {}
require("quicker").setup {}

require("leetcode").setup {
  lang = "golang",
  cn = { -- leetcode.cn
    enabled = true, ---@type boolean
    translator = true, ---@type boolean
    translate_problems = true, ---@type boolean
  },
  injector = { ---@type table<lc.lang, lc.inject>
    ["golang"] = {
      before = { "package leetcode" },
    },
  },
}
