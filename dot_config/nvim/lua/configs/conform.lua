local options = {
  formatters_by_ft = {
    go = { "gofmt" },
    lua = { "stylua" },
    rust = { "rustfmt" },
    sh = { "shfmt" },
    toml = { "taplo" },
  },

  formatters = {
    shfmt = {
      prepend_args = { "-i", "2", "-ci", "-bn", "-ln", "bash" },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
