vim.g.scratch_filetype = "txt"
vim.g.scratch_height = 20
vim.g.scratch_persistence_file = '~/Documents/scratch.txt'

vim.keymap.set({"n", "v"}, "<leader>x", ":Scratch<CR>")
