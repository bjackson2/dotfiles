return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash-language-server",
        "css-lsp",
        "eslint_d",
        "ruby-lsp",
        "typescript-language-server",
      })
    end,
  },
}
