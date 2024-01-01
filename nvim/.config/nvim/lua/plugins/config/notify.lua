local M = {}

M.opts = {
  timeout = 3000,
  render = "default",
  stages = "fade",
  max_height = function()
    return math.floor(vim.o.lines * 0.5)
  end,
  max_width = function()
    return math.floor(vim.o.columns * 0.35)
  end
}

return M
