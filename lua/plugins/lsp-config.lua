return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    --[[
    config = function()
      require("mason-lspconfig").setup()
    end
    ]]
    opts = {
      ensure_installed = {"lua_ls"},
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
      }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
    end
  }
}
