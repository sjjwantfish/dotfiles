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
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jk", "jj" }, -- a table with mappings to use
      timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
      clear_empty_lines = false, -- clear line after escaping if there is only whitespace
      keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
      -- example(recommended)
      -- keys = function()
      --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
      -- end,
    },
  },
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
    -- default values
    opts = {
      -- if a buffer has been inactive for this many minutes, close it
      retirementAgeMins = 2,

      -- filetypes to ignore
      ignoredFiletypes = {},

      -- ignore files matches this lua pattern (string.find); empty string
      -- disables this setting
      ignoreFilenamePattern = "",

      -- will not close the alternate file
      ignoreAltFile = true,

      -- minimum number of open buffers for auto-closing to become active, e.g.,
      -- by setting this to 4, no auto-closing will take place when you have 3
      -- or less open buffers. Note that this plugin never closes the currently
      -- active buffer, so a number < 2 will effectively disable this setting.
      minimumBufferNum = 5,

      -- will ignore buffers with unsaved changes. If false, the buffers will
      -- automatically be written and then closed.
      ignoreUnsavedChangesBufs = true,

      -- ignore non-empty buftypes, for example terminal buffers
      ignoreSpecialBuftypes = true,

      -- ignore visible buffers ("a" in `:buffers`). buffers open in a window,
      -- or in a tab are consider visible by vim
      ignoreVisibleBufs = true,

      -- ignore unloaded buffers. session-management plugin often add buffers
      -- to the buffer list without loading them
      ignoreUnloadedBufs = false,

      -- uses vim.notify for plugins like nvim-notify
      notificationOnAutoClose = false,
    },
  },
}
