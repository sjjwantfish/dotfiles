return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "stylua",
        "lua-language-server",
        -- shell
        "shellcheck",
        "shfmt",
        "bash-language-server",
        -- golang
        "gopls",
        "gomodifytags",
        -- python
        "pyright",
        "flake8",
        "isort",
        "black",
        "debugpy",
        "autoflake",
        "pylint",
        -- vue
        "vue-language-server",
        -- "eslint_d",
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
      -- show_line_numbers = true,
      -- show_relative_path = true,
      keymaps = {
        focus_location = "<Cr>",
      },
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
        -- eslint = {
        --   codeAction = {
        --     -- disableRuleComment = {
        --     --   enable = true,
        --     --   location = "separateLine"
        --     -- },
        --     showDocumentation = {
        --       enable = true,
        --     },
        --   },
        --   -- workingDirectory = {
        --   --   mode = "location",
        --   -- },
        -- },
        -- vuels = {},
        volar = {
          -- settings = {
          --   vue = {
          --     updateImportsOnFileMove = { enabled = true },
          --     { server = { fullCompletionList = true, petiteVue = { supportHtmlFile = true } } },
          --   },
          -- },
        },
        gopls = {},
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<cr>" }
      keys[#keys + 1] = { "gh", "<cmd>Lspsaga lsp_finder<cr>" }
      keys[#keys + 1] = { "gd", "<cmd>Lspsaga goto_definition<cr>" }
      keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<cr>" }
      keys[#keys + 1] = { "gj", "<cmd>Lspsaga outgoing_calls<cr>" }
      keys[#keys + 1] = { "gk", "<cmd>Lspsaga incoming_calls<cr>" }
      keys[#keys + 1] = { "<leader>cS", "<cmd>Lspsaga outline<cr>" }
      keys[#keys + 1] = { "<leader>cR", "<cmd>LspRestart<cr>" }
      -- print(vim.fn.getcwd(vim.api.nvim_get_current_win(), vim.api.nvim_get_current_tabpage()))
    end,
  },
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
      lightbulb = {
        virtual_text = false,
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
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
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
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
