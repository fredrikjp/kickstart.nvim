local opts = { noremap = true, silent = true }

-- VimtexTocOpen command to open the table of contents
vim.keymap.set('n', '<leader>tt', ':VimtexTocOpen <CR>', { desc = 'Table of contents' })

-- VimtexCompile and then VimtexView command to compile and view the pdf
vim.keymap.set('n', '<leader>r', ':w <bar> VimtexCompile <CR>', opts)
