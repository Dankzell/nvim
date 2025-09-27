return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    init = function()
      -- Map VSCode-style Ctrl+D to add next occurrence
      vim.g.VM_maps = {
        ['Find Under'] = '<C-d>',
        ['Find Subword Under'] = '<C-d>',
        ['Skip Region'] = '<C-x>', -- skip current and jump to next
        ['Remove Region'] = '<C-z>', -- remove current cursor
      }
      -- Optional: enable mouse range selections
      vim.g.VM_mouse_mappings = 1
    end,
  },
}
