return {
  {
    "tpope/vim-fugitive",
    vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", { desc = "git add" }),
    vim.keymap.set("n", "<leader>gc", ":Git commit<CR><CR>", { desc = "git commit" }),
    vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "git blame" }),
    vim.keymap.set("n", "<leader>gl", ":Gclog -10 -- %<CR>", { desc = "git log current file" }),
  },
}
