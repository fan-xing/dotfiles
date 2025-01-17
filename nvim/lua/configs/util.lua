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
  },
  modified = {
    enable = true,
  },
}

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

--toggleterm
require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-\>]],
  shell = "zsh",
  shade_terminals = false,
  direction = "horizontal",
  winbar = {
    enabled = true,
  },
}

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<M-w>", [[<C-\><C-n><C-w>]], opts)
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
end
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
