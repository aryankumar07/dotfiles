return {
  {
    "folke/tokyonight.nvim",
    enabled = true,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end
  },
  {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme catppuccin]]
    end
  },
  {
    "rose-pine/neovim",
    enabled = false,
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end
  },
}
