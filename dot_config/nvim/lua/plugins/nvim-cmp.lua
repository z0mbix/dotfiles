-- https://github.com/hrsh7th/nvim-cmp
return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      enabled = true,
      autocomplete = true,
      debug = false,
      min_length = 1,
      preselect = "enable",
      throttle_time = 80,
      source_timeout = 200,
      incomplete_delay = 400,
      max_abbr_width = 100,
      max_kind_width = 100,
      max_menu_width = 100,
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = {
        -- Shift+TAB to go to the Previous Suggested item
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        -- Tab to go to the next suggestion
        ["<Tab>"] = cmp.mapping.select_next_item(),
        -- CTRL+SHIFT+f to scroll backwards in description
        ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
        -- CTRL+F to scroll forwards in the description
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- CTRL+SPACE to bring up completion at current Cursor location
        ["<C-Space>"] = cmp.mapping.complete(),
        -- CTRL+e to exit suggestion and close it
        ["<C-e>"] = cmp.mapping.close(),
        -- CR (enter or return) to CONFIRM the currently selection suggestion
        -- We set the ConfirmBehavior to insert the Selected suggestion
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
      },

      source = {
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        path = true,
        spell = true,
        treesitter = true,
        ultisnips = true,
        vsnip = true,
      },

      sources = cmp.config.sources({
        { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
      }),
    })
  end,
}
