return {

  { "mfussenegger/nvim-dap" },
  { "jayp0521/mason-nvim-dap.nvim" },
  { "nvim-telescope/telescope-dap.nvim" },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      { "<leader>dg", "<cmd>DapToggleRepl<cr>", desc = "Dap Repl" },
    },
  },
  { "theHamsta/nvim-dap-virtual-text" },
}
