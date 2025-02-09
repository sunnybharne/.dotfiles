return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = {
        enable = true,
        disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
        additional_vim_regex_highlighting = {'org'},
      },
      ensure_installed = {'org'},
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    })
  end,
}
