return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>gc", false },
    },
    opts = function()
      local actions = require("telescope.actions")

      return {
        defaults = {
          mappings = {
            i = {
              ["<S-Down>"] = actions.cycle_history_next,
              ["<S-Up>"] = actions.cycle_history_prev,
            },
          },
          path_display = { "truncate" },
          file_ignore_patterns = { "spec/vcr_cassettes", "tmp", "node_modules", "vendor" },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      }
    end,
  },
}
