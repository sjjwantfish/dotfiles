return {
  {
    "sindrets/diffview.nvim",
    -- requires = 'nvim-lua/plenary.nvim',
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>df", "<cmd>DiffviewFileHistory<cr>", desc = "DiffviewFileHistory" },
    },
    init = function()
      require("diffview").setup()
    end,
  },
}
