local builtin = require('telescope.builtin')
local dropdown_options = {
  layout_config = {
    preview_cutoff = 1,
    width = function(_, max_columns, _)
      return math.min(max_columns, 150)
    end,

    height = function(_, _, max_lines)
      return math.min(max_lines, 20)
    end,
  },
}

vim.keymap.set('n', '<leader>pf', function() builtin.find_files(require('telescope.themes').get_dropdown(dropdown_options)) end, {})
vim.keymap.set('n', '<C-p>', function() builtin.git_files(require('telescope.themes').get_dropdown(dropdown_options)) end, {})
vim.keymap.set('n', '<leader>ps', function() builtin.live_grep(require('telescope.themes').get_dropdown(dropdown_options)) end, {})
