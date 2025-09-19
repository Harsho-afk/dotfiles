return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("diffview").setup()
            -- Diffview keymaps
                vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
                vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
                vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>", { desc = "File history" })
                vim.keymap.set("n", "<leader>dr", "<cmd>DiffviewRefresh<CR>", { desc = "Refresh Diffview" })
        end,
    }
}
