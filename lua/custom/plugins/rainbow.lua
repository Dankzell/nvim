return {
  'HiPhish/rainbow-delimiters.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = 'rainbow-delimiters.strategy.global',
        lua = 'rainbow-delimiters.strategy.local',
      },
      query = {
        [''] = 'rainbow-delimiters',
        html = 'rainbow-tags',
      },
      priority = {
        [''] = 110,
        html = 210,
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
    require('rainbow-delimiters.setup').setup()
  end,
}
