vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>re', '<cmd>restart<cr>')
vim.keymap.set('n', '<Esc>', ':nohl<CR>', { desc = "Clear search highlighting", silent = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set('v', '<', '<gv', { desc = "Unindent and keep selection" })
vim.keymap.set('v', '>', '>gv', { desc = "Indent and keep selection" })

vim.keymap.set('n', '<leader>u', function()
  vim.cmd.packadd('nvim.undotree')
  require('undotree').open()
end)
