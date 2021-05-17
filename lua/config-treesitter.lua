local M = {}

M.cfg = function()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {"bash", "go", "html", "javascript", "json", "lua", "python", "ruby", "rust", "toml", "typescript", "yaml"},
    highlight = {enable = true},
    incremental_selection = {
      enable = true,
      keymaps = {init_selection = "gnn", node_incremental = "grn", scope_incremental = "grc", node_decremental = "grm"}
    }
  }

  vim.o.foldmethod = 'expr'
  vim.o.foldexpr = 'nvim_treesitter#foldexpr'
end

return M
