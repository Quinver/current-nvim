require("config.lazy")

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.number = true
vim.opt.relativenumber = true

require("vim-options")
