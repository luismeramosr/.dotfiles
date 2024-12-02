-- This file initializes the configuration for the Lua environment.
-- It requires various modules to set up the environment properly.
Util = require("util") -- Require the utility module
-- Load settings for the environment
require("settings")
-- Setup key mappings
require("keymap")
-- Configure diagnostics settings
require("diagnostics")
-- Load plugins for enhanced functionality
require("plugins")
-- Configure completion settings with cmp
require("cmp_conf")
-- Define custom autocmds to enhance behavior
require("autocmd")
