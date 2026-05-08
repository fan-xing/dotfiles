-- git workspace helpers
local function find_repos(workspace, with_changes)
  local handle = io.popen(string.format(
    "find %s -maxdepth 2 -name '.git' -type d 2>/dev/null",
    vim.fn.shellescape(workspace)
  ))
  local repos = {}
  if handle then
    for line in handle:lines() do
      local repo = line:gsub("/.git$", "")
      if with_changes then
        local s = vim.fn.system(string.format("git -C %s status --porcelain 2>/dev/null", vim.fn.shellescape(repo)))
        if vim.trim(s) ~= "" then table.insert(repos, repo) end
      else
        table.insert(repos, repo)
      end
    end
    handle:close()
  end
  return repos
end

local function pick_repo(repos, callback)
  if #repos == 0 then
    vim.notify("No repos found", vim.log.levels.INFO)
  elseif #repos == 1 then
    callback(repos[1])
  else
    vim.ui.select(repos, { prompt = "Select repo:" }, function(choice)
      if choice then callback(choice) end
    end)
  end
end

local function get_ws_root()
  local cwd = vim.fn.getcwd()
  return vim.fn.isdirectory(cwd .. "/.git") == 1 and cwd or nil
end

-- picker
vim.keymap.set("n", "<leader>ff", "<cmd>lua Snacks.picker.files()<cr>")
vim.keymap.set("n", "<leader>fm", "<cmd>lua Snacks.picker.smart()<cr>")
vim.keymap.set("n", "<leader>rg", "<cmd>lua Snacks.picker.grep()<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>lua Snacks.picker.grep_word()<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>lua Snacks.picker.buffers()<cr>")
vim.keymap.set("n", "<leader>fo", "<cmd>lua Snacks.picker.lsp_symbols()<cr>")
vim.keymap.set("n", "<F10>", "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>")
vim.keymap.set("n", "<F12>", "<cmd>lua Snacks.picker.diagnostics()<cr>")
vim.keymap.set("n", "<leader>fr", "<cmd>lua Snacks.picker.lsp_references()<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>")
vim.keymap.set("n", "<leader>fi", "<cmd>lua Snacks.picker.lsp_implementations()<cr>")
vim.keymap.set("n", "<leader>ft", "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>")

vim.keymap.set("n", "<leader>gs", function()
  local function open(cwd)
    Snacks.picker.git_status({ cwd = cwd })
  end
  local root = get_ws_root()
  if root then
    open(root)
  else
    pick_repo(find_repos(vim.fn.getcwd(), true), open)
  end
end)

-- lsp
vim.keymap.set("n", "<leader>fe", "<cmd>lua vim.diagnostic.setloclist()<cr>")
vim.keymap.set({ "v", "n" }, "<leader>fl", "<cmd>Neoformat<cr>")
vim.keymap.set("n", "<Leader>fh", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<Leader>fc", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "g?", vim.diagnostic.open_float)

vim.keymap.set("n", "<F2>", "<Cmd>NvimTreeFindFileToggle<CR>")

-- git
vim.keymap.set("n", "<leader>gg", function()
  local file_dir = vim.fn.expand("%:p:h")
  local cwd = (file_dir ~= "" and vim.fn.isdirectory(file_dir) == 1) and file_dir or vim.fn.getcwd()
  Snacks.lazygit({ cwd = cwd })
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gf", "<cmd>lua Snacks.lazygit.log_file()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gl", function()
  local root = get_ws_root()
  if root then
    Snacks.lazygit.log({ cwd = root })
  else
    pick_repo(find_repos(vim.fn.getcwd(), false), function(repo)
      Snacks.lazygit.log({ cwd = repo })
    end)
  end
end, { noremap = true, silent = true })

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
-- Copilot补全
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
vim.keymap.set({"n","t"}, "<C-/>", function()
  Snacks.terminal.toggle("claude", {
    win = {
      style = "terminal",
      position = "bottom",
      height = 0.4,
      title = " Claude ",
      title_pos = "center",
    },
  })
end, { desc = "Toggle Claude terminal" })
