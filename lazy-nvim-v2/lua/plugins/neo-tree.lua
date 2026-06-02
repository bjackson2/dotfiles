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
        filtered_items = {
          visible = true, -- show hidden items (not dimmed) so EVERYTHING is always visible
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_ignored = false,
          hide_hidden = false, -- Windows-only hidden attribute
          hide_by_name = {},
          hide_by_pattern = {},
          never_show = {},
          never_show_by_pattern = {},
        },
      },
    },
  },
}
