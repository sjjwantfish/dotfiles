return {
  {
    "folke/noice.nvim",
    opts = {

      lsp = {
        signature = {
          enabled = false,
        },
        progress = {
          enabled = false,
        },
      },
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        -- long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },
  -- database
  { "tpope/vim-dadbod" },
  {
    "kristijanhusak/vim-dadbod-ui",
    keys = {
      { "<leader>ub", "<cmd>DBUIToggle<cr>", desc = "DB UI" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_table_helpers = {
        mysql = {
          Structure = "SHOW CREATE TABLE {table};",
        },
      }
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    init = function()
      vim.cmd([[
        autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
      ]])
    end,
  },
}
