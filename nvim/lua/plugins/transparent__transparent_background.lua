if vim.fn.has("gui_running") == 1 then
  return {}
end

return {
  "xiyaowong/transparent.nvim",
  opts = function()
    require("transparent").setup({ -- Optional, you don't have to run setup.
      groups = { -- table: default groups
        "ToggleTerm",
        "ToggleTermBorder",
        "WinSeparator",
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLine",
        "CursorLineNr",
        "EndOfBuffer",
        "NotifyINFOBody",
        "NotifyINFOBorder",
        "NotifyINFOBody4",
        "NotifyINFOBorder4",
        "NotifyTRACEBody",
        "NotifyTRACEBorder",
        "NotifyDEBUGBody",
        "NotifyDEBUGBorder",
        "NotifyERRORBody",
        "NotifyERRORBorder",
        "NotifyWARNBody",
        "NotifyWARNBorder",
        "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
        "MarkviewBlockQuoteWarn",
        "MarkviewBlockQuoteSpecial",
        "MarkviewBlockQuoteNote",
        "MarkviewBlockQuoteDefault",
        "MarkviewBlockQuoteOk",
        "MarkviewBlockQuoteError",
        "MarkviewLatexSubscript",
        "MarkviewLatexSuperscript",
      },
      extra_groups = {
        "MarkviewLatexSubscript",
        "MarkviewLatexSuperscript",
        "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
        "WinSeparator",
        "NvimTreeNormal", -- NvimTree
        "NeoTreeNormal",
        "NeoTreeFloatBorder",
        "NeoTreeNormalNC",
        "TelescopeNormal",
        "TelescopeBorder",
        "NotifyBackground",
        "StatusLineNC",
        "StatusLine",
      },
      exclude_groups = {}, -- table: groups you don't want to clear
    })
    require("transparent").clear_prefix("MarkviewL")
  end,
}
