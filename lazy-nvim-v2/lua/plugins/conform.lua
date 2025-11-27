return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      swift = { "swiftlint_fix", "swiftformat" },
    },
    formatters = {
      swiftlint_fix = {
        command = "swiftlint",
        args = { "lint", "--fix", "--quiet", "$FILENAME" },
        stdin = false,
      },
      swiftformat = {
        prepend_args = { "--config", ".swiftformat" },
      },
    },
  },
}
