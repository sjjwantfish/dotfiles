return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_hidden = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          ".gitignored",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          --".DS_Store",
          --"thumbs.db"
          -- "__pycache__",
          ".pytest_cache",
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
          "*/__pycache__/*",
        },
      },
    },
  },
}
