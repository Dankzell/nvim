return {
  'HiPhish/rainbow-delimiters.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    local colors = require('catppuccin.palettes').get_palette 'frappe'

    vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg = colors.red })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = colors.yellow })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = colors.blue })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = colors.peach })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg = colors.green })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = colors.mauve })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { fg = colors.teal })

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
