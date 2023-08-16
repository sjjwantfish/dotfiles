return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  { "martinda/Jenkinsfile-vim-syntax" },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      padding = true,
      sticky = true,
      ignore = "^$",
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      post_hook = nil,
    },
    keys = {
      {
        "<leader>m",
        mode = { "n" },
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        desc = "Comment Toggle line",
      },
      {
        "<leader>m",
        mode = { "v" },
        function()
          local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
          local api = require("Comment.api")
          vim.api.nvim_feedkeys(esc, "nx", false)
          api.toggle.linewise(vim.fn.visualmode())
        end,
        desc = "Comment Toggle line",
      },
    },
    init = function()
      local ft = require("Comment.ft")
      ft({ "mysql", "sql" }, { "--%s" })
      ft({ "Jenkinsfile" }, { "//%s" })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  { "Ttibsi/pre-commit.nvim" },
  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<C-a>",
        mode = "n",
        function()
          require("dial.map").inc_normal()
        end,
      },
      {
        "<C-x>",
        mode = "n",
        function()
          require("dial.map").dec_normal()
        end,
      },
      {
        "g<C-a>",
        mode = "n",
        function()
          require("dial.map").inc_gnormal()
        end,
      },
      {
        "g<C-x>",
        mode = "n",
        function()
          require("dial.map").dec_gnormal()
        end,
      },
      {
        "<C-a>",
        mode = "v",
        function()
          require("dial.map").inc_visual()
        end,
      },
      {
        "<C-x>",
        mode = "v",
        function()
          require("dial.map").dec_visual()
        end,
      },
      {
        "g<C-a>",
        mode = "v",
        function()
          require("dial.map").inc_gvisual()
        end,
      },
      {
        "g<C-x>",
        mode = "v",
        function()
          require("dial.map").dec_gvisual()
        end,
      },
    },
  },
}
