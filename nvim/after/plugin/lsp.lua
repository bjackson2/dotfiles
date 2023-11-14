local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
  })
})

require'lspconfig'.tsserver.setup{}
require'lspconfig'.eslint.setup({})
require'lspconfig'.solargraph.setup{}

