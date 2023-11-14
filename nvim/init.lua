-- Requirements:
--   - install NeoVim (duh)
--   - install Packer: https://github.com/wbthomason/packer.nvim
--   - install tsserver, eslint, solargraph language servers
--       see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--   - install ripgrep

require("core")

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Globally disable LSP diagnostic text. Enable/disable command is in remap.lua
vim.diagnostic.disable()
