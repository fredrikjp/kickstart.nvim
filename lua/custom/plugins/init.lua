-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  { -- Ranger file manager
    'jensjpedersen/ranger_nvim',
    opts = { fileopener = 'rifle', mapping = '<leader>f' },
    config = function(_, opts)
      require('ranger_nvim').setup(opts)
    end,
  },

  { -- GitHub Copilot
    'github/copilot.vim',
    config = function()
      vim.keymap.set('i', '<C-a>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.keymap.set('i', '<C-w>', '<Plug>(copilot-accept-word)')
      vim.keymap.set('i', '<C-l', '<Plug>(copilot-next)')
      vim.keymap.set('i', '<C-h>', '<Plug>(copilot-prev)')

      vim.g.copilot_no_tab_map = true
    end,
  },

  { -- Mini Nvim
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.misc').setup()
      MiniMisc.setup_auto_root()
    end,
  },
}
