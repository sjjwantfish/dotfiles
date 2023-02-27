return {
  -- selection
  { "gcmt/wildfire.vim" },
  -- bookmarks
  { "MattesGroeger/vim-bookmarks" },
  { "tom-anders/telescope-vim-bookmarks.nvim" },
  -- motion
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
    keys = {
      { "<leader>j", "<cmd>HopWordMW<cr>", desc = "HopWordMW" },
      { "<leader>n", "<cmd>HopLineMW<cr>", desc = "HopLineMW" },
    },
  },
  { "mbbill/undotree" },
  { "lfv89/vim-interestingwords" },
  {
    "sindrets/diffview.nvim",
    -- requires = 'nvim-lua/plenary.nvim',
    dependencies = "nvim-lua/plenary.nvim",
  },
}
