return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    }

    -- Keymaps
    local list = function()
      return harpoon:list()
    end
    vim.keymap.set('n', '<leader>ha', function()
      list():add()
    end, { desc = 'Harpoon add file' })
    vim.keymap.set('n', '<leader>hh', function()
      harpoon.ui:toggle_quick_menu(list())
    end, { desc = 'Harpoon menu' })
    vim.keymap.set('n', '<leader>1', function()
      list():select(1)
    end)
    vim.keymap.set('n', '<leader>2', function()
      list():select(2)
    end)
    vim.keymap.set('n', '<leader>3', function()
      list():select(3)
    end)
    vim.keymap.set('n', '<leader>4', function()
      list():select(4)
    end)
    vim.keymap.set('n', '<leader>5', function()
      list():select(5)
    end)

    -- Telescope picker for Harpoon marks
    vim.keymap.set('n', '<leader>hb', function()
      require('telescope').extensions.harpoon.marks()
    end, { desc = 'Telescope Harpoon marks' })
  end,
}
