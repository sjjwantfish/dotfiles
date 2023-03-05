-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
autocmd FileType javascript set shiftwidth=2
autocmd FileType vue set shiftwidth=2
autocmd FileType lua set shiftwidth=2
autocmd FileType css set shiftwidth=2
autocmd FileType scss set shiftwidth=2
autocmd FileType sh set shiftwidth=2
autocmd FileType sxhkd set shiftwidth=2
]])

-- for wsl
vim.cmd([[
if system('uname -r') =~ "Microsoft"
    augroup Yank
        autocmd!
        autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
        augroup END
endif
]])
-- for wsl2
vim.cmd([[
if system('uname -r') =~ "microsoft"
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
endif
]])

-- auto reload sxhkd
vim.cmd([[
  augroup sxhkd
  autocmd!
  autocmd BufWrite sxhkdrc :!pkill -USR1 -x sxhkd
]])

-- -- dadbod
-- vim.cmd([[
--   autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
-- ]])
