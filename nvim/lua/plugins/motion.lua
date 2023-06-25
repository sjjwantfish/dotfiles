return {
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
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    opts = { skipInsignificantPunctuation = false },
    init = function()
      vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
    end,
  },
  {
    "cbochs/portal.nvim",
    opts = {
      window_options = {
        height = 7,
      },
      escape = {
        ["<esc>"] = true,
        ["q"] = true,
      },
    },
    init = function()
      vim.keymap.set("n", "<leader>o", "<cmd>Portal jumplist backward<cr>")
      vim.keymap.set("n", "<leader>i", "<cmd>Portal jumplist forward<cr>")
    end,
  },
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>;;", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "harpoon quick menu" },
      { "<leader>;a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "harpoon mark file" },
    },
  },
}
