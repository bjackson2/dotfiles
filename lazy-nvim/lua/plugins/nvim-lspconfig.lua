return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          mason = false,
          cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
          init_options = {
            formatter = "standard",
            linters = { "standard" },
          },
        },
      },
    },
  },
}
