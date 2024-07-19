local config = {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
    disabled_filetypes = {
      statusline = { 'NvimTree' },
      winbar = {},
    }
  },
}

require("lualine").setup(config)
