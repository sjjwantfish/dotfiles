return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- vim.list_extend(opts.ensure_installed, {
      --   "tsx",
      --   "typescript",
      -- })
      opts.indent = { enable = true }
      opts.ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        -- "tsx",
        -- "typescript",
        "vim",
        "yaml",
        "vue",
      }
    end,
  },
}
