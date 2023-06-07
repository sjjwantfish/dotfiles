local function config_dapui()
  local dap, dapui = require("dap"), require("dapui")
  local debug_open = function()
    dapui.open()
    vim.api.nvim_command("DapToggleRepl")
  end
  local debug_close = function()
    dap.repl.close()
    dapui.close()
    vim.api.nvim_command("DapVirtualTextDisable")
  end
  dap.listeners.after.event_initialized["dapui_config"] = function()
    debug_open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    debug_close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    debug_close()
  end
  dap.listeners.before.disconnect["dapui_config"] = function()
    debug_close()
  end
end

-- python
local function get_python_path()
  local output = io.popen("which python")
  if output ~= nil then
    local pp = output:read("*a")
    output:close()
    -- remove '\n'
    return string.sub(pp, 0, -2)
  end
  return os.getenv("HOME") .. "/miniconda3/bin/python"
end

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      config_dapui()
      require("dap-python").setup(get_python_path())
    end,
    keys = {
      { "<leader>kk", "<cmd>DapToggleBreakpoint<cr>", desc = "Dap Toggle Breakpoint" },
      { "<leader>kc", "<cmd>DapContinue<cr>", desc = "DapContinue" },
    },
  },
  { "mfussenegger/nvim-dap-python" },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      { "<leader>kg", "<cmd>DapToggleRepl<cr>", desc = "Dap Repl" },
    },
    opts = {
      layouts = {
        {
          elements = {
            -- Elements can be strings or table with id and size keys.
            { id = "scopes", size = 0.35 },
            { id = "stacks", size = 0.35 },
            { id = "watches", size = 0.15 },
            { id = "breakpoints", size = 0.15 },
          },
          size = 40, -- 40 columns
          position = "left",
        },
      },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
      },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {
      highlight_new_as_changed = true,
    },
  },
}
