return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    opts = {
      ensure_installed = {
        -- Neovim / basics
        "lua", "vim", "vimdoc",

        -- Config files
        "bash", "json", "yaml", "toml",

        -- Web stack
        "html", "css", "scss",
        "javascript", "typescript", "tsx",

        -- Docs
        "markdown", "markdown_inline",

        -- Extra
        "regex", "query",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  }
}
