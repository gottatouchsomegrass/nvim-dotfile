require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",           -- ← back to ts_ls (correct for NvChad)
  "clangd",
  "gopls",
  "pyright",
  "tailwindcss",
}

vim.lsp.enable(servers)
