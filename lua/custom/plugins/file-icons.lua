-- lua/custom/plugins/fileIcons.lua
return {
  {
    'nvim-tree/nvim-web-devicons',
    opts = {
      override_by_extension = {
        zsh = { icon = '', color = '#428850', cterm_color = '65', name = 'Zsh' },
      },
      color_icons = true,
      default = true,
    },
  },
}
