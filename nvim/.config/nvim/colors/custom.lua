-- // Color palette Inspired from gruvbox but toned down to my preferences

local colors = {
  bg = "#32302F",
  bg_alt = "#282828",
  fg = "#EBDBB2",
  yellow = "#FABD2F",
  blue = "#83A598",
  red = "#FB4934",
  green = "#B8BB26",
  orange = "#FE8019",
  purple = "#D3869B",
  cyan = "#8EC07C",
  gray = "#665C54",
  comment = "#7C6F64",
}

-- // Clear existing highlights
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "custom"

local function highlight(group, opts)
  local cmd = "highlight " .. group
  if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
  if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
  if opts.style then cmd = cmd .. " gui=" .. opts.style end
  if opts.sp then cmd = cmd .. " guisp=" .. opts.sp end
  vim.cmd(cmd)
end

-- // Editor highlights
highlight("Normal", { fg = colors.fg, bg = colors.bg })
highlight("NormalFloat", { fg = colors.fg, bg = colors.bg_alt })
highlight("FloatBorder", { fg = colors.yellow, bg = colors.bg_alt })
highlight("ColorColumn", { bg = colors.bg_alt })
highlight("Cursor", { fg = colors.bg, bg = colors.fg })
highlight("CursorLine", { bg = colors.bg_alt })
highlight("CursorColumn", { bg = colors.bg_alt })
highlight("LineNr", { fg = colors.gray })
highlight("CursorLineNr", { fg = colors.yellow, style = "bold" })
highlight("SignColumn", { bg = colors.bg })
highlight("VertSplit", { fg = colors.gray, bg = colors.bg })
highlight("WinSeparator", { fg = colors.gray, bg = colors.bg })

-- // Statusline
highlight("StatusLine", { fg = colors.fg, bg = colors.bg_alt })
highlight("StatusLineNC", { fg = colors.gray, bg = colors.bg_alt })

-- // Tabline
highlight("TabLine", { fg = colors.gray, bg = colors.bg_alt })
highlight("TabLineFill", { bg = colors.bg_alt })
highlight("TabLineSel", { fg = colors.bg, bg = colors.yellow })

-- // Popup menu
highlight("Pmenu", { fg = colors.fg, bg = colors.bg_alt })
highlight("PmenuSel", { fg = colors.bg, bg = colors.yellow })
highlight("PmenuSbar", { bg = colors.bg_alt })
highlight("PmenuThumb", { bg = colors.gray })

-- // Search
highlight("Search", { fg = colors.bg, bg = colors.yellow })
highlight("IncSearch", { fg = colors.bg, bg = colors.yellow })
highlight("CurSearch", { fg = colors.bg, bg = colors.yellow, style = "bold" })

-- // Visual
highlight("Visual", { bg = colors.gray })
highlight("VisualNOS", { bg = colors.gray })

-- // Folds
highlight("Folded", { fg = colors.gray, bg = colors.bg_alt })
highlight("FoldColumn", { fg = colors.gray, bg = colors.bg })

-- // Diff
highlight("DiffAdd", { fg = colors.green, bg = colors.bg })
highlight("DiffChange", { fg = colors.blue, bg = colors.bg })
highlight("DiffDelete", { fg = colors.red, bg = colors.bg })
highlight("DiffText", { fg = colors.yellow, bg = colors.bg })

-- // Messages
highlight("ErrorMsg", { fg = colors.red, style = "bold" })
highlight("WarningMsg", { fg = colors.yellow, style = "bold" })
highlight("ModeMsg", { fg = colors.yellow, style = "bold" })
highlight("MoreMsg", { fg = colors.blue })
highlight("Question", { fg = colors.blue })

-- // Syntax highlighting
highlight("Comment", { fg = colors.comment, style = "italic" })
highlight("Constant", { fg = colors.purple })
highlight("String", { fg = colors.green })
highlight("Character", { fg = colors.green })
highlight("Number", { fg = colors.purple })
highlight("Boolean", { fg = colors.purple })
highlight("Float", { fg = colors.purple })

highlight("Identifier", { fg = colors.blue })
highlight("Function", { fg = colors.yellow, style = "bold" })

highlight("Statement", { fg = colors.red })
highlight("Conditional", { fg = colors.red })
highlight("Repeat", { fg = colors.red })
highlight("Label", { fg = colors.red })
highlight("Operator", { fg = colors.fg })
highlight("Keyword", { fg = colors.red })
highlight("Exception", { fg = colors.red })

highlight("PreProc", { fg = colors.blue })
highlight("Include", { fg = colors.blue })
highlight("Define", { fg = colors.blue })
highlight("Macro", { fg = colors.blue })
highlight("PreCondit", { fg = colors.blue })

highlight("Type", { fg = colors.yellow })
highlight("StorageClass", { fg = colors.orange })
highlight("Structure", { fg = colors.blue })
highlight("Typedef", { fg = colors.yellow })

highlight("Special", { fg = colors.orange })
highlight("SpecialChar", { fg = colors.orange })
highlight("Tag", { fg = colors.blue })
highlight("Delimiter", { fg = colors.fg })
highlight("SpecialComment", { fg = colors.gray, style = "italic" })
highlight("Debug", { fg = colors.red })

