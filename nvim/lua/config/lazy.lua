vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Indentation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true

vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>", { noremap = true, desc = "Save File" })
vim.keymap.set("i", "<C-s>", "<Esc><Cmd>w<CR>a", { noremap = true, desc = "Save File" })

vim.keymap.set("n", "<C-c>", ":%y+<CR>", { noremap = true, desc = "Copy Entire File" })

vim.opt.number = true
vim.opt.relativenumber = true
vim.keymap.set("n", "<leader>n", function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative line numbers" })

vim.keymap.set("n", "<C-p>", "<Cmd>Lazy sync<CR>", { noremap = true, silent = true, desc = "Sync Lazy Plugins" })

vim.keymap.set("n", "<C-w><C-a>", "<Cmd>qa<CR>", { noremap = true, silent = true, desc = "Quit All Windows" })

vim.opt.whichwrap:append "<>hl"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "kanagawa" } },
    checker = { enabled = true },
})
