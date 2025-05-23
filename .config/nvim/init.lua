vim.g.mapleader = " "
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup {
  { import = "plugins" },
}
require "configs.library"
require "configs.git"
require "configs.cmp"
require "configs.map"
require "configs.setting"
require "configs.telescope"
require "configs.snacks"
require "configs.util"
require "configs.view"
require "configs.autocmd"
require "configs.lsp"
