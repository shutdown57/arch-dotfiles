-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Blade template syntax highlighting
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})

-- Turn off auto comment on new line
-- vim.api.nvim_create_autocmd("FileType", {
--   command = "set formatoptions-=co",
-- })
