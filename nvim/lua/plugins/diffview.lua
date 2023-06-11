return {
  {
    "sindrets/diffview.nvim",
    -- requires = 'nvim-lua/plenary.nvim',
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>df", "<cmd>DiffviewFileHistory<cr>", desc = "DiffviewFileHistory" },
      { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "DiffviewOpen" },
      { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "DiffviewClose" },
      { "<leader>dr", "<cmd>DiffviewRefresh<cr>", desc = "DiffviewRefresh" },
      -- {
      --   "<leader>db",
      --   function()
      --     require("telescope.builtin.git_branches")
      --   end,
      --   desc = "Diff with current branch",
      -- },
    },
    -- init = function()
    --   require("diffview").setup()
    -- end,
    opts = {
      view = {
        merge_tool = {
          -- layout = "diff1_plain",
          layout = "diff3_vertical",
        },
        -- file_history = {
        --   layout = "diff2_vertical",
        -- },
      },
    },
  },
}
