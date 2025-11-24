return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },

    opts = {
      -- Tell Mason NOT to manage the sourcekit server
      servers = {
        sourcekit = {
          mason = false, -- ← Important for Mason setups
          cmd = { "xcrun", "sourcekit-lsp" },
          filetypes = { "swift", "objective-c", "objective-cpp" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("buildServer.json", "Package.swift", ".git")(fname)
          end,
        },
      },
    },
  },
}
