return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        -- shell
        "shellcheck",
        "shfmt",
        "bash-language-server",
        -- python
        "pyright",
        "flake8",
        "isort",
        "black",
        -- vue
        "vue-language-server",
        "eslint_d",
        -- buf
        "buf-language-server",
        "buf",
      },
    },
  },
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = {
      -- add your options that should be passed to the setup() function here
      position = "right",
    },
  },
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
    -- config = function()
    --   local navic = require("nvim-navic")
    --   require("lspconfig").clangd.setup({
    --     on_attach = function(client, bufnr)
    --       navic.attach(client, bufnr)
    --     end,
    --   })
    -- end,
  },
}
