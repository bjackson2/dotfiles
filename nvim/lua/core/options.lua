vim.opt.autowrite = true
vim.opt.backup = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.encoding = "utf8"
vim.opt.expandtab = true
vim.opt.history = 500
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { trail = '·', tab = '»·' }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 2
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.writebackup = false

vim.api.nvim_create_autocmd('WinEnter', {
  pattern = '*',
  callback = function(args)
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = true
  end,
})
vim.api.nvim_create_autocmd('WinLeave', {
  pattern = '*',
  callback = function(args)
    vim.opt.cursorline = false
    vim.opt.cursorcolumn = false
  end,
})
