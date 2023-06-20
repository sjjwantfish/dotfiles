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
    -- enabled = false,
    init = function()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>m",
        "<Plug>(comment_toggle_linewise_current)",
        -- "Comment toggle current line",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<leader>m",
        "<Plug>(comment_toggle_linewise_visual)",
        -- "Comment toggle linewise (visual)",
        { noremap = true, silent = true }
      )
    end,
    opts = {
      ---Add a space b/w comment and the line
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---Lines to be ignored while (un)comment
      ignore = "^$",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  { "Ttibsi/pre-commit.nvim" },
}
