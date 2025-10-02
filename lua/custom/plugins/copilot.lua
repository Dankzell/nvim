return {
  {
    'github/copilot.vim',
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = true }, -- no inline ghost text
        panel = { enabled = true },
        filetypes = { ['*'] = true },
      }
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    dependencies = {
      'zbirenbaum/copilot.lua',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = function()
      require('CopilotChat').setup {
        -- defaults open a split; uncomment one of these if you prefer:
        window = { layout = 'vertical', position = 'right', width = 0.25 },
        auto_insert_mode = true,
        -- window = { layout = "float", border = "rounded", height = 0.9, width = 0.5 },
      }
      local chat = require 'CopilotChat'
      chat.setup {}

      vim.keymap.set('n', '<leader>cc', chat.toggle, { desc = 'Open Copilot Chat' })
    end,
  },
}
