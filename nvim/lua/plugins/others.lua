return {
  { "nvim-lua/plenary.nvim", lazy = false },
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
  -- { "mbbill/undotree" },
  {
    "lfv89/vim-interestingwords",
    init = function()
      vim.g.interestingWordsDefaultMappings = 0
      vim.g.interestingWordsRandomiseColors = 1
      vim.api.nvim_set_keymap("v", "<a-h>", "<cmd>call InterestingWords('v')<cr>", { noremap = true, silent = true })
    end,
    keys = {
      { "<a-h>", "<cmd>call InterestingWords('n')<cr>", desc = "InterestingWords" },
      { "<a-H>", "<cmd>call UncolorAllWords()<cr>", desc = "UncolorAllWords" },
      { "<a-n>", "<cmd>call WordNavigation(1)<cr>", desc = "Next InterestingWords" },
      { "<a-N>", "<cmd>call WordNavigation(0)<cr>", desc = "Prev InterestingWords" },
    },
  },
  { "kovetskiy/sxhkd-vim" },
}
