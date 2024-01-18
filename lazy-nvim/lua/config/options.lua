-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.cursorcolumn = true
vim.opt.wrap = true
vim.opt.undofile = false

vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  callback = function(args)
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = true
  end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  pattern = "*",
  callback = function(args)
    vim.opt.cursorline = false
    vim.opt.cursorcolumn = false
  end,
})

vim.g["test#strategy"] = "tslime"
vim.g.tslime_always_current_session = 1
vim.g.tslime_always_current_window = 1
