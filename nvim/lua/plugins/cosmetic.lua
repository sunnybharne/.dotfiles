return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({})
    end
  },
}
