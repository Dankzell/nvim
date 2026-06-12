return {
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_compiler_latexmk = {
        options = {
          '-xelatex',
          '-shell-escape',
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
        },
      }
      vim.g.vimtex_compiler_latexmk_engines = {
        _ = '-xelatex',
        pdflatex = '-pdf',
        lualatex = '-lualatex',
        xelatex = '-xelatex',
      }
      vim.g.vimtex_view_method = 'sioyek'
      vim.g.vimtex_view_sioyek_exe = 'sioyek'
      vim.g.vimtex_callback_progpath = 'wsl.exe -e ' .. vim.env.HOME .. '/.local/bin/vimtex-inverse-search'

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
