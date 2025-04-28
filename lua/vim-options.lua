vim.cmd("set expandtab")
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")
vim.g.mapleader = " "

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

vim.diagnostic.config({
  virtual_text = {
    prefix = "■",  -- You can change the symbol used for errors
    spacing = 4,
  },
  signs = true,  -- Show signs in the sign column
  underline = true,  -- Underline the errors
  update_in_insert = false,  -- Update diagnostics only in normal mode
})
