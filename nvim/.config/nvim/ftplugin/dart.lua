local utils = require("core.utils")
local M = {}

M.dart = {
  n = {
    ["<leader>f"] = { "<cmd> :DartFmt <CR>", "Format Dart code "},
  }
}

utils.load_mappings(M)
