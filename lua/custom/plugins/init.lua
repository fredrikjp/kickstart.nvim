-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- Spellcheck keymap
    vim.keymap.set('n', '<leader>dw', ':setlocal spell spelllang=nb,en<CR>', { desc = 'Spellcheck' }),
  },

  { -- Startify
    'mhinz/vim-startify',
  },

  { -- Ultisnips
    'SirVer/ultisnips',
    requires = { 'honza/vim-snippets' },
    config = function()
      vim.g.UltiSnipsExpandTrigger = '<tab>'
      vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
      vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
    end,
  },

  { -- Ranger file manager
    'jensjpedersen/ranger_nvim',
    opts = { fileopener = 'nvim', mapping = '<leader>f' },
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

  { -- Vimtex
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
    end,
  },

  { -- Symbols outline
    'simrat39/symbols-outline.nvim',
    opts = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = 'right',
      relative_width = true,
      width = 25,
      auto_close = false,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = 'Pmenu',
      autofold_depth = 1,
      auto_unfold_hover = false,
      fold_markers = { '', '' },
      wrap = false,
      keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { '<Esc>', 'q' },
        goto_location = '<Cr>',
        focus_location = 'o',
        hover_symbol = '<C-space>',
        toggle_preview = 'K',
        rename_symbol = 'r',
        code_actions = 'a',
        fold = 'h',
        unfold = 'l',
        fold_all = 'W',
        unfold_all = 'E',
        fold_reset = 'R',
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
        File = { icon = '', hl = '@text.uri' },
        Module = { icon = '', hl = '@namespace' },
        Namespace = { icon = '', hl = '@namespace' },
        Package = { icon = '', hl = '@namespace' },
        Class = { icon = '𝓒', hl = '@type' },
        Method = { icon = 'ƒ', hl = '@method' },
        Property = { icon = '', hl = '@method' },
        Field = { icon = '', hl = '@field' },
        Constructor = { icon = '', hl = '@constructor' },
        Enum = { icon = 'ℰ', hl = '@type' },
        Interface = { icon = 'ﰮ', hl = '@type' },
        Function = { icon = '', hl = '@function' },
        Variable = { icon = '', hl = '@constant' },
        Constant = { icon = '', hl = '@constant' },
        String = { icon = '𝓐', hl = '@string' },
        Number = { icon = '#', hl = '@number' },
        Boolean = { icon = '⊨', hl = '@boolean' },
        Array = { icon = '', hl = '@constant' },
        Object = { icon = '⦿', hl = '@type' },
        Key = { icon = '🔐', hl = '@type' },
        Null = { icon = 'NULL', hl = '@type' },
        EnumMember = { icon = '', hl = '@field' },
        Struct = { icon = '𝓢', hl = '@type' },
        Event = { icon = '🗲', hl = '@type' },
        Operator = { icon = '+', hl = '@operator' },
        TypeParameter = { icon = '𝙏', hl = '@parameter' },
        Component = { icon = '', hl = '@function' },
        Fragment = { icon = '', hl = '@constant' },
      },
    },
    config = function(_, opts)
      require('symbols-outline').setup(opts)
      vim.keymap.set('n', '<leader>ts', ':SymbolsOutline<CR>', { desc = 'Symbols Outline' })
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  --{ -- Vista view and search LSP symbols and tags
  --  'liuchengxu/vista.vim',
  --  config = function()
  --    vim.g.vista_default_executive = 'ctags'
  --    vim.g.vista_echo_cursor_strategy = 'floating_win'
  --    vim.g.vista_vimwiki_executive = 'markdown'
  --    vim.g.vista_sidebar_position = 'right'
  --    vim.g.vista_sidebar_width = 30
  --    vim.g.vista_disable_statusline = 1
  --    vim.g.vista_fzf_preview = { 'right:50%' }
  --    vim.g['vista#renderer#enable_icon'] = 1
  --    vim.g['vista#renderer#icons'] = {
  --      ['function'] = '\239\189\148',
  --      ['variable'] = '\239\189\155',
  --    }
  --    vim.g.vista_executive_for = {
  --      vimwiki = 'markdown',
  --      pandoc = 'markdown',
  --      markdown = 'toc',
  --      typescript = 'nvim_lsp',
  --      typescriptreact = 'nvim_lsp',
  --      javascript = 'nvim_lsp',
  --      javascriptreact = 'nvim_lsp',
  --      python = 'ctags',
  --      cpp = 'nvim_lsp',
  --      c = 'nvim_lsp',
  --    }
  --    vim.keymap.set('n', '<leader>tv', ':Vista!!<CR>', { desc = 'Vista' })
  --  end,
  --},
}
