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
          nls.builtins.formatting.isort,
          -- javascript javascriptreact typescript typescriptreact vue
          nls.builtins.formatting.eslint_d,
          nls.builtins.formatting.prettier,
          nls.builtins.diagnostics.eslint_d,
          nls.builtins.code_actions.gitsigns,
        },
      }
    end,
  },
}
