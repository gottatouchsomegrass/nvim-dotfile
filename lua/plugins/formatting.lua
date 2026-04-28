return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                -- Synced with conform.lua
                ensure_installed = { 
                    "stylua", 
                    "clang-format", 
                    "black", 
                    "prettier",
                    "gofmt",
                },
            })
        end
    },

    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = function()
            return require "configs.conform"
        end,
        config = function(_, opts)
            local conform = require("conform")
            conform.setup(opts)

            vim.keymap.set({ "n", "v" }, "<leader>gf", function()
                conform.format({ async = true, lsp_fallback = true })
            end, { desc = "Format Code" })
        end
    }
}
