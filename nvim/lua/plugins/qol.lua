return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            local api = require("Comment.api")
            require("Comment").setup()
            vim.keymap.set("n", "<leader>/", api.toggle.linewise.current,
                { noremap = true, silent = true, desc = "Toggle comment line" })
            vim.keymap.set("x", "<leader>/", function()
                local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
                vim.api.nvim_feedkeys(esc, "nx", false)
                api.toggle.linewise(vim.fn.visualmode())
            end, { noremap = true, silent = true, desc = "Toggle comment selection" })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    }
}
