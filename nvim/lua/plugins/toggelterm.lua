return {
  'akinsho/toggleterm.nvim',
  config = function()
    require("toggleterm").setup{
      size = 20,
      open_mapping = [[<leader>tt]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '1',
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 3,
        highlights = {
          border = "Normal",
          background = "Normal",
        }
      },
      on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<Esc>', [[<C-\><C-n>]], {noremap = true, silent = true})
      end,
    }
  end
}
