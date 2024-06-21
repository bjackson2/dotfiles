return {
  {
    "David-Kunz/jester",
    dependencies = {
      "preservim/vimux",
    },
    config = function()
      require("jester").setup({
        cmd = 'node node_modules/.bin/jest "$file"',
        escapeRegex = true,
      })
    end,
    vim.keymap.set(
      "n",
      "<leader>jt",
      ":lua require'jester'.run()<CR>",
      { silent = true, desc = "Run current jest test" }
    ),
    vim.keymap.set(
      "n",
      "<leader>ja",
      ":lua require'jester'.run_file()<CR>",
      { silent = true, desc = "Run all tests in file" }
    ),
  },
}
