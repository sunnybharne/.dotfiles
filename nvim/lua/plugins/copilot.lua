return {
  "github/copilot.vim",
  constructor = function()
    require("copilot").setup({
      suggestion = { enabled = true },
      panel = { enabled = true }, -- For the chat interface
    })
  end,
  "zbirenbaum/copilot-cmp",
  config = function ()
    require("copilot_cmp").setup()
  end
}
