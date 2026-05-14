return {
  "folke/snacks.nvim",

  config = function()
    require("snacks").setup({
      indent = {
        enabled = true,
        indent = {
          char = "│",
          hl = "SnacksIndent",
        },
        scope = {
          enabled = true,
          char = "│",
          hl = "SnacksIndentScope",  -- this is what gives the highlighted active scope
          animate = {
            enabled = true,
            style = "up_down",
          },
        },
        chunk = {
          enabled = false,
        },
      },

      bigfile = { enabled = true, notify = false },
      quickfile = { enabled = true },
    })

    -- Optional: customize the colors to match your theme
    vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#3b3b3b" })
    vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#7aa2f7" })  -- blue scope line
  end
}
