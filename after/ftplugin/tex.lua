vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.spell = true
vim.opt_local.spelllang = 'en_us'

vim.keymap.set('n', '<leader>ts', '<cmd>TeXpressoSync<CR>', {
  buffer = true,
  silent = true,
  desc = 'TeXpresso sync',
})

vim.keymap.set('n', '<leader>tt', '<cmd>TeXpresso %<CR>', {
  buffer = true,
  silent = true,
  desc = 'Start TeXpresso',
})

local tex_snips = [[
LaTeX snippets

Math:
  mk      -> $...$
  dm      -> \[...\]
  eq      -> equation
  eql     -> labeled equation
  al      -> align

Figures/tables:
  fig     -> figure
  subfig  -> two subfigures
  tab     -> table
  btab    -> booktabs table

References:
  cite    -> \cite{}
  ref     -> \cref{}
  eqref   -> \eqref{}
  gls     -> \gls{}
  glspl   -> \glspl{}

Lists:
  item    -> itemize
  enum    -> enumerate
  desc    -> description

Text:
  bf      -> \textbf{}
  it      -> \textit{}
  tt      -> \texttt{}

Greek, math mode only:
  @a  \alpha      @b  \beta
  @g  \gamma      @d  \delta
  @D  \Delta      @q  \theta
  @l  \lambda     @m  \mu
  @s  \sigma      @S  \Sigma
  @p  \pi         @w  \omega
  @W  \Omega
]]

local function show_tex_snips()
  local lines = vim.split(tex_snips, '\n')

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local width = 48
  local height = math.min(#lines, 28)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = 'minimal',
    border = 'rounded',
    title = ' TeX snippets ',
    title_pos = 'center',
  })

  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = 'wipe'

  vim.keymap.set('n', 'q', function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf, silent = true })

  vim.keymap.set('n', '<Esc>', function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf, silent = true })
end

vim.keymap.set('n', '<leader>ls', show_tex_snips, {
  buffer = true,
  silent = true,
  desc = 'Show LaTeX snippets',
})
