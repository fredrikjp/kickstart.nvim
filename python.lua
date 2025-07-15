local opts = { noremap = true, silent = true }

-- Run the current file
vim.keymap.set('n', '<leader>r', ':w <bar> !python3 % <CR>', opts)

-- Run help function
vim.keymap.set("n", "hw", function()
  local word = vim.fn.expand("<cword>")
  local linenr = vim.fn.line(".") -- current line number

  -- Insert `help(word)` and `break` below current line
  vim.api.nvim_buf_set_lines(0, linenr, linenr, false, {
    "help(" .. word .. ")",
    "breakpoint()"
  })

  -- Save the file
  vim.cmd("write")

end, { noremap = true, silent = true })
