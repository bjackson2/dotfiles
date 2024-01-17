-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Buffers, tabs
vim.keymap.set("n", "<leader>ba", ":bufdo bd<cr>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>bw", ":w<CR>", { desc = "Write current buffer" })
vim.keymap.set("n", "<leader>bv", ":vs<CR>", { desc = "Vertically split buffer" })
vim.keymap.set("n", "<leader>bs", ":sp<CR>", { desc = "Horizontally split buffer" })
vim.keymap.set("n", "<leader>bq", ":q<CR>", { desc = "Quit current buffer" })

-- Running tests
vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { silent = true })
vim.keymap.set("n", "<leader>a", ":TestFile<CR>", { silent = true })
