-- return {
--   "rest-nvim/rest.nvim",
--   dependencies = { { "nvim-lua/plenary.nvim" } },
--   config = function()
--     require("rest-nvim").setup({
--       --- Get the same options from Packer setup
--     })
--   end,
-- }

return {
  "vhyrro/luarocks.nvim",
  config = function()
    require("luarocks").setup({})
  end,
},
{
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = { "luarocks.nvim" },
  config = function()
    require("rest-nvim").setup()
  end,
}
