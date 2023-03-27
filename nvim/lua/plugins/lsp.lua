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
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<cr>" }
      keys[#keys + 1] = { "gh", "<cmd>Lspsaga lsp_finder<cr>" }
      keys[#keys + 1] = { "gd", "<cmd>Lspsaga goto_type_definition<cr>" }
      keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<cr>" }
      keys[#keys + 1] = { "gj", "<cmd>Lspsaga outgoing_calls<cr>" }
      keys[#keys + 1] = { "gk", "<cmd>Lspsaga incoming_calls<cr>" }
      keys[#keys + 1] = { "<leader>cS", "<cmd>Lspsaga outline<cr>" }
      -- -- disable a keymap
      -- keys[#keys + 1] = { "K", false }
      -- -- add a keymap
      -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    end,
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
  -- {
  --   "SmiteshP/nvim-navic",
  --   lazy = true,
  --   init = function()
  --     vim.g.navic_silence = true
  --     require("lazyvim.util").on_attach(function(client, buffer)
  --       if client.server_capabilities.documentSymbolProvider then
  --         require("nvim-navic").attach(client, buffer)
  --       end
  --     end)
  --   end,
  --   opts = function()
  --     return {
  --       separator = " ",
  --       highlight = true,
  --       depth_limit = 5,
  --       icons = require("lazyvim.config").icons.kinds,
  --     }
  --   end,
  -- },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    opts = {
      preview = {
        lines_above = 0,
        lines_below = 10,
      },
      scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
      },
      request_timeout = 2000,
      finder = {
        --percentage
        max_height = 0.5,
        force_max_height = false,
        keys = {
          jump_to = "p",
          edit = { "o", "<CR>" },
          vsplit = "s",
          split = "i",
          tabe = "t",
          tabnew = "r",
          quit = { "q", "<ESC>" },
          close_in_preview = "<ESC>",
        },
      },
      outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
          jump = "o",
          expand_collapse = "z",
          quit = "q",
        },
      },
    },
    -- config = function()
    --   require("lspsaga").setup({})
    -- end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
    -- init = function()
    --   local opts = { noremap = true, silent = true }
    --   local keymap = vim.keymap.set
    --   keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    --   vim.api.nvim_set_keymap("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
    --   vim.api.nvim_set_keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    -- end,
  },
  {
    "ray-x/lsp_signature.nvim",
    opts = {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "double",
      },
      noice = true,
      -- transparency = 1,
    },
  },
}
