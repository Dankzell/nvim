return {
  'sindrets/diffview.nvim',
  lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = {
    'DiffviewOpen',
    'DiffviewClose',
    'DiffviewToggleFiles',
    'DiffviewFocusFiles',
    'DiffviewFileHistory',
    'DiffviewRefresh',
  },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diffview open' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Diffview file history' },
    { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'Diffview branch history' },
    { '<leader>gx', '<cmd>DiffviewClose<cr>', desc = 'Diffview close' },
  },
  opts = {
    enhanced_diff_hl = true,

    view = {
      default = {
        layout = 'diff2_horizontal',
      },
      merge_tool = {
        layout = 'diff3_horizontal',
        disable_diagnostics = true,
      },
    },
  },
}
