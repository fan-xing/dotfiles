-- picker
if has_plugin "snacks.nvim" then
  vim.keymap.set("n", "<leader>ff", "<cmd>lua Snacks.picker.files()<cr>")
  vim.keymap.set("n", "<leader>fm", "<cmd>lua Snacks.picker.smart()<cr>")
  vim.keymap.set("n", "<leader>rg", "<cmd>lua Snacks.picker.grep()<cr>")
  vim.keymap.set("n", "<leader>fg", "<cmd>lua Snacks.picker.grep_word()<cr>")
  vim.keymap.set("n", "<leader>fb", "<cmd>lua Snacks.picker.buffers()<cr>")
  vim.keymap.set("n", "<leader>fo", "<cmd>lua Snacks.picker.lsp_symbols()<cr>")
  vim.keymap.set("n", "<F10>", "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>")
  vim.keymap.set("n", "<leader>fr", "<cmd>lua Snacks.picker.lsp_references()<cr>")
  vim.keymap.set("n", "<leader>fd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>")
  vim.keymap.set("n", "<leader>fi", "<cmd>lua Snacks.picker.lsp_implementations()<cr>")
  vim.keymap.set("n", "<leader>ft", "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>")
  vim.keymap.set("n", "<leader>gs", "<cmd>lua Snacks.picker.git_status()<cr>")
else
  vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
  vim.keymap.set("n", "<leader>fm", "<cmd>Telescope oldfiles<cr>")
  vim.keymap.set("n", "<leader>rg", "<cmd>Telescope live_grep<cr>")
  vim.keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>")
  vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
  vim.keymap.set("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>")
  vim.keymap.set("n", "<F10>", "<cmd>Telescope lsp_dynamic_workspace_symbols <cr>")
  vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>")
  vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<cr>")
  vim.keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>")
  vim.keymap.set("n", "<leader>ft", "<cmd>Telescope lsp_type_definitions<CR>")
  vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>")
end

-- lsp
vim.keymap.set("n", "<leader>fe", "<cmd>lua vim.diagnostic.setloclist()<cr>")
vim.keymap.set({ "v", "n" }, "<leader>fl", "<cmd>Neoformat<cr>")
vim.keymap.set("n", "<Leader>fh", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<Leader>fc", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "g?", vim.diagnostic.open_float)

vim.keymap.set("n", "<F2>", "<Cmd>NvimTreeFindFileToggle<CR>")

-- git
vim.keymap.set("n", "<leader>gg", "<cmd>lua Snacks.lazygit()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gf", "<cmd>lua Snacks.lazygit.log_file()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gl", "<cmd>lua Snacks.lazygit.log()<CR>", { noremap = true, silent = true })

-- custom cmd
vim.keymap.set("n", "<C-h>", "<cmd>bp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>bn<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<C-q>", "<cmd>q<cr>")

vim.keymap.set("n", "<C-j>", ":lua next_error()<cr>", { noremap = true })
vim.keymap.set("n", "<C-k>", ":lua pre_error()<cr>", { noremap = true })

vim.keymap.set("n", "<C-x>", ":lua Snacks.bufdelete()<cr>", { noremap = true })

vim.keymap.set("n", "<leader>fw", "*", { noremap = true })
vim.keymap.set("n", "<leader>pw", ":lua print_current_word_result()<CR>", { noremap = true })
-- 映射 <leader>nh，取消当前高亮匹配的结果

vim.keymap.set("n", "<leader>nh", ":lua no_highlight()<cr>", { noremap = true })
-- 映射 <S-q> 关闭locallist quickfix
vim.keymap.set("n", "<S-q>", "<Cmd>cclose | cexpr [] | lclose | lexpr []<CR>")
-- 映射 <leader>cpf，将当前文件名复制到系统剪贴板中
vim.keymap.set("n", "<leader>cpf", ":let @+ = expand('%:.')<CR>", { noremap = true })
-- 映射 <leader>cpw，将当前单词复制到系统剪贴板中
vim.keymap.set("n", "<leader>cpw", ":let @+ = expand('%:.').expand('::').expand('<cword>')<CR>", { noremap = true })
-- 映射 <leader>cpl，将当前光标所在行复制到系统剪贴板中
vim.keymap.set("n", "<leader>cpl", ":let @+ = expand('%:.').expand(':').line('.')<CR>", { noremap = true })
-- 该命令来自 Copilot 插件，用于实现智能编写代码的功能
-- vim.keymap.set('i', '<C-l>', 'copilot#Accept(\'\\<CR>\')', { expr = true, silent = true, script = true })
-- 刷新全部buffer
vim.keymap.set("n", "<leader>be", ":bufdo e<CR>", { noremap = true })
vim.keymap.set("i", "<C-c>", "<ESC>")
-- 复制后不再跳转开头
vim.keymap.set("v", "y", "ygv<esc>")

-- 开关相对line number
vim.keymap.set({ "n", "v" }, "<leader>ln", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end)

-- 粘贴p和P行为交换
vim.keymap.set({ "x" }, "p", "P")
vim.keymap.set({ "x" }, "P", "p")

-- leap
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")

-- terminal
vim.keymap.set({"n","t"}, "<C-\\>", "<cmd>lua Snacks.terminal.toggle()<cr>")
