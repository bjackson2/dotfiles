return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    vim.keymap.set(
      "n",
      "<leader>fi",
      ":Neotree filesystem reveal<CR>",
      { silent = true, desc = "Show file in finder" }
    ),
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
      filesystem = {
        follow_current_file = { enabled = false },
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
        hide_by_name = {
          "node_modules",
        },
      },
    },
  },
}
