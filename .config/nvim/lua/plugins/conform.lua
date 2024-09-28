-- local util = require("conform.util")
return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  init = function()
    -- Install the conform formatter on VeryLazy
    LazyVim.on_very_lazy(function()
      LazyVim.format.register({
        name = "conform.nvim",
        priority = 100,
        primary = true,
        format = function(buf)
          require("conform").format({ bufnr = buf })
        end,
        sources = function(buf)
          local ret = require("conform").list_formatters(buf)
          ---@param v conform.FormatterInfo
          return vim.tbl_map(function(v)
            return v.name
          end, ret)
        end,
      })
    end)
  end,
  -- opts = function()
  --   ---@type conform.setupOpts
  --   local opts = {
  --     -- LazyVim will use these options when formatting with the conform.nvim formatter
  --     default_format_opts = {
  --       timeout_ms = 3000,
  --       async = false, -- not recommended to change
  --       quiet = false, -- not recommended to change
  --       lsp_format = "fallback", -- not recommended to change
  --     },
  --     formatters_by_ft = {
  --       lua = { "stylua" },
  --       fish = { "fish_indent" },
  --       sh = { "shfmt" },
  --       -- php = { "php_cs_fixer", "phpcbf", "pint" },
  --       -- php = { "pint" },
  --       blade = { "blade-formatter", "rustywind" },
  --       vue = { "prettierd", "rustywind" },
  --       json = { "jq" },
  --       typescript = { "prettierd" },
  --       html = { "prettierd" },
  --       -- go = { "gofumpt" },
  --     },
  --   }
  --   return opts
  -- end,

  opts = {
    -- LazyVim will use these options when formatting with the conform.nvim formatter
    default_format_opts = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
      lsp_format = "fallback", -- not recommended to change
    },
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      -- php = { "php_cs_fixer", "phpcbf", "pint" },
      -- php = { "pint" },
      blade = { "blade-formatter", "rustywind" },
      vue = { "prettierd", "rustywind" },
      json = { "jq" },
      typescript = { "prettierd" },
      html = { "prettierd" },
      -- go = { "gofumpt" },
    },
  },
}
