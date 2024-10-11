return {

  "neovim/nvim-lspconfig",

  keys = {
    { "W", "<cmd>w<cr>", desc = "Write" },
  },

  opts = {
    inlay_hints = {
      enabled = false,
    },

    vim = {
      g = {
        autoformat = true,
      },
    },

    ---@type lspconfig.options
    servers = {
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectory = { mode = "auto" },
        },
      },

      cssls = {
        autostart = true,
      },

      tailwindcss = {
        -- exclude a filetype from the default_config
        filetypes_exclude = { "markdown" },
        -- add additional filetypes to the default_config
        filetypes_include = {},
        -- to fully override the default_config, change the below
        -- filetypes = {}
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

      pyright = {
        capabilities = {},
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
            },
          },

          pyright = {
            disableLanguageServices = false,
          },
        },
        autostart = true,
      },
    },

    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          -- Disable formatting for all clients:
          client.server_capabilities.documentFormattingProvider = false

          -- vim.api.nvim_echo({ { "Something else:!" .. client.name, "WarningMsg" } }, true, {})

          if client.name == "eslint" then
            -- Re-enable formatting for eslint:
            client.server_capabilities.documentFormattingProvider = true
            -- vim.api.nvim_echo({ { "ESLINT!!", "WarningMsg" } }, true, {})
          elseif client.name == "tsserver" then
            -- vim.api.nvim_echo({ { "TSSERVER!!", "WarningMsg" } }, true, {})
            client.server_capabilities.documentFormattingProvider = false
          end
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
