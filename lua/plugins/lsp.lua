return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },

    vim = {
      g = {
        autoformat = true,
      },
    },

    servers = {
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectory = { mode = "auto" },
        },
      },

      tsserver = {
        settings = {
          autoformat = false,
          typescript = {
            tsserver = {
              pluginPaths = {},
            },
          },
        },
      },
    },

    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          -- Disable formatting for all clients:
          client.server_capabilities.documentFormattingProvider = false

          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end

          -- Disable default diagnostic so tiny-inline can take over:
          vim.diagnostic.config({ virtual_text = false })
        end)

        vim.api.nvim_create_autocmd("BufWritePre", {
          callback = function(event)
            if require("lspconfig.util").get_active_client_by_name(event.buf, "eslint") then
              vim.cmd("EslintFixAll")
            end
          end,
        })
      end,
    },
  },
}
