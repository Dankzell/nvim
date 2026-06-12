return {
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_view_sioyek_exe = 'zathura'
      -- vim.g.vimtex_callback_progpath = 'wsl nvim'

      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_mappings_enabled = 1
      vim.g.vimtex_indent_enabled = 1

      -- Optional, but nice for large thesis files
      vim.g.vimtex_toc_config = {
        split_width = 35,
        show_help = 0,
      }
    end,
  },
}
