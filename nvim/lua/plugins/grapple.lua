return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true }
  },
  opt = {
    scope = "git",
  },
  event = { "BufReadPost", "BufNewFile"},
  cmd = "Grapple",
  keys = {
    {"<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag"},
    {"<leader>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window"},
  }
}
