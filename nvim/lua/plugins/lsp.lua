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
      symbol_blacklist = { "Variable" },
      symbols = {
        File = { icon = "", hl = "@text.uri" },
        Module = { icon = "", hl = "@namespace" },
        Namespace = { icon = "", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "𝓒", hl = "@type" },
        Method = { icon = "ƒ", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "ℰ", hl = "@type" },
        Interface = { icon = "ﰮ", hl = "@type" },
        Function = { icon = "", hl = "@function" },
        Variable = { icon = "", hl = "@constant" },
        Constant = { icon = "", hl = "@constant" },
        String = { icon = "𝓐", hl = "@string" },
        Number = { icon = "#", hl = "@number" },
        Boolean = { icon = "⊨", hl = "@boolean" },
        Array = { icon = "", hl = "@constant" },
        Object = { icon = "⦿", hl = "@type" },
        Key = { icon = "🔐", hl = "@type" },
        Null = { icon = "NULL", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "𝓢", hl = "@type" },
        Event = { icon = "🗲", hl = "@type" },
        Operator = { icon = "+", hl = "@operator" },
        TypeParameter = { icon = "𝙏", hl = "@parameter" },
        Component = { icon = "", hl = "@function" },
        Fragment = { icon = "", hl = "@constant" },
      },
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
