return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { silent = true, desc = "Run current test" }),
    vim.keymap.set("n", "<leader>ta", ":TestFile<CR>", { silent = true, desc = "Run all tests in file" }),
    vim.cmd([[let test#strategy = 'vimux']]),
  },
}
