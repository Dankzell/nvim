-- return {
--   {
--     'nvim-treesitter/nvim-treesitter',
--     build = ':TSUpdate',
--     config = function()
--       require('nvim-treesitter').setup {}
--
--       require('nvim-treesitter').install {
--         'bash',
--         'c',
--         'dockerfile',
--         'yaml',
--         'cpp',
--         'css',
--         'diff',
--         'html',
--         'lua',
--         'luadoc',
--         'markdown',
--         'markdown_inline',
--         'javascript',
--         'typescript',
--         'query',
--         'vim',
--         'vimdoc',
--         'python',
--         'arduino',
--         'cmake',
--       }
--
--       -- Enable treesitter highlighting for all filetypes
--       vim.api.nvim_create_autocmd('FileType', {
--         callback = function(args)
--           pcall(vim.treesitter.start, args.buf)
--         end,
--       })
--     end,
--   },
--   {
--     'nvim-treesitter/nvim-treesitter-context',
--     opts = {},
--   },
-- }
return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup {
        ensure_installed = {
          'bash',
          'c',
          'dockerfile',
          'yaml',
          'cpp',
          'css',
          'diff',
          'html',
          'lua',
          'luadoc',
          'markdown',
          'markdown_inline',
          'javascript',
          'typescript',
          'query',
          'vim',
          'vimdoc',
          'python',
          'arduino',
          'cmake',
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {},
  },
}
