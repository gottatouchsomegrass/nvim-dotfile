return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "FelipeLema/cmp-async-path",
    url = "https://github.com/FelipeLema/cmp-async-path",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "typescript", "tsx", "javascript",
        "c", "cpp", "go", "python",
        "json", "yaml", "markdown",
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
