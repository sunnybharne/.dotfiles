return {
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')

      -- Set highlight groups for better visibility
      vim.cmd [[
        highlight! CmpPmenu guibg=#1e1e1e guifg=#ff79c6
        highlight! CmpPmenuSel guibg=#ff79c6 guifg=#000000
        highlight! CmpPmenuBorder guibg=#1e1e1e guifg=#ff79c6
        highlight! CmpPmenuThumb guibg=#ff79c6 guifg=#1e1e1e
      ]]

      -- Setup nvim-cmp
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'copilot', group_index = 2 }, -- Copilot Source
          { name = 'nvim_lsp', group_index = 2 },
          { name = 'luasnip', group_index = 2 },
          { name = 'path', group_index = 2 },
        },
        {
          { name = 'buffer' },
        })
      })
    end
  },
  -- Add Copilot plugin dependencies if needed
  {
    'zbirenbaum/copilot.lua',
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
