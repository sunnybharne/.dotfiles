return {
  {
    'hrsh7th/cmp-buffer'  -- Buffer completion source for nvim-cmp
  },
  {
    'hrsh7th/cmp-path'  -- Path completion source for nvim-cmp
  },
  {
    'hrsh7th/cmp-cmdline'  -- Command line completion source for nvim-cmp
  },
  {
    'hrsh7th/cmp-nvim-lsp'  -- LSP completion source for nvim-cmp
  },
  {
    'saadparwaiz1/cmp_luasnip'  -- Snippet completion source for nvim-cmp
  },
  {
    'rafamadriz/friendly-snippets'  -- A collection of snippets for various languages
  },
  {
    'L3MON4D3/LuaSnip',  -- Snippet engine for Neovim written in Lua
    version = "v2.*",  -- Specify the version to use
    build = "make install_jsregexp",  -- Build command to install jsregexp
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet  -- Define snippet
      local t = ls.text_node  -- Define text node
      local i = ls.insert_node  -- Define insert node

      -- Keymaps for snippet expansion and navigation
      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})

      -- Load snippets from specified paths
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/snippets" } })
      require('luasnip.loaders.from_lua').load({paths = "~/.config/nvim/lua/snippets"})
    end
  }
}
