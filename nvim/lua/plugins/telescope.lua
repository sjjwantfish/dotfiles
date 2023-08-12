local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
local actions = require("telescope.actions")

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
      "paopaol/telescope-git-diffs.nvim",
      "xiyaowong/telescope-emoji.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "crispgm/telescope-heading.nvim",
      "LinArcX/telescope-env.nvim",
      "ThePrimeagen/harpoon",
    },
    config = function(_, opts)
      telescope.load_extension("vim_bookmarks")
      telescope.load_extension("undo")
      telescope.load_extension("git_diffs")
      telescope.load_extension("emoji")
      telescope.load_extension("heading")
      telescope.load_extension("env")
      telescope.load_extension("harpoon")
      -- telescope.load_extension("aerial")
      if vim.fn.winwidth(0) <= 120 then
        opts.defaults = vim.tbl_deep_extend("force", opts.defaults, require("telescope.themes").get_dropdown({ opts }))
      end
      local lga_actions = require("telescope-live-grep-args.actions")
      opts.extensions = {
        undo = {},
        live_grep_args = {
          theme = "ivy",
          auto_quoting = true,
          mappings = {
            i = {
              -- ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
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
            "-g",
            "!devTools",
            "-g",
            "!vendor",
          },
        },
        heading = { treesitter = true },
      }
      telescope.setup(opts)
    end,
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
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
      { "<leader>ca", false },
      { "<leader>/", false },
      -- { "<leader>p", "<cmd>Telescope live_grep<cr>", desc = "Find in files(Grep)" },
      {
        "<leader>p",
        ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        desc = "Live Grep with args",
      },
      { "<leader>gB", ":Telescope git_branches<CR>", desc = "Checkout branch" },
    },
    opts = {
      pickers = {
        find_files = {
          theme = "ivy",
          find_command = { "rg", "--files", "--hidden", "-g", "!.git", "-g", "!devTools", "-g", "!vendor" },
        },
        live_grep = {
          theme = "ivy",
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
            "-g",
            "!devTools",
            "-g",
            "!vendor",
          },
        },
      },
      defaults = {
        cache_picker = {
          num_pickers = 5,
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<C-Down>"] = function(...)
              return actions.cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return actions.cycle_history_prev(...)
            end,
            ["<C-f>"] = function(...)
              return actions.preview_scrolling_down(...)
            end,
            ["<C-b>"] = function(...)
              return actions.preview_scrolling_up(...)
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
    },
  },
}
