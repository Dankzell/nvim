-- Custom TypeScript setup with typescript-tools, Prettier, ESLint, etc.
return {
  {
    -- Modern TS/JS LSP replacement for tsserver
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    config = function()
      local tt = require 'typescript-tools'

      tt.setup {
        settings = {
          separate_diagnostic_server = true,
          publish_diagnostic_on = 'insert_leave',

          -- Disable tsserver formatting → handled by prettier/conform
          tsserver_format_options = {},
          tsserver_file_preferences = {
            includeInlayParameterNameHints = 'all',
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },

          complete_function_calls = true,
          code_lens = 'off',
          jsx_close_tag = { enable = false, filetypes = { 'typescriptreact', 'javascriptreact' } },
        },

        on_attach = function(client, bufnr)
          -- disable formatting (use Prettier via Conform)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false

          local map = function(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = 'TS: ' .. desc })
          end

          -- Typescript tools shortcuts
          map('<leader>to', ':TSToolsOrganizeImports<CR>', 'Organize Imports')
          map('<leader>ti', ':TSToolsAddMissingImports<CR>', 'Add Missing Imports')
          map('<leader>tu', ':TSToolsRemoveUnused<CR>', 'Remove Unused')
          map('<leader>tf', ':TSToolsFixAll<CR>', 'Fix All')
          map('<leader>tr', ':TSToolsRenameFile<CR>', 'Rename File + Imports')
        end,
      }
    end,
  },

  -- Auto-tag and color preview helpers (recommended for webdev)
  { 'windwp/nvim-ts-autotag', event = 'InsertEnter', opts = {} },
  { 'NvChad/nvim-colorizer.lua', event = 'BufReadPre', opts = { user_default_options = { names = false } } },
}
