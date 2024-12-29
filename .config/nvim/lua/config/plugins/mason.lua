return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason').setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "tailwindcss",
          "clangd",
        }
      })
    end
  }
}