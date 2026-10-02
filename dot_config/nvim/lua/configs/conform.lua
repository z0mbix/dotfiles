local options = {
  formatters_by_ft = {
    cue = { "cue_fmt" },
    fish = { "fish_indent" },
    go = { "gofmt" },
    hcl = { "terragrunt_hclfmt" },
    lua = { "stylua" },
    rust = { "rustfmt" },
    sh = { "shfmt" },
    toml = { "taplo" },
  },

  formatters = {
    shfmt = {
      prepend_args = { "-i", "2", "-ci", "-bn", "-ln", "bash" },
    },
    terragrunt_hclfmt = {
      condition = function(_, ctx)
        return vim.fs.root(ctx.dirname, { "terragrunt.hcl", "root.hcl" }) ~= nil
      end,
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_format = "fallback",
  },
}

return options
