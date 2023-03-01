return {
  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          -- lua
          nls.builtins.formatting.stylua,
          -- python
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
          nls.builtins.formatting.isort.with({ extra_args = { "--profile", "black", "--line-length=80" } }),
          nls.builtins.formatting.autoflake.with({
            extra_args = {
              "--recursive",
              "--in-place",
              "--remove-all-unused-imports",
              "--remove-unused-variables",
              "--expand-star-imports",
              "--exclude",
              "__init__.py",
              "--remove-duplicate-keys",
            },
          }),
          -- javascript javascriptreact typescript typescriptreact vue
          nls.builtins.formatting.eslint_d,
          nls.builtins.diagnostics.eslint_d,
          nls.builtins.code_actions.gitsigns,
        },
      }
    end,
  },
}
