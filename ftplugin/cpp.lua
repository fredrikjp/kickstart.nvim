opts = { noremap = true, silent = true }

-- Run the current file
vim.keymap.set('n', '<leader>r', ':w <bar> !g++ -O2 % src/*.cpp -I include -o %:r -larmadillo <bar> ./%:r <CR>', opts)

--g++ -O2 filename.cpp src/*.cpp -I include -o filename -larmadillo
--C++ run: ./filename
