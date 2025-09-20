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
            vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>",
                { noremap = true, silent = true, desc = "Open Diffview" })
            vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>",
                { noremap = true, silent = true, desc = "Close Diffview" })
            vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>",
                { noremap = true, silent = true, desc = "File history" })
            vim.keymap.set("n", "<leader>dr", "<cmd>DiffviewRefresh<CR>",
                { noremap = true, silent = true, desc = "Refresh Diffview" })
        end,
    }
}
