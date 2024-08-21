local opts = { noremap = true, silent = true }

-- Run the current file
vim.keymap.set('n', '<leader>r', ':w <bar> !python3 % <CR>', opts)
