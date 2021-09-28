local M = {}

M.cfg = function()
  vim.opt.completeopt = 'menu,menuone,noselect'

  local cmp = require 'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
      end
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = {
      {name = 'nvim_lsp'},
      {name = 'vsnip'},
      {name = 'buffer'}
    },
    formatting = {
  format = function(entry, vim_item)
    -- fancy icons and a name of kind
    vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

    -- set a name for each source
    vim_item.menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Latex]",
    })[entry.source.name]
    return vim_item
  end,
},
  })
end

return M
