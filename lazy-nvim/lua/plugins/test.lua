return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { silent = true, desc = "Run current test" }),
    vim.keymap.set("n", "<leader>a", ":TestFile<CR>", { silent = true, desc = "Run all tests in file" }),
    vim.cmd([[let test#strategy = 'vimux']]),
  },
}
