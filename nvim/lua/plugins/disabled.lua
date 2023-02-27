local disabled_plugins = {
  "ggandor/leap.nvim",
  "ggandor/flit.nvim",
}

local M = {}
for i, plugin in ipairs(disabled_plugins) do
  M[i] = { plugin, enabled = false }
end

return M
