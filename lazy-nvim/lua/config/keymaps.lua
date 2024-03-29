-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Buffers, tabs
vim.keymap.set("n", "<leader>ba", ":bufdo bd<cr>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>bw", ":w<CR>", { desc = "Write current buffer" })
vim.keymap.set("n", "<leader>bq", ":q<CR>", { desc = "Quit current buffer" })
vim.keymap.set("n", "<leader>wv", ":vs<CR>", { desc = "Vertically split buffer" })
vim.keymap.set("n", "<leader>ws", ":sp<CR>", { desc = "Horizontally split buffer" })

-- Text
vim.keymap.set("n", "<leader>z", "za", { desc = "Toggle fold at cursor" })
