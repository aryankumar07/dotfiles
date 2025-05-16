return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
      require('telescope').setup {
        pickers = {
          -- find_files = {
            --   theme = "dropdown"
            -- }
          },
          defaults = {
            file_ignore_patterns = {
              "node_modules"
            }
          },
          extensions = {
            fzf = {},
            undo={
              side_by_side = true,
              layout_strategy = "vertical",
              layout_config = {
                preview_height = 0.8,
              },
            }
          }
        }

        require("telescope").load_extension("undo")
        require("telescope").load_extension("fzf")
        vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files)
        vim.keymap.set("n", "<space>fg", require("telescope.builtin").live_grep)
        vim.keymap.set("n", "<space>ff", require("telescope.builtin").buffers)
        vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags)
        vim.keymap.set("n", "<space>bb", require("telescope.builtin").builtin)
        vim.keymap.set("n", "<space>cc", require("telescope.builtin").commands)
        vim.keymap.set("n", "<space>en", function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.stdpath("config"),
          })
        end)
      end,
    },
  }
