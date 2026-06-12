return {
  {
    'neovim/nvim-lspconfig',
    opts = function(_, opts)
      local lspconfig = require 'lspconfig'

      lspconfig.harper_ls.setup {
        filetypes = {
          'tex',
          'bib',
          'markdown',
          'text',
          'gitcommit',
        },

        settings = {
          ['harper-ls'] = {
            dialect = 'American',
            diagnosticSeverity = 'hint',

            linters = {
              SentenceCapitalization = false,
              SpellCheck = false,

              AnA = true,
              UnclosedQuotes = true,
              LongSentences = true,
              RepeatedWords = true,
              Spaces = true,
              CorrectNumberSuffix = true,
            },

            codeActions = {
              ForceStable = false,
            },

            isolateEnglish = false,
            maxFileLength = 120000,
          },
        },
      }
    end,
  },
}