highlight("Underlined", { style = "underline" })
highlight("Ignore", { fg = colors.gray })
highlight("Error", { fg = colors.red, style = "bold,underline" })
highlight("Todo", { fg = colors.bg, bg = colors.yellow, style = "bold" })

-- Treesitter
highlight("@variable", { fg = colors.fg })
highlight("@variable.builtin", { fg = colors.purple })
highlight("@variable.parameter", { fg = colors.fg })
highlight("@variable.member", { fg = colors.blue })

highlight("@constant", { fg = colors.purple })
highlight("@constant.builtin", { fg = colors.purple })
highlight("@constant.macro", { fg = colors.purple })

highlight("@string", { fg = colors.green })
highlight("@string.escape", { fg = colors.orange })
highlight("@string.special", { fg = colors.orange })

highlight("@character", { fg = colors.green })
highlight("@number", { fg = colors.purple })
highlight("@boolean", { fg = colors.purple })
highlight("@float", { fg = colors.purple })

highlight("@function", { fg = colors.yellow, style = "bold" })
highlight("@function.builtin", { fg = colors.yellow })
highlight("@function.macro", { fg = colors.blue })
highlight("@function.call", { fg = colors.yellow })
highlight("@method", { fg = colors.yellow })
highlight("@method.call", { fg = colors.yellow })

highlight("@constructor", { fg = colors.yellow })
highlight("@parameter", { fg = colors.fg })

highlight("@keyword", { fg = colors.red })
highlight("@keyword.function", { fg = colors.red })
highlight("@keyword.operator", { fg = colors.red })
highlight("@keyword.return", { fg = colors.red })

highlight("@conditional", { fg = colors.red })
highlight("@repeat", { fg = colors.red })
highlight("@label", { fg = colors.red })
highlight("@operator", { fg = colors.fg })
highlight("@exception", { fg = colors.red })

highlight("@type", { fg = colors.yellow })
highlight("@type.builtin", { fg = colors.yellow })
highlight("@type.qualifier", { fg = colors.red })

highlight("@property", { fg = colors.blue })
highlight("@field", { fg = colors.blue })

highlight("@punctuation.delimiter", { fg = colors.fg })
highlight("@punctuation.bracket", { fg = colors.fg })
highlight("@punctuation.special", { fg = colors.orange })

highlight("@comment", { fg = colors.comment, style = "italic" })
highlight("@tag", { fg = colors.blue })
highlight("@tag.attribute", { fg = colors.yellow })
highlight("@tag.delimiter", { fg = colors.fg })

-- // LSP
highlight("DiagnosticError", { fg = colors.red })
highlight("DiagnosticWarn", { fg = colors.yellow })
highlight("DiagnosticInfo", { fg = colors.blue })
highlight("DiagnosticHint", { fg = colors.cyan })

highlight("DiagnosticUnderlineError", { sp = colors.red, style = "underline" })
highlight("DiagnosticUnderlineWarn", { sp = colors.yellow, style = "underline" })
highlight("DiagnosticUnderlineInfo", { sp = colors.blue, style = "underline" })
highlight("DiagnosticUnderlineHint", { sp = colors.cyan, style = "underline" })

-- // Git signs
highlight("GitSignsAdd", { fg = colors.green })
highlight("GitSignsChange", { fg = colors.blue })
highlight("GitSignsDelete", { fg = colors.red })

-- // Telescope
highlight("TelescopeBorder", { fg = colors.yellow, bg = colors.bg_alt })
highlight("TelescopeSelection", { fg = colors.bg, bg = colors.yellow })
highlight("TelescopeSelectionCaret", { fg = colors.yellow })
highlight("TelescopeMatching", { fg = colors.blue, style = "bold" })

-- // Which-key
highlight("WhichKey", { fg = colors.yellow })
highlight("WhichKeyGroup", { fg = colors.blue })
highlight("WhichKeyDesc", { fg = colors.fg })
highlight("WhichKeySeparator", { fg = colors.gray })

-- // NeoTree
highlight("NeoTreeNormal", { fg = colors.fg, bg = colors.bg_alt })
highlight("NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg_alt })
highlight("NeoTreeDirectoryIcon", { fg = colors.blue })
highlight("NeoTreeDirectoryName", { fg = colors.blue })
highlight("NeoTreeFileName", { fg = colors.fg })
highlight("NeoTreeFileNameOpened", { fg = colors.yellow })
highlight("NeoTreeGitAdded", { fg = colors.green })
highlight("NeoTreeGitModified", { fg = colors.yellow })
highlight("NeoTreeGitDeleted", { fg = colors.red })

-- // Bufferline
highlight("BufferLineFill", { bg = colors.bg_alt })
highlight("BufferLineBackground", { fg = colors.gray, bg = colors.bg_alt })
highlight("BufferLineBufferSelected", { fg = colors.fg, bg = colors.bg, style = "bold" })
highlight("BufferLineIndicatorSelected", { fg = colors.yellow, bg = colors.bg })
