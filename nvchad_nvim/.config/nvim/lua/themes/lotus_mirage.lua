
-- lotus_mirage.lua
-- A custom theme combining elements of Kanagawa Lotus and Ayu Mirage

local M = {}

-- UI colors for NvChad (base_30)
M.base_30 = {
  white        = "#D6DEEB", -- light foreground (Ayu Mirage)
  black        = "#0F1419", -- main background (Ayu Mirage)
  darker_black = "#0A0E11", -- ~6% darker than black
  black2       = "#151A20", -- slightly lighter than black
  one_bg       = "#1C222A", -- ~10% lighter than black
  one_bg2      = "#232A34", -- secondary background
  one_bg3      = "#2A323D", -- tertiary background
  grey         = "#3A4149", -- ~40% lighter than black
  grey_fg      = "#424A52", -- foreground grey
  grey_fg2     = "#4A525A", -- lighter grey
  light_grey   = "#50585F", -- for subtle UI elements
  red          = "#FF6188", -- vibrant red (Ayu Mirage)
  baby_pink    = "#F8A0C2", -- soft pink accent (Kanagawa Lotus influence)
  pink         = "#FF87AB", -- vivid pink accent
  line         = "#2B323A", -- divider lines
  green        = "#7BD88F", -- fresh green accent (Ayu Mirage)
  vibrant_green= "#98D89F", -- brighter green accent
  nord_blue    = "#81A1C1", -- cool blue tone
  blue         = "#7DA6FF", -- soft blue (Kanagawa Lotus)
  seablue      = "#89DDFF", -- bright sea blue accent
  yellow       = "#FFB62C", -- warm yellow (Ayu Mirage)
  sun          = "#F9D67A", -- lighter yellow accent
  purple       = "#C792EA", -- purple (Ayu Mirage)
  dark_purple  = "#A9A1E1", -- deeper purple (Kanagawa influence)
  teal         = "#56B6C2", -- cool teal accent
  orange       = "#D19A66", -- muted orange/brown accent
  cyan         = "#89DDFF", -- reused seablue as cyan
  statusline_bg= "#1C222A", -- background for statusline
  lightbg      = "#232A34", -- lighter background for panels
  pmenu_bg     = "#5E81AC", -- popup menu background (blue accent)
  folder_bg    = "#61AFEF", -- folder icon color (bright blue)
}

-- Syntax colors following Base16 conventions (base_16)
M.base_16 = {
  base00 = "#0F1419", -- Background
  base01 = "#1C222A", -- Lighter Background (Used for status bars)
  base02 = "#232A34", -- Selection Background
  base03 = "#2A323D", -- Comments, Invisibles, Line Highlighting
  base04 = "#3A4149", -- Dark Foreground (Used for status bars)
  base05 = "#D6DEEB", -- Default Foreground, Caret, Delimiters, Operators
  base06 = "#E5E9F0", -- Light Foreground (Not often used)
  base07 = "#FFFFFF", -- Light Background (Not often used)
  base08 = "#FF6188", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = "#FFB62C", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = "#F9D67A", -- Classes, Markup Bold, Search Text Background
  base0B = "#7BD88F", -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = "#56B6C2", -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = "#7DA6FF", -- Functions, Methods, Attribute IDs, Headings
  base0E = "#C792EA", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = "#D19A66", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
}

-- Optional overrides for specific highlight groups
M.polish_hl = {
  defaults = {
    Comment = {
      fg = M.base_30.grey_fg,
      italic = true,
    },
    -- You can add more global highlight tweaks here
  },
  treesitter = {
    ["@variable"]  = { fg = M.base_30.white },
    ["@function"]  = { fg = M.base_30.blue },
    ["@keyword"]   = { fg = M.base_30.red, bold = true },
    ["@string"]    = { fg = M.base_30.green },
    ["@constant"]  = { fg = M.base_30.orange },
  },
}

M.type = "dark" -- Dark theme

-- Allow user overrides with base46
M = require("base46").override_theme(M, "lotus_mirage")
return M

