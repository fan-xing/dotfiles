require("gitsigns").setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    -- Actions
    map("n", "<leader>hp", gs.preview_hunk)
    map("n", "<leader>hR", gs.reset_hunk)
  end,
  current_line_blame_opts = {
    virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
  },
}

require("git-conflict").setup {
  default_mappings = {
    ours = "co",
    theirs = "ct",
    none = "c0",
    both = "cb",
    next = "]x",
    prev = "[x",
  },
}
