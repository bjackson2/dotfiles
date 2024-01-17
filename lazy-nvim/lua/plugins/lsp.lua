return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash-language-server",
        "css-lsp",
        "eslint_d",
        "solargraph",
        "typescript-language-server",
      })
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       eslint = {
  --         on_attach = function(_client, bufnr)
  --           vim.api.nvim_create_autocmd("BufWritePre", {
  --             buffer = bufnr,
  --             command = "EslintFixAll",
  --           })
  --         end,
  --       },
  --     },
  --   },
  -- },
}
