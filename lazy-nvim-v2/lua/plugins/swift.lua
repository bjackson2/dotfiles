-- Swift filetype settings: 2-space indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "swift" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

return {
  -- Add Swift parser to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "swift" })
    end,
  },

  -- Configure sourcekit-lsp for Swift
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          mason = false,
          cmd = { "xcrun", "sourcekit-lsp" },
          filetypes = { "swift", "objective-c", "objective-cpp" },
          -- Resolve root from the buffer's path so each git worktree gets its
          -- own LSP client. Deliberately avoid `.git` as a marker: in worktrees
          -- it's a gitlink file pointing back to the base worktree, which can
          -- pull root_dir out of the current worktree and merge multiple
          -- worktrees onto a single sourcekit-lsp instance.
          root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(bufnr)
            local marker = vim.fs.find(
              { "buildServer.json", "Package.swift" },
              { path = fname, upward = true }
            )[1]
            on_dir(marker and vim.fs.dirname(marker) or vim.fs.dirname(fname))
          end,
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = true,
              },
            },
          },
        },
      },
    },
  },
}
