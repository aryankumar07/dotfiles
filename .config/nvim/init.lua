print("Found the INIT.lua ile and source it")
require("config.lazy")
require("config.keybinding")
require("config.options")
require("config.colorschemes.colorscheme")
--vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
--vim.cmd [[highlight NonText guibg=NONE ctermbg=NONE]]

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#ADD8E6", fg = "#0000FF" })
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
