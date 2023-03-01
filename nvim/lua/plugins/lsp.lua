return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
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
        "debugpy",
        "autoflake",
        -- vue
        "vue-language-server",
        "eslint_d",
        "prettier",
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
  -- {
  --   "stevearc/aerial.nvim",
  --   opts = {
  --     filter_kind = {
  --       "Class",
  --       "Constructor",
  --       "Enum",
  --       "Function",
  --       "Interface",
  --       "Module",
  --       "Method",
  --       "Struct",
  --     },
  --   },
  --   keys = {
  --     { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Symbols Outline" },
  --   },
  -- },
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off",
                -- reportOptionalMemberAccessL = "none"
                -- useLibraryCodeForTypes = false,
                autoSearchPaths = false,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = false,
              },
            },
          },
        },
        eslint = {
          codeAction = {
            -- disableRuleComment = {
            --   enable = true,
            --   location = "separateLine"
            -- },
            showDocumentation = {
              enable = true,
            },
          },
          workingDirectory = {
            mode = "location",
          },
        },
        vuels = {},
      },
    },
    -- TODO
    -- config = function(_, opts)
    --   local navic = require("nvim-navic")
    --   require("lspconfig").eslint_d.setup({
    --     on_attach = function(client, bufnr)
    --       navic.attach(client, bufnr)
    --     end,
    --   })
    -- end,
  },
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      require("lazyvim.util").on_attach(function(client, buffer)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = require("lazyvim.config").icons.kinds,
      }
    end,
  },
}
