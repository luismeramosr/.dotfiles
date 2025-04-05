---@type Base46Table
local M = {}

M.base_30 = {
  white = "#CCCAC2",
  darker_black = "#161922",
  black = "#1F2430", -- nvim bg
  black2 = "#1C212B",
  one_bg = "#171B24",
  one_bg2 = "#232A4C",
  one_bg3 = "#274364",
  grey = "#323843",
  grey_fg = "#4A505A",
  grey_fg2 = "#757B84",
  light_grey = "#707A8C",
  red = "#FF6666",
  baby_pink = "#F28779",
  pink = "#F27983",
  line = "#171B24", -- used for lines like vertsplit
  green = "#D5FF80",
  vibrant_green = "#87D96C",
  blue = "#73D0FF",
  nord_blue = "#5CCFE6",
  yellow = "#FFAD66",
  sun = "#FFCC66",
  purple = "#DFBFFF",
  dark_purple = "#D3B8F9",
  teal = "#95E6CB",
  orange = "#FFD173",
  cyan = "#5CCFE6",
  statusline_bg = "#1C212B",
  lightbg = "#232A4C",
  pmenu_bg = "#FFD173",
  folder_bg = "#707A8C",
}

M.base_16 = {
  base00 = "#1F2430", -- bg
  base01 = "#1C212B",
  base02 = "#171B24",
  base03 = "#707A8C",
  base04 = "#B0AEAA",
  base05 = "#CCCAC2", -- fg
  base06 = "#E6E1CF",
  base07 = "#F6F3E8",
  base08 = "#F28779", -- variables
  base09 = "#FFDFB3", -- identifiers
  base0A = "#FFD173", -- functions
  base0B = "#D5FF80", -- strings
  base0C = "#95E6CB", -- regex / special
  base0D = "#73D0FF", -- classes / types
  base0E = "#FFAD66", -- keywords
  base0F = "#FF6666", -- errors
}

M.polish_hl = {
  treesitter = {
    ["@function"] = { fg = M.base_30.orange },
    ["@parameter"] = { fg = M.base_30.dark_purple },
    ["@keyword"] = { fg = M.base_30.yellow },
    ["@type"] = { fg = M.base_30.purple },
    ["@string"] = { fg = M.base_30.green },
    ["@constant"] = { fg = M.base_30.purple },
    ["@comment"] = { fg = M.base_30.light_grey },
    ["@tag"] = { fg = M.base_30.nord_blue },
    ["@constructor"] = { fg = M.base_30.blue },
    ["@operator"] = { fg = M.base_30.orange },
  },
}

M = require("base46").override_theme(M, "ayu_mirage")

M.type = "dark"

return M
