return {
    {
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                css = {
                    RGB      = true,
                    RRGGBB   = true,
                    names    = true,
                    RRGGBBAA = true,
                    rgb_fn   = true,
                    hsl_fn   = true,
                    css      = true,
                    css_fn   = true,
                    mode     = 'background',

                },
                'javascript',
                html = {
                    mode = 'foreground',
                }
            })
        end
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        config = function()
            require("markview").setup({
                preview = { enable = false }
            });
            vim.api.nvim_set_keymap("n", "<leader>m", "<CMD>Markview<CR>", { desc = "Toggles `markview` previews globally." });
            vim.api.nvim_set_keymap("i", "<Ctrl-m>", "<CMD>Markview HybridToggle<CR>", { desc = "Toggles `hybrid mode` globally." });
            vim.api.nvim_set_keymap("n", "<leader>s", "<CMD>Markview splitToggle<CR>", { desc = "Toggles `splitview` for current buffer." });
        end
        -- Completion for `blink.cmp`
        -- dependencies = { "saghen/blink.cmp" },
    },
}
