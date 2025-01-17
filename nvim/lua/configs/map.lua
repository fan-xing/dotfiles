-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope oldfiles<cr>")
vim.keymap.set("n", "<leader>rg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>")
vim.keymap.set("n", "<F10>", "<cmd>Telescope lsp_dynamic_workspace_symbols <cr>")
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<cr>")
--鼠标
vim.keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>")
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>")
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope lsp_type_definitions<CR>")
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>")

-- lsp
vim.keymap.set("n", "<leader>fe", "<cmd>lua vim.diagnostic.setloclist()<cr>")
vim.keymap.set({ "v", "n" }, "<leader>fl", "<cmd>Neoformat<cr>")
vim.keymap.set("n", "<Leader>fh", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "g?", vim.diagnostic.open_float)
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]e", vim.diagnostic.goto_next)
--nvim-tree
vim.keymap.set("n", "<F2>", "<Cmd>NvimTreeFindFileToggle<CR>")

-- git
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

-- custom cmd
vim.keymap.set("n", "<C-h>", "<cmd>bp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>bn<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<C-q>", "<cmd>q<cr>")
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

vim.api.nvim_set_keymap("n", "<C-j>", ":lua next_error()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":lua pre_error()<cr>", { noremap = true })
-- 以前写的方法，现在用bufdelete插件了
function close_window_or_buffer()
  -- 关闭当前窗口
  local ok, err = pcall(vim.cmd, "close")
  if not ok then
    -- 发生异常时关闭当前缓冲区
    vim.cmd "bd"
    -- 用插件关闭，保留布局
  end
end

vim.api.nvim_set_keymap("n", "<C-x>", ":Bdelete<cr>", { noremap = true })
function print_current_word_result()
  local search_word = vim.fn.expand "<cword>"
  vim.cmd(":set nonumber | g/" .. search_word .. "/p")
  vim.cmd ":set number"
end

vim.api.nvim_set_keymap("n", "<leader>fw", "*", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>pw", ":lua print_current_word_result()<CR>", { noremap = true })
-- 映射 <leader>nh，取消当前高亮匹配的结果
function no_highlight()
  vim.cmd "noh"
end

vim.api.nvim_set_keymap("n", "<leader>nh", ":lua no_highlight()<cr>", { noremap = true })
-- 映射 <S-q> 关闭locallist quickfix
vim.keymap.set("n", "<S-q>", "<Cmd>cclose | cexpr [] | lclose | lexpr []<CR>")
-- 映射 <leader>cpf，将当前文件名复制到系统剪贴板中
vim.api.nvim_set_keymap("n", "<leader>cpf", ":let @+ = expand('%:t')<CR>", { noremap = true })
-- 映射 <leader>cpw，将当前单词复制到系统剪贴板中
vim.api.nvim_set_keymap(
  "n",
  "<leader>cpw",
  ":let @+ = expand('%:t').expand('::').expand('<cword>')<CR>",
  { noremap = true }
)
-- 映射 <leader>cpl，将当前光标所在行复制到系统剪贴板中
vim.api.nvim_set_keymap("n", "<leader>cpl", ":let @+ = expand('%:t').expand(':').line('.')<CR>", { noremap = true })
-- 该命令来自 Copilot 插件，用于实现智能编写代码的功能
-- vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept(\'\\<CR>\')', { expr = true, silent = true, script = true })
-- 刷新全部buffer
vim.api.nvim_set_keymap("n", "<leader>be", ":bufdo e<CR>", { noremap = true })
vim.keymap.set("i", "<C-c>", "<ESC>")
-- 复制后不再跳转开头
vim.keymap.set("v", "y", "ygv<esc>")

-- 开关line number
vim.api.nvim_set_keymap("n", "<leader>ln", ":set number!<CR>", { noremap = true })

-- 粘贴p和P行为交换
vim.keymap.set({ "x" }, "p", "P")
vim.keymap.set({ "x" }, "P", "p")

-- 菜单menu
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

-- leap
vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')

