return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- use latest release, remove to use latest commit
  ft = { 'markdown' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    { '<leader>on', '<cmd>Obsidian new<cr>', desc = '[O]bsidian [N]ew note' },
    { '<leader>oo', '<cmd>Obsidian quick_switch<cr>', desc = '[O]bsidian [O]pen/switch note' },
    { '<leader>os', '<cmd>Obsidian search<cr>', desc = '[O]bsidian [S]earch' },
    { '<leader>or', '<cmd>Obsidian rename<cr>', desc = '[O]bsidian [R]ename note' },
    { '<leader>ot', '<cmd>Obsidian template<cr>', desc = '[O]bsidian insert [T]emplate' },
    { '<leader>od', '<cmd>Obsidian today<cr>', desc = "[O]bsidian [D]aily note" },
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = 'personal',
        path = '/mnt/c/Users/gusta/OneDrive/Documents/Gustavs Vault',
      },
    },
    picker = {
      -- name = "snacks.picker", -- use snacks picker
      name = 'telescope.nvim', -- or telescope
      -- name = "fzf-lua",     -- or fzf-lua
      -- name = "mini.pick",   -- or mini.pick
    },
    sync = {
      enabled = true,
    },
    callbacks = {
      enter_note = function(note)
        local actions = require 'obsidian.actions'
        vim.keymap.set('n', '<leader>;', actions.add_property, { buffer = true, desc = 'Add frontmatter property' })
        vim.keymap.set('n', '<Tab>', function()
          actions.nav_link 'next'
        end, { buffer = true, desc = 'Go to next link' })
        vim.keymap.set('n', '<S-Tab>', function()
          actions.nav_link 'prev'
        end, { buffer = true, desc = 'Go to previous link' })
      end,
    },
  },
}
