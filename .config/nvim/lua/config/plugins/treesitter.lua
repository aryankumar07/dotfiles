return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        "c",
        "cpp",
        "typescript",
        "tsx",
        "javascript",
        "html",
        "css",
        "json",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "gitignore",
      },

      -- Recommendation: Set this to true to automatically install parsers
      -- for new languages you open.
      auto_install = true,

      highlight = {
        enable = true,
        disable = function(lang, buf)
          -- Disable highlighting for files larger than 100 KB
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },

      -- [2] ADDED THIS ENTIRE BLOCK TO ENABLE THE AUTOTAG PLUGIN
      autotag = {
        enable = true,
      },
    })
  end
}
