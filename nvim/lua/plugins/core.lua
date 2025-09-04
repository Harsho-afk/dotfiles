return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false, -- show dotfiles
                },
            }

            vim.keymap.set("n","<C-n>",":NvimTreeToggle<CR>",{ noremap = true, silent = true })
        end,
    },
    {
        'akinsho/bufferline.nvim', 
        version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup {
                options = {
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {"close"}
                    }
                }
            }
            vim.keymap.set("n", "<C-Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<C-S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<C-S-Right>", "<Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<C-S-Left>", "<Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>b", "<Cmd>bdelete<CR>", { noremap = true, silent = true })
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {
                        statusline = {"NvimTree"},
                        winbar = {"NvimTree"},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                        refresh_time = 16, -- ~60fps
                        events = {
                            'WinEnter',
                            'BufEnter',
                            'BufWritePost',
                            'SessionLoadPost',
                            'FileChangedShellPost',
                            'VimResized',
                            'Filetype',
                            'CursorMoved',
                            'CursorMovedI',
                            'ModeChanged',
                        },
                    }
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end,
    }
}
