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
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Indentation settings
vim.opt.tabstop = 4       -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4    -- Number of spaces used for each step of (auto)indent
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.smartindent = true -- Smart autoindenting when starting a new line

vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end
})

vim.keymap.set("n", "<leader>h", function()
  local api = require("nvim-tree.api")
  api.tree.toggle_hidden_filter()
end, { noremap = true, silent = true, desc = "Toggle hidden files in NvimTree" })

vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>", { noremap = true, silent = true })




-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },-- import your plugins
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "kanagawa" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
