local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
local actions = require("telescope.actions")

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
      "paopaol/telescope-git-diffs.nvim",
    },
    config = function(_, opts)
      telescope.load_extension("vim_bookmarks")
      telescope.load_extension("undo")
      telescope.load_extension("git_diffs")
      -- telescope.load_extension("aerial")
      telescope.setup(opts)
    end,
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      {
        "<leader>sf",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "Current buffer fuzzy find",
      },
      {
        "<leader>su",
        "<cmd>Telescope undo<cr>",
        desc = "Undo tree",
      },
      {
        "<leader>sm",
        "<cmd>Telescope vim_bookmarks<cr>",
        desc = "Bookmarks",
      },
      {
        "<leader><leader>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find Files",
      },
    },
    opts = {
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        },
        live_grep = {
          vimgrep_arguments = {
            "rg",
            "--hidden",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-g",
            "!.git",
          },
        },
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<C-f>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-b>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
          },
          n = {
            -- ["q"] = function(...)
            --   return require("telescope.actions").close(...)
            -- end,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
          },
        },
      },
      extensions = {
        undo = {
          -- telescope-undo.nvim config, see below
        },
        -- aerial = {
        --   -- Display symbols as <root>.<parent>.<symbol>
        --   show_nesting = {
        --     ["_"] = false, -- This key will be the default
        --     json = true, -- You can set the option for specific filetypes
        --     yaml = true,
        --   },
        -- },
      },
    },
  },
}
