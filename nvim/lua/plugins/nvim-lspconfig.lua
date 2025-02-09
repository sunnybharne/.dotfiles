return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    --lsp for python
    lspconfig.pyright.setup{
      capabilities = capabilities,
    }

    -- lsp for lua
    lspconfig.lua_ls.setup{}

    --lsp for bicep
    local bicep_lsp_bin = "/usr/local/bin/bicep-langserver/Bicep.LangServer.dll"

    vim.cmd [[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]]

    lspconfig.bicep.setup{
      cmd = { "dotnet", bicep_lsp_bin },
    }

    -- lsp for azurepipeline
    lspconfig.azure_pipelines_ls.setup {
      cmd = { "azure-pipelines-language-server", "--stdio" },
      capabilities = capabilities,
      filetypes = { "yaml" },
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end,
      settings = {
        yaml = {
          schemas = {
            ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
              "/azure-pipeline*.y*l",
              "/*.azure*",
              "Azure-Pipelines/**/*.y*l",
              "Pipelines/*.y*l",
            },
          },
        },
      },
    }

    -- lsp for json
    local jsonCapabilities = vim.lsp.protocol.make_client_capabilities()
    jsonCapabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.jsonls.setup {
      capabilities = jsonCapabilities,
    }

    -- lsp for bash
    lspconfig.bashls.setup{}


    -- lsp for powershell 
    lspconfig.powershell_es.setup{
      bundle_path = '/usr/local/bin/PowerShell/PowerShellEditorServices',
    }
  end,
}
