return {

  -- motion
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
    init = function()
      vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>HopWordMW<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<leader>j", "<cmd>HopWordMW<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>HopLineMW<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<leader>n", "<cmd>HopLineMW<cr>", { noremap = true, silent = true })
    end,
    -- keys = {
    --   { "<leader>j", "<cmd>HopWordMW<cr>", desc = "HopWordMW" },
    --   { "<leader>n", "<cmd>HopLineMW<cr>", desc = "HopLineMW" },
    -- },
  },
  -- bookmarks
  { "MattesGroeger/vim-bookmarks" },
  { "tom-anders/telescope-vim-bookmarks.nvim" },
}
