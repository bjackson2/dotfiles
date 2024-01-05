vim.g.mapleader = " "

-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Buffers, tabs
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "H", ":bp <CR>")
vim.keymap.set("n", "L", ":bn <CR>")
vim.keymap.set("n", "<leader>bd", ":bp|bd #<cr>")
vim.keymap.set("n", "<leader>ba", ":bufdo bd<cr>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>n", ":tabnew<CR>")
vim.keymap.set("n", "<leader>vs", ":vs<CR>")
vim.keymap.set("n", "<leader>sp", ":sp<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Text, cursor
vim.keymap.set("n", "<leader>i", "mmgg=G`m")
vim.keymap.set("n", "<leader>f", ":EslintFixAll<cr>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>/", "/<C-R><C-W><cr>")

-- Move text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set('n', '<C-n>', ":NvimTreeToggle<CR>")
vim.keymap.set('n', '<leader>d', function()
  if (vim.diagnostic.is_disabled()) then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end)

-- Commands

vim.keymap.set({"n", "v"}, "<leader>l", ":Tmux yarn lint<CR>")
