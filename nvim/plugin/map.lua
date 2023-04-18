-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files fname_width=70 theme=ivy<cr>")
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope oldfiles fname_width=70 theme=ivy<cr>")
vim.keymap.set("n", "<leader>rg", "<cmd>Telescope live_grep fname_width=70 theme=ivy<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string fname_width=70 theme=ivy<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers fname_width=70 theme=ivy<cr>")
vim.keymap.set(
    "n",
    "<leader>fo",
    '<cmd>Telescope lsp_document_symbols ignore_symbols=["variable","field","string"] symbol_width=50 theme=ivy<cr>'
)
vim.keymap.set(
    "n",
    "<F10>",
    '<cmd>Telescope lsp_dynamic_workspace_symbols ignore_symbols=["variable","field"] fname_width=70 symbol_width=50 theme=ivy<cr>'
)
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references fname_width=70 theme=ivy<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions fname_width=70 theme=ivy<cr>")
vim.keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations fname_width=70 theme=ivy<cr>")
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects theme=ivy<cr>")
vim.keymap.set("n", "<leader>fe", "<cmd>lua vim.diagnostic.setloclist()<cr>")
vim.keymap.set({ "v", "n" }, "<leader>fl", "<cmd>lua vim.lsp.buf.format()<cr>")

-- lspsaga
-- vim.keymap.set("n", "<Leader>fh", "<cmd>lua vim.lsp.buf.hover()<CR>")
-- vim.keymap.set('n', 'g?', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<Leader>fh", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "g?", "<cmd>Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

--nvim-tree
vim.keymap.set("n", "<F2>", "<Cmd>NvimTreeToggle<CR>")

--ufo
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

--dap dapui
vim.keymap.set("n", "<F4>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set(
    "n",
    "<Leader>B",
    "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"
)
vim.keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F6>", "<Cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F7>", "<Cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F8>", "<Cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F9>", '<cmd>lua require("dapui").toggle()<CR>')

-- lazygit
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

-- custom cmd
vim.keymap.set("n", "<C-h>", "<cmd>bp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>bn<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<C-q>", "<cmd>q<cr>")
function closeWindowOrBuffer()
    -- 关闭当前窗口
    local ok, err = pcall(vim.cmd, 'close')
    if not ok then
        -- 发生异常时关闭当前缓冲区
        vim.cmd('bd')
    end
end

vim.keymap.set("n", "<C-x>", "<cmd>lua closeWindowOrBuffer()<cr>")
-- 映射 <leader>fw，搜索当前光标所在单词并高亮匹配结果
vim.api.nvim_set_keymap('n', '<leader>fw', ':<C-U><C-R>=printf(\'/%s\\C\', expand(\'<cword>\'))<CR><CR>',
    { noremap = true })
-- 映射 <leader>nh，取消当前高亮匹配的结果
vim.api.nvim_set_keymap('n', '<leader>nh', ':<C-U><C-R>=printf(\'noh\')<CR><CR>', { noremap = true })
-- 映射 <S-q> 关闭locallist quickfix
vim.keymap.set("n", "<S-q>", "<Cmd>cclose | cexpr [] | lclose | lexpr []<CR>")
-- 映射 <leader>cpf，将当前文件名复制到系统剪贴板中
vim.api.nvim_set_keymap('n', '<leader>cpf', ':let @+ = expand(\'%:t\')<CR>', { noremap = true })
-- 映射 <leader>cpw，将当前单词复制到系统剪贴板中
vim.api.nvim_set_keymap('n', '<leader>cpw', ':let @+ = expand(\'%:t\').expand(\':\').expand(\'<cword>\')<CR>',
    { noremap = true })
-- 映射 <leader>cpl，将当前光标所在行复制到系统剪贴板中
vim.api.nvim_set_keymap('n', '<leader>cpl', ':let @+ = expand(\'%:t\').expand(\':\').line(\'.\')<CR>', { noremap = true })
-- 映射 <C-c>，在插入模式下按下 Ctrl+C 进入普通模式
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true })
-- 该命令来自 Copilot 插件，用于实现智能编写代码的功能
-- vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept(\'\\<CR>\')', { expr = true, silent = true, script = true })
