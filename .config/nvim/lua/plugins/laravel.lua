return {
  "adalessa/laravel.nvim",
  dependencies = {
    "tpope/vim-dotenv",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "kevinhwang91/promise-async",
  },
  cmd = { "Laravel" },
  keys = {
    { "<leader>la", ":Laravel artisan<cr>" },
    { "<leader>lr", ":Laravel routes<cr>" },
    { "<leader>lm", ":Laravel related<cr>" },
  },
  event = { "VeryLazy" },
  opts = {},
  config = true,
  -- "adalessa/laravel.nvim",
  -- dependencies = {
  --   "nvim-telescope/telescope.nvim",
  --   "tpope/vim-dotenv",
  --   "MunifTanjim/nui.nvim",
  --   "nvimtools/none-ls.nvim",
  -- },
  -- cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  -- keys = {
  --   { "<leader>la", ":Laravel artisan<cr>" },
  --   { "<leader>lr", ":Laravel routes<cr>" },
  --   { "<leader>lm", ":Laravel related<cr>" },
  --   {
  --     "<leader>lt",
  --     function()
  --       require("laravel.tinker").send_to_tinker()
  --     end,
  --     mode = "v",
  --     desc = "Laravel Application Routes",
  --   },
  -- },
  -- event = { "VeryLazy" },
  -- config = function()
  --   require("laravel").setup()
  --   require("telescope").load_extension("laravel")
  -- end,
  -- opts = {
  --   lsp_server = "phpactor",
  --   features = { null_ls = { enable = false } },
  -- },
}
