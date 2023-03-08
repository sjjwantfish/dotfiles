return {
  -- {

  --   "echasnovski/mini.comment",
  --   enabled = false,
  --   opts = {
  --     options = {
  --       ignore_blank_line = true,
  --     },
  --     mappings = {
  --       comment = "<leader>m",
  --       comment_line = "<leader>m",
  --     },
  --   },
  -- },
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
}
