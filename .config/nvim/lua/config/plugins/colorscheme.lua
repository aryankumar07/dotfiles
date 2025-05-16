return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
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
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  }
}
