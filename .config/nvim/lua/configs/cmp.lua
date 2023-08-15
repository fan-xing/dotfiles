--nvim-cmp
local cmp = require "cmp"
local luasnip = require "luasnip"

-- Global setup.
cmp.setup {
  completion = {
    completeopt = "menu,menuone,noselect,noinsert",
  },
  formatting = {
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format { maxwidth = 50 }(entry, vim_item)
      return kind
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
        -- elseif has_words_before() then
        -- 	cmp.complete()
      else
        fallback()
      end
    end, { "i", "s", "c" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", "c" }),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s", "c" }),
    ["<C-g>"] = cmp.mapping(cmp.mapping.complete(), { "i", "s", "c" }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Replace },
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp", group_index = 1 },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = "luasnip" }, -- For luasnip users.
    -- { name = 'snippy' }, -- For snippy users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = "path" },
    { name = "buffer", group_index = 2 },
    { name = "nvim_lua" },
    { name = "nvim_lsp_signature_help" },
  },
}
-- `/` cmdline setup.
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "path" },
    { name = "cmdline" },
  },
})

--luasnippets
require("luasnip.loaders.from_vscode").lazy_load()
require("lspkind").cmp_format {
  maxwidth = 50,
}
