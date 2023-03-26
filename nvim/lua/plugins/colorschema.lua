return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = true,
        modules = {
          cmp = false,
        },
      },
      groups = {
        all = {
          -- NormalFloat = { bg = "NONE" },
          NormalFloat = { fg = "fg1", bg = "NONE" },
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "nightfox",
      colorscheme = "tokyonight",
    },
  },
}
