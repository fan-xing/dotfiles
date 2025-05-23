local autocmd = vim.api.nvim_create_autocmd

-- 回复光标位置
autocmd({'BufWinEnter'}, {
  pattern = '*',
  command = 'silent! normal! g`"zv',
})

autocmd("VimEnter", {
  command = ":silent !kitty @ set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
  command = ":silent !kitty @ set-spacing padding=20 margin=10",
})
