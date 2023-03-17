return {
  {
    "sindrets/diffview.nvim",
    -- requires = 'nvim-lua/plenary.nvim',
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>df", "<cmd>DiffviewFileHistory<cr>", desc = "DiffviewFileHistory" },
      -- {
      --   "<leader>db",
      --   function()
      --     require("telescope.builtin.git_branches")
      --   end,
      --   desc = "Diff with current branch",
      -- },
    },
    init = function()
      require("diffview").setup()
    end,
  },
}
