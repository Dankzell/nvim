return {
  {
    'p00f/clangd_extensions.nvim',
    ft = { 'c', 'cpp', 'objc', 'objcpp' },
    config = function()
      require('clangd_extensions').setup {
        inlay_hints = { inline = true },
      }
    end,
  },
}
