return {
  {
    "nvim-telescope/telescope.nvim",
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
        },
      }
    end,
  },
}
