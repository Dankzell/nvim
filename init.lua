vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.netrw_keepdir=0
vim.g.netrw_winsize=25
vim.g.netrw_banner=0
vim.g.netrw_localcopydircmd='cp -r'
vim.g.netrw_browse_split=2
vim.g.netrw_liststyle=3
vim.g.netrw_preview=1
vim.g.netrw_altv=0
vim.opt.equalalways=true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.opt_local.winfixwidth = true  
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    -- Open file under cursor in the previously used window,
    -- then jump back to netrw (so the sidebar stays focused).
    vim.keymap.set("n", "r", function()
      local file = vim.fn.expand("<cfile>")
      if file == "" then return end
      file = vim.fn.fnameescape(file)
      vim.cmd("wincmd p")            -- go to previous window (the one to replace)
      vim.cmd("edit " .. file)       -- replace its buffer
      vim.cmd("wincmd p")            -- come back to netrw
    end, { buffer = true, desc = "Open in previous window (replace) and stay in netrw" })
  end,
})


require("config.lazy")
require("config.keymaps")

