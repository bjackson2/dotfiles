return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = vim.tbl_extend("force", opts.formatters_by_ft or {}, {
      swift = { "swiftlint_fix", "swiftformat" },
      eruby = { "erb_lint" },
    })

    opts.formatters = vim.tbl_extend("force", opts.formatters or {}, {
      swiftlint_fix = {
        command = "swiftlint",
        args = { "lint", "--fix", "--quiet", "$FILENAME" },
        stdin = false,
      },
      swiftformat = {
        prepend_args = { "--config", ".swiftformat" },
      },
      erb_lint = {
        command = "bundle",
        args = { "exec", "erb_lint", "--autocorrect", "$FILENAME" },
        stdin = false,
        cwd = require("conform.util").root_file({ "Gemfile" }),
        require_cwd = true,
      },
    })
  end,
}
