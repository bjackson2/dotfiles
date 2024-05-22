return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    vim.keymap.set(
      "n",
      "<leader>fi",
      ":Neotree filesystem reveal<CR>",
      { silent = true, desc = "Show file in finder" }
    ),
    opts = {
      filesystem = {
        follow_current_file = { enabled = false },
      },
    },
  },
}
