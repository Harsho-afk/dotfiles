-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
    "rebelot/kanagawa.nvim",
    lazy = false,    -- load during startup
    priority = 1000, -- load before other plugins
    config = function()
        vim.cmd("colorscheme kanagawa")
    end,
}
