return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      if vim.fn.has 'win32' == 1 then
        local bash = vim.fn.exepath 'bash'
        vim.o.shell = '"' .. bash .. '"'
        vim.o.shellcmdflag = '-c'
        vim.o.shellxquote = ''
      end

      require('toggleterm').setup {
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return math.floor(vim.o.columns * 0.4)
          end
          return 20
        end,

        open_mapping = [[<C-t>]],
        hide_numbers = false,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = -25,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = 'float',
        close_on_exit = false,
        shell = vim.fn.has 'win32' == 1 and ('"' .. vim.fn.exepath 'bash' .. '"') or 'zsh',
        auto_scroll = true,

        float_opts = {
          border = 'curved',
          winblend = 0,
        },

        on_open = function(term)
          -- Easier to leave terminal mode and move around
          vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { buffer = term.bufnr, silent = true })
          vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { buffer = term.bufnr, silent = true })

          -- Window navigation from terminal mode
          vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { buffer = term.bufnr, silent = true })
          vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { buffer = term.bufnr, silent = true })
          vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { buffer = term.bufnr, silent = true })
          vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { buffer = term.bufnr, silent = true })
        end,
      }

      local Terminal = require('toggleterm.terminal').Terminal

      local float_term = Terminal:new {
        direction = 'float',
        hidden = true,
      }

      local horiz_term = Terminal:new {
        direction = 'horizontal',
        hidden = true,
      }

      local vert_term = Terminal:new {
        direction = 'vertical',
        hidden = true,
      }

      local lazygit = Terminal:new {
        cmd = 'lazygit',
        direction = 'float',
        hidden = true,
      }

      -- Terminal toggles
      vim.keymap.set('n', '<leader>tf', function()
        float_term:toggle()
      end, { desc = 'Terminal float' })

      vim.keymap.set('n', '<leader>th', function()
        horiz_term:toggle()
      end, { desc = 'Terminal horizontal' })

      vim.keymap.set('n', '<leader>tv', function()
        vert_term:toggle()
      end, { desc = 'Terminal vertical' })

      vim.keymap.set('n', '<leader>gp', function()
        lazygit:toggle()
      end, { desc = 'Open lazygit' })

      -- Run current Python file
      vim.keymap.set('n', '<leader>rr', function()
        local file = vim.fn.expand '%:p'
        local cmd = 'python "' .. file .. '"'
        float_term:toggle()
        float_term:send(cmd, true)
      end, { desc = 'Run current Python file' })

      -- Send current line
      vim.keymap.set('n', '<leader>rl', function()
        require('toggleterm').send_lines_to_terminal('single_line', false, { args = vim.v.count })
      end, { desc = 'Send current line to terminal' })

      -- Send visual selection
      vim.keymap.set('v', '<leader>rs', function()
        require('toggleterm').send_lines_to_terminal('visual_selection', false, { args = vim.v.count })
      end, { desc = 'Send selection to terminal' })
    end,
  },
}
