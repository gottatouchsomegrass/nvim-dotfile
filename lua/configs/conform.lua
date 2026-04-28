local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    
    -- Add these
    c = { "clang_format" },
    cpp = { "clang_format" },
    python = { "black" },
    go = { "gofmt" },
  },

  -- Uncomment for format on save
  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
