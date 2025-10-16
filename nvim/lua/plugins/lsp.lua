return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = {
                                "vim",
                                "require",
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = { enable = false },
                            format = { enable = true }
                        },
                    },
                },
            })

            mason.setup()
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "pylsp", "rust_analyzer", "clangd", "jdtls", "ts_ls" },
            })

            -- Snippets setup
            require("luasnip.loaders.from_vscode").lazy_load()

            -- nvim-cmp setup
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })

            vim.keymap.set("n", "gd", vim.lsp.buf.definition,
                { noremap = true, silent = true, desc = "Go to Definition" })
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
                { noremap = true, silent = true, desc = "Go to Declaration" })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
                { noremap = true, silent = true, desc = "Go to Implementation" })
            vim.keymap.set("n", "gr", vim.lsp.buf.references,
                { noremap = true, silent = true, desc = "Go to References" })
            vim.keymap.set("n", "K", vim.lsp.buf.hover,
                { noremap = true, silent = true, desc = "Show Hover Information" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
                { noremap = true, silent = true, desc = "Code Action" })
            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format { async = true }
            end, { noremap = true, silent = true, desc = "Format Code" })
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float,
                { noremap = true, silent = true, desc = "Show Line Diagnostics" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
                { noremap = true, silent = true, desc = "Next Diagnostic" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
                { noremap = true, silent = true, desc = "Previous Diagnostic" })
            vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist,
                { noremap = true, silent = true, desc = "Diagnostics to Quickfix" })
        end,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "ConformInfo" },
        config = function()
            require("conform").setup({
                format_on_save = nil,
                formatters_by_ft = {
                    python = { "black" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    json = { "prettier" },
                    sh = { "shfmt" },
                },
            })

            vim.keymap.set("n", "<leader>f", function()
                require("conform").format({ async = true, lsp_fallback = true })
            end, { desc = "Format code" })
        end,
    },
}
