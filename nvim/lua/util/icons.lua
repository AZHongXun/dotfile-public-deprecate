local M = {}

M.diagnostic_signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = "",
}

-- cmp icon
M.kinds = {
  Array = " ",
  Boolean = "󰨙 ",
  Class = " ",
  Color = " ",
  Control = " ",
  Constant = "󰏿 ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = "󰡱 ",
  Interface = " ",
  Key = " ",
  Keyword = " ",
  Method = "󰊕 ",
  Module = " ",
  Namespace = "󰦮 ",
  Null = " ",
  Number = "󰎠 ",
  Object = " ",
  Operator = " ",
  Package = " ",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  String = " ",
  Struct = "󰆼 ",
  Text = " ",
  TypeParameter = " ",
  Unit = " ",
  Value = " ",
  Variable = "󰀫 ",
}

M.ui = {
  -- lazy
  Cmdline = " ",
  File = "󰧮 ",
  Gear = " ",
  Import = "󰋺 ",
  Runtime = "󰄉 ",
  -- telescope
  ChevronRight = " ",
  Search = "  ",
  -- noice
  FindUp = "󰮗  ",
  FindDown = "󰮗  "
}
return M
