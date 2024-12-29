print("Found the INIT.lua ile and sourced it")
require("config.lazy")
require("config.colorscheme")
require("config.keybinding")
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.numberwidth = 3

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlighting your yanking (coying) text",
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd("Termopen", {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
