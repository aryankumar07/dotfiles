local M = {}


local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or vim.o.columns
  local height = opts.height or vim.o.lines

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer
  local buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer

  -- Define window configuration
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal", -- No borders or extra UI elements
    border = { " ", " ", " ", " ", " ", " ", " ", " " }
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end



M.setup = function()
  -- nothing
end


local parse_slides = function(lines)
  local slides = { slides = {} }
  local current_slide = {}
  local seperator = "^#"

  for _, line in ipairs(lines) do
    if (line:find(seperator)) then
      if (#current_slide > 0) then
        table.insert(slides.slides, current_slide)
      end
      current_slide = {}
    end
    table.insert(current_slide, line)
  end
  table.insert(slides.slides, current_slide)
  return slides
end



M.start_presentation = function(opts)
  opts = opts or {}

  opts.bufnr = opts.bufnr or 0

  vim.print(opts.bufnr)

  local lines = vim.api.nvim_buf_get_lines(opts.bufnr, 0, -1, false)
  local parsedLines = parse_slides(lines)
  local float = create_floating_window()

  local restore = {
    cmdheight = {
      orignal = vim.o.cmdheight,
      present = 0
    }
  }

  for option, config in pairs(restore) do
    vim.opt[option] = config.present
  end

  -- keymaps settings
  local current_slide = 1
  vim.keymap.set('n', 'n', function()
    current_slide = math.min(current_slide + 1, #parsedLines.slides)
    vim.api.nvim_buf_set_lines(float.buf, 0, -1, false, parsedLines.slides[current_slide])
  end, { buffer = float.buf })

  vim.keymap.set('n', 'p', function()
    current_slide = math.max(current_slide - 1, 1)
    vim.api.nvim_buf_set_lines(float.buf, 0, -1, false, parsedLines.slides[current_slide])
  end, { buffer = float.buf })

  vim.keymap.set('n', 'q', function()
    vim.api.nvim_win_close(float.win, true)
  end, {
    buffer = float.buf
  })


  vim.api.nvim_create_autocmd('bufLeave', {
    buffer = float.buf,
    callback = function()
      for option, config in pairs(restore) do
        vim.opt[option] = config.orignal
      end
    end
  })



  vim.api.nvim_buf_set_lines(float.buf, 0, -1, false, parsedLines.slides[current_slide])
end


-- M.start_presentation { bufnr = 16 }


-- vim.print(parse_slides {
--   "hello",
--   "hello there",
--   "again a hello there",
--   "#hello 2",
--   "hi there"
-- })



return M
