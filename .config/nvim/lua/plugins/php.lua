local util = require("lspconfig.util")

return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { path .. "/extension/out/phpDebug.js" },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "pint", "php_cs_fixer" },
      },
    },
  },
  {
    -- Remove phpcs linter.
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = {},
      },
    },
  },
  {
    -- Add neotest-pest plugin for running PHP tests.
    -- A package is also available for PHPUnit if needed.
    "nvim-neotest/neotest",
    dependencies = { "V13Axel/neotest-pest" },
    opts = { adapters = { "neotest-pest" } },
  },
  -- Add a Treesitter parser for Laravel Blade to provide Blade syntax highlighting.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "blade",
        "php_only",
      })
    end,
    config = function(_, opts)
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end,
  },
  {
    -- Add the blade-nav.nvim plugin which provides Goto File capabilities
    -- for Blade files.
    "ricardoramirezr/blade-nav.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    ft = { "blade", "php" },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     --
  --   },
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function()
  --     local ret = {
  --       setup = {
  --         phpactor = {
  --           cmd = { "phpactor", "language-server", "-vvv" },
  --           filetypes = { "php" },
  --           root_dir = function(pattern)
  --             local cwd = vim.loop.cwd()
  --             local root = util.root_pattern("composer.json", ".git", ".phpactor.json", ".phpactor.yml")(pattern)
  --
  --             -- prefer cwd if root is a descendant
  --             return util.path.is_descendant(cwd, root) and cwd or root
  --           end,
  --         },
  --       },
  --     }
  --     return ret
  --   end,
  -- },
  --   {
  --     default_config = {
  --       cmd = { "phpactor", "language-server", "-vvv" },
  --       filetypes = { "php" },
  --       root_dir = function(pattern)
  --         local cwd = vim.loop.cwd()
  --         local root = util.root_pattern("composer.json", ".git", ".phpactor.json", ".phpactor.yml")(pattern)
  --
  --         -- prefer cwd if root is a descendant
  --         return util.path.is_descendant(cwd, root) and cwd or root
  --       end,
  --     },
  --     docs = {
  --       description = [[
  -- https://github.com/phpactor/phpactor
  --
  -- Installation: https://phpactor.readthedocs.io/en/master/usage/standalone.html#global-installation
  -- ]],
  --       default_config = {
  --         cmd = { "phpactor", "language-server" },
  --         root_dir = [[root_pattern("composer.json", ".git")]],
  --       },
  --     },
  --   },
}
