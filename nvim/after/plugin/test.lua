vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { silent = true })
vim.keymap.set("n", "<leader>a", ":TestFile<CR>", { silent = true })

vim.g["test#strategy"] = "tslime"
vim.g.tslime_always_current_session = 1
vim.g.tslime_always_current_window = 1
