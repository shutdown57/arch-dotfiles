return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- setup = {
      --   tsserver = function(_, opts)
      --     opts.capabilities.offsetEncoding = { "utf-16" }
      --   end,
      --   biome = function(_, opts)
      --     opts.capabilities.offsetEncoding = { "utf-16" }
      --   end,
      -- },
      config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.offsetEncoding = { "utf-16" }
        require("lspconfig").clangd.setup({ capabilities = capabilities })
        require("lspconfig").tsserver.setup({ capabilities = capabilities })
      end,
    },
  },
}
