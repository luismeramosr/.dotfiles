-- Table fields in default_config.lua
local M = {}

M.ui = {
  theme = "chadracula",
}

M.options = require("custom.options")
M.mappings = require("custom.mappings")
M.plugins = require("custom.plugins")

return M
