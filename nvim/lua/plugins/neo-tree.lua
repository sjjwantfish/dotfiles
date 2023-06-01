return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    filesystem = {
      filtered_items = {
        hide_hidden = false,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          ".gitignored",
          "config.yaml",
          "config.lua",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          --".DS_Store",
          -- "thumbs.db",
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
          "__pycache__",
          "*.pyc",
          ".pytest_cache",
        },
      },
    },
  },
  dependencies = {
    {
      "s1n7ax/nvim-window-picker",
      tag = "v1.5",
      config = function()
        require("window-picker").setup()
      end,
    },
  },
}
