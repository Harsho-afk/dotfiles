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
                    dotfiles = true,
                    git_ignored = true,
                },
            }

            vim.keymap.set("n","<C-n>",":NvimTreeToggle<CR>",{ noremap = true, silent = true })
            vim.keymap.set("n", "<leader>h", function()
                local api = require("nvim-tree.api")
                api.tree.toggle_hidden_filter()
            end, { noremap = true, silent = true, desc = "Toggle hidden files in NvimTree" })
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
                    },
                    offsets = {
                        {
                            filetype = "NvimTree",
                            separator = false,
                            highlight = "Directory",
                        }
                    }
                },
            }

            vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<S-Right>", "<Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<S-Left>", "<Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>b", function()
              local bufnr = vim.api.nvim_get_current_buf()
              local buffers = vim.fn.getbufinfo({ buflisted = 1 })
              if #buffers > 1 then
                vim.cmd("bnext")
                if bufnr == vim.api.nvim_get_current_buf() then
                  vim.cmd("bprevious")
                end
              else
                vim.cmd("enew")
              end
              if vim.api.nvim_buf_is_valid(bufnr) then
                vim.cmd("bdelete " .. bufnr)
              end
            end, { noremap = true, silent = true })
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = false,
                    theme = 'auto',
                    globalstatus = true,
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {
                        statusline = {"NvimTree"},
                        winbar = {"NvimTree"},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
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
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }
}
