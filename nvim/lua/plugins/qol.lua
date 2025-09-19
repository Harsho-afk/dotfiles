return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            local api = require("Comment.api")
            require("Comment").setup()
            vim.keymap.set("n", "<leader>/", api.toggle.linewise.current, { desc = "Toggle comment line" })
        end,
    },
}
