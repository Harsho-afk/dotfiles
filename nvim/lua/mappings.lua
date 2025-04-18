require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>fe","<cmd>Telescope emoji<CR>", { desc = "[S]earch [E]moji" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
