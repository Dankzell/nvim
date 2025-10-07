local function close_and_switch()
  local bufs = vim.fn.getbufinfo { buflisted = 1 }
  local current_buf = vim.api.nvim_get_current_buf()
  local win = vim.api.nvim_get_current_win()
  local idx = nil

  for i, buf in ipairs(bufs) do
    if buf.bufnr == current_buf then
      idx = i
      break
    end
  end

  local target_idx = idx and ((idx % #bufs) + 1) or 1
  local target_buf = bufs[target_idx].bufnr

  vim.api.nvim_win_set_buf(win, target_buf)
  vim.cmd('bd ' .. current_buf)
end

vim.keymap.set('n', '<leader>bd', close_and_switch, { desc = 'Close buffer and switch to next' })
