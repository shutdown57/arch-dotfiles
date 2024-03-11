return {
  { "pmizio/typescript-tools.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
        biome = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
        -- NOTE: typescript-tools.nvim will not spawn a tsserver client, it will spawn typescript-tools client
        ["typescript-tools"] = function(_, opts)
          require("typescript-tools").setup(opts)
          return true
        end,
      },
      config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.offsetEncoding = { "utf-16" }
        require("lspconfig").clangd.setup({ capabilities = capabilities })
        require("lspconfig").biome.setup({ capabilities = capabilities })
      end,
      servers = {
        tsserver = {
          filetypes = {
            "javascript",
            "javascript.jsx",
            "javascriptreact",
            "json",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
            "vue",
          },
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.expand("$HOME/.node_modules/lib/node_modules/@vue/typescript-plugin"),
                languages = { "javascript", "typescript", "vue" },
              },
            },
          },
        },
        ["typescript-tools"] = {
          filetypes = {
            "javascript",
            "javascript.jsx",
            "javascriptreact",
            "json",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
            "vue",
          },
          mason = false,
        },
      },
      eslint = {
        settings = {
          run = "onSave",
        },
      },
    },
  },
}
