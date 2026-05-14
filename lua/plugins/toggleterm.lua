return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<c-\>]],
      direction = "horizontal",
      close_on_exit = true,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    vim.keymap.set("n", "<leader>pd", function()
      Terminal:new({ cmd = "pnpm dev", close_on_exit = false }):toggle()
    end, { desc = "Run pnpm dev" })

    vim.keymap.set("n", "<leader>ar", function()
      Terminal:new({ cmd = "air", close_on_exit = false }):toggle()
    end, { desc = "Run Air" })

    vim.keymap.set("n", "<leader>gr", function()
      Terminal:new({ cmd = "go run .", close_on_exit = false }):toggle()
    end, { desc = "Go run" })

    vim.keymap.set("n", "<leader>cpp", function()
      local file = vim.fn.expand("%")
      Terminal:new({ cmd = "g++ " .. file .. " -o out && ./out", close_on_exit = false }):toggle()
    end, { desc = "Compile and run C++" })

    vim.keymap.set("n", "<leader>py", function()
      local file = vim.fn.expand("%")
      Terminal:new({ cmd = "python " .. file, close_on_exit = false }):toggle()
    end, { desc = "Run Python" })

  end,
}
