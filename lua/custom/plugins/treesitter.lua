-- NOTE: nvim-treesitter's `main` branch (the full rewrite) requires Neovim
-- 0.12+ (nightly) -- see https://github.com/nvim-treesitter/nvim-treesitter.
-- We're on stable Neovim 0.11, so we pin to the `master` branch instead,
-- which the upstream README keeps around specifically for 0.11 compatibility.
return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.install').ts_generate_args = { 'generate', '--abi', tostring(vim.treesitter.language_version) }
      require('nvim-treesitter.configs').setup {
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
