return {
  "sunnybharne/nvim-gh-actions-snippets",
  config = function()
    require("github_actions_snippets").setup()
  end,
  dependencies = { "L3MON4D3/LuaSnip" },
}
