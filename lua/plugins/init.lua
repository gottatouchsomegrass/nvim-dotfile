return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "FelipeLema/cmp-async-path",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "typescript", "tsx", "javascript",
        "c", "cpp", "go", "python",
        "json", "yaml", "markdown", "bash",
        "dockerfile",
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "crnvl96/lazydocker.nvim",
    cmd = "LazyDocker",
    dependencies = { "kkharji/sqlite.lua" },
  },
}
