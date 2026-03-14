-- All colorschemes are installed; the first one in the list is the default.
-- Use <space>tc to open a Telescope picker to switch between them.

local colorschemes = { "tokyonight", "catppuccin", "rose-pine", "gruvbox" }
local default_colorscheme = colorschemes[1]

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(default_colorscheme)

      vim.keymap.set("n", "<leader>tc", function()
        local original = vim.g.colors_name
        local confirmed = false

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Colorschemes",
            finder = require("telescope.finders").new_table({ results = colorschemes }),
            sorter = require("telescope.config").values.generic_sorter({}),
            attach_mappings = function(prompt_bufnr, map)
              local actions = require("telescope.actions")
              local action_state = require("telescope.actions.state")

              -- Live preview as you navigate
              local function preview_selection()
                local selection = action_state.get_selected_entry()
                if selection then
                  pcall(vim.cmd.colorscheme, selection[1])
                end
              end

              map("i", "<C-n>", function()
                actions.move_selection_next(prompt_bufnr)
                preview_selection()
              end)
              map("i", "<C-p>", function()
                actions.move_selection_previous(prompt_bufnr)
                preview_selection()
              end)
              map("n", "j", function()
                actions.move_selection_next(prompt_bufnr)
                preview_selection()
              end)
              map("n", "k", function()
                actions.move_selection_previous(prompt_bufnr)
                preview_selection()
              end)

              -- Confirm selection
              actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                confirmed = true
                actions.close(prompt_bufnr)
                if selection then
                  vim.cmd.colorscheme(selection[1])
                end
              end)

              -- Restore original on cancel
              actions.close:enhance({
                post = function()
                  if not confirmed then
                    pcall(vim.cmd.colorscheme, original)
                  end
                end,
              })

              return true
            end,
          })
          :find()
      end, { desc = "Pick colorscheme (Telescope)" })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },
}
