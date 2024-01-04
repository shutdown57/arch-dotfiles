return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
        tsserver = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
        biome = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
      config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.offsetEncoding = { "utf-16" }
        require("lspconfig").clangd.setup({ capabilities = capabilities })
        require("lspconfig").biome.setup({ capabilities = capabilities })
        require("lspconfig").tsserver.setup({ capabilities = capabilities })
      end,
    },
  },
}
