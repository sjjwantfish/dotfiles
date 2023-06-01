return {
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

  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup({
        highlight_on_key = true, -- show highlights only after keypress
        dim = true, -- dim all other characters if set to true (recommended!)
      })
    end,
  },
  {
    "romainl/vim-cool",
    -- init = function()
    --   vim.g.cool_total_matches = 1
    -- end,
  },
}
