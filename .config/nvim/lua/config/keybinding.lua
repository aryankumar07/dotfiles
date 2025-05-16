local opts = { noremap = true, silent = true }

vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })
vim.keymap.set("n","<space>i","gg=G", opts)



-- keymap for new tabs
vim.keymap.set("n", "te", "tabedits", opts)
vim.keymap.set("n", "<tab>", ":tabnext<Return>", opts)
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- keymap for split screen
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)

-- keymap for move to window
vim.keymap.set("n", "sh", "<C-w>h", opts)
vim.keymap.set("n", "sl", "<C-w>l", opts)
vim.keymap.set("n", "sj", "<C-w>j", opts)
vim.keymap.set("n", "sk", "<C-w>k", opts)

-- keymap for resizing
vim.keymap.set("n", "<C-w><left>", "<C-w><", opts)
vim.keymap.set("n", "<C-w><right>", "<C-w>>", opts)


-- keymap for oil
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })


-- keymap for Lazy
vim.keymap.set("n", "<space>l", "<cmd>Lazy<CR>", opts)


-- keymap for Mason
vim.keymap.set("n", "<space>m", "<cmd>Mason<CR>", opts)

-- keymao for Termial;
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")


--keymap for telescope Undo
vim.keymap.set("n","<space>u","<cmd>Telescope undo<cr>")

-- keymap binding for terminal
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()                              -- Open a new vertical split
  vim.cmd.term()                              -- Open terminal in the new split
  vim.cmd.wincmd("L")                         -- Move the terminal window to the right side
  local width = math.floor(vim.o.columns / 3) -- Calculate 1/3 of the screen width
  vim.api.nvim_win_set_width(0, width)        -- Set the terminal window width
end)
