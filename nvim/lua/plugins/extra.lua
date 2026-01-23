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
    }
}
