return {
  diagnostics = {
    error = "",
    warn = "",
    hint = "",
    info = "",
  },
  git = {
    added = "",
    modified = "",
    removed = "",
    renamed = "➜",
    untracked = "",
    ignored = "",
    unstaged = "U",
    staged = "",
    conflict = "",
    deleted = "",
  },
  gitsigns = {
    add = "┃",
    change = "┋",
    delete = "",
    topdelhfe = "",
    changedelete = "┃",
    untracked = "┃",
  },
  kinds = {
    Array = "",
    Boolean = "",
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Copilot = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Key = "",
    Keyword = "",
    Method = "",
    Module = "",
    Namespace = "",
    Null = "",
    Number = "",
    Object = "",
    Operator = "",
    Package = "",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
    Macro = "", -- Macro
  },
  borders = {
    --- @class BorderIcons
    single = {
      top = "─",
      right = "│",
      bottom = "─",
      left = "│",
      top_left = "╭",
      top_right = "╮",
      bottom_right = "╯",
      bottom_left = "╰",
    },
    double = {
      top = '═',
      right = "║",
      bottom = '═',
      left = "║",
      top_left = "╔",
      top_right = "╗",
      bottom_right = "╝",
      bottom_left = "╚",
    },
    --- @class BorderIcons
    thin = {
      top = "▔",
      right = "▕",
      bottom = "▁",
      left = "▏",
      top_left = "🭽",
      top_right = "🭾",
      bottom_right = "🭿",
      bottom_left = "🭼",
    },
    ---@type BorderIcons
    empty = {
      top = " ",
      right = " ",
      bottom = " ",
      left = " ",
      top_left = " ",
      top_right = " ",
      bottom_right = " ",
      bottom_left = " ",
    },
    ---@type BorderIcons
    thick = {
      top = "▄",
      right = "█",
      bottom = "▀",
      left = "█",
      top_left = "▄",
      top_right = "▄",
      bottom_right = "▀",
      bottom_left = "▀",
    },
  },
  misc = {
    codeium = "󰘦 ",
  },
}
