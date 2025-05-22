function next_error()
  if vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "silent! lnext"
  else
    vim.cmd "silent! cnext"
  end
end

function pre_error()
  if vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "silent! lpre"
  else
    vim.cmd "silent! cpre"
  end
end

function print_current_word_result()
  local search_word = vim.fn.expand "<cword>"
  vim.cmd(":set nonumber | g/" .. search_word .. "/p")
  vim.cmd ":set number"
end

function no_highlight()
  vim.cmd "noh"
end

function has_plugin(plugin)
  local list = require("lazy.core.config").plugins
  for k, v in pairs(list) do
    if k == plugin then
      return true
    end
  end
  return false
end
