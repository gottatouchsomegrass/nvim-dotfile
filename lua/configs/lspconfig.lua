require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "gopls",
  "pyright",
  "tailwindcss",
  "dockerls",   -- ← add this
  "yamlls",     -- ← add this
}

vim.lsp.enable(servers)
