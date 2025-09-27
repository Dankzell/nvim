-- lua/custom/plugins/material-icons.lua
return {
  { 'DaikyXendo/nvim-material-icon' }, -- loads the material mappings
  {
    'nvim-tree/nvim-web-devicons', -- still configure via web-devicons API
    opts = {
      override = {
        zsh = { icon = '', color = '#428850', cterm_color = '65', name = 'Zsh' },
      },
      color_icons = true,
      default = true,
    },
  },
}
