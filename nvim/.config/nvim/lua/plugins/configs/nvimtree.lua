local present, nvimtree = pcall(require, "nvim-tree")

if not present then
   return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback
require("base46").load_highlight "nvimtree"

local options = {
   filters = {
      dotfiles = false,
      exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
   },
   disable_netrw = true,
   hijack_netrw = true,
   open_on_tab = false,
   hijack_cursor = false,
   ignore_ft_on_setup = { "alpha" },
   hijack_unnamed_buffer_when_opening = false,
   update_cwd = true,
   update_focused_file = {
      enable = false,
      update_cwd = false,
      ignore_list = {},
   },
   view = {
     width = 30,
     height = 30,
     hide_root_folder = false,
     side = "left",
     mappings = {
       custom_only = false,
       list = {
         { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
         { key = "h", cb = tree_cb "close_node" },
         { key = "v", cb = tree_cb "vsplit" },
       },
    },
    number = false,
    relativenumber = false,
    adaptive_size = true,
   },
   git = {
      enable = false,
      ignore = true,
   },
   filesystem_watchers = {
      enable = true,
    },
   actions = {
      open_file = {
         resize_window = true,
      },
   },
   renderer = {
      highlight_git = false,
      highlight_opened_files = "none",

      indent_markers = {
         enable = false,
      },

      icons = {
         show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
         },

         glyphs = {
            default = "",
            symlink = "",
            folder = {
               default = "",
               empty = "",
               empty_open = "",
               open = "",
               symlink = "",
               symlink_open = "",
               arrow_open = "",
               arrow_closed = "",
            },
            git = {
               unstaged = "✗",
               staged = "✓",
               unmerged = "",
               renamed = "➜",
               untracked = "★",
               deleted = "",
               ignored = "◌",
            },
         },
      },
   },
  open_on_setup = false,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
}

-- check for any override
options = require("core.utils").load_override(options, "kyazdani42/nvim-tree.lua")

nvimtree.setup(options)
