return {
  "mfussenegger/nvim-lint",
  config = function ()
    require("lint").linters.bicep_linter_name = {
      cmd = 'az bicep build --stdout --file $FILENAME',
      stdin = true,
      append_fname = true,
      args = { 'check', '--file', '$FILENAME' },
      stream = nil,
      ignore_exitcode = false,
      env = nil,
    }
  end
}
