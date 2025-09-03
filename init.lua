vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader=" "

vim.opt.shell="cmd.exe"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.opt_local.winfixwidth = true  
  end,
})

require("config.lazy")
require("config.keymaps")

