-- // Color palette Monochrome dark - subtle distinguishable accents

local colors = {
  bg = "NONE",
  bg_alt = "#0d0f10",
  fg = "#9a9588",
  fg_light = "#bbb49d",
  yellow = "#a89f84",
  blue = "#6e7065",
  red = "#5c5850",
  green = "#7a786d",
  orange = "#c4beab",
  purple = "#8a8577",
  cyan = "#9a9588",
  gray = "#3a3d3f",
  comment = "#4a4d50",
  white = "#c4beab",
  black = "#0d0f10",
}

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "Mhiatic-Monochrome"

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
highlight("FloatBorder", { fg = colors.fg_light, bg = colors.bg_alt })
highlight("ColorColumn", { bg = colors.bg_alt })
highlight("Cursor", { fg = colors.black, bg = colors.fg_light })
highlight("CursorLine", { bg = colors.bg_alt })
highlight("CursorColumn", { bg = colors.bg_alt })
highlight("LineNr", { fg = colors.gray })
highlight("CursorLineNr", { fg = colors.fg_light, style = "bold" })
highlight("SignColumn", { bg = colors.bg })
highlight("VertSplit", { fg = colors.gray, bg = colors.bg })
highlight("WinSeparator", { fg = colors.gray, bg = colors.bg })

-- // Statusline
highlight("StatusLine", { fg = colors.fg, bg = colors.bg_alt })
highlight("StatusLineNC", { fg = colors.gray, bg = colors.bg_alt })

-- // Tabline
highlight("TabLine", { fg = colors.gray, bg = colors.bg_alt })
highlight("TabLineFill", { bg = colors.bg_alt })
highlight("TabLineSel", { fg = colors.black, bg = colors.fg_light })

-- // Popup menu
highlight("Pmenu", { fg = colors.fg, bg = colors.bg_alt })
highlight("PmenuSel", { fg = colors.black, bg = colors.fg_light })
highlight("PmenuSbar", { bg = colors.bg_alt })
highlight("PmenuThumb", { bg = colors.gray })

-- // Search
highlight("Search", { fg = colors.black, bg = colors.fg_light })
highlight("IncSearch", { fg = colors.black, bg = colors.fg_light })
highlight("CurSearch", { fg = colors.black, bg = colors.fg_light, style = "bold" })

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
highlight("DiffText", { fg = colors.fg_light, bg = colors.bg })

-- // Messages
highlight("ErrorMsg", { fg = colors.red, style = "bold" })
highlight("WarningMsg", { fg = colors.yellow, style = "bold" })
highlight("ModeMsg", { fg = colors.fg_light, style = "bold" })
highlight("MoreMsg", { fg = colors.blue })
highlight("Question", { fg = colors.blue })

-- // Syntax highlighting
highlight("Comment", { fg = colors.comment, style = "italic" })
highlight("Constant", { fg = colors.orange })
highlight("String", { fg = colors.green })
highlight("Character", { fg = colors.green })
highlight("Number", { fg = colors.orange })
highlight("Boolean", { fg = colors.orange })
highlight("Float", { fg = colors.orange })

highlight("Identifier", { fg = colors.fg })
highlight("Function", { fg = colors.fg_light, style = "bold" })

highlight("Statement", { fg = colors.purple })
highlight("Conditional", { fg = colors.purple })
highlight("Repeat", { fg = colors.purple })
highlight("Label", { fg = colors.purple })
highlight("Operator", { fg = colors.fg })
highlight("Keyword", { fg = colors.purple })
highlight("Exception", { fg = colors.purple })

highlight("PreProc", { fg = colors.blue })
highlight("Include", { fg = colors.blue })
highlight("Define", { fg = colors.blue })
highlight("Macro", { fg = colors.blue })
highlight("PreCondit", { fg = colors.blue })

highlight("Type", { fg = colors.yellow })
highlight("StorageClass", { fg = colors.yellow })
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
highlight("Todo", { fg = colors.black, bg = colors.fg_light, style = "bold" })

-- Treesitter
highlight("@variable", { fg = colors.fg })
highlight("@variable.builtin", { fg = colors.orange })
highlight("@variable.parameter", { fg = colors.fg })
highlight("@variable.member", { fg = colors.blue })

highlight("@constant", { fg = colors.orange })
highlight("@constant.builtin", { fg = colors.orange })
highlight("@constant.macro", { fg = colors.orange })

highlight("@string", { fg = colors.green })
highlight("@string.escape", { fg = colors.orange })
highlight("@string.special", { fg = colors.orange })

highlight("@character", { fg = colors.green })
highlight("@number", { fg = colors.orange })
highlight("@boolean", { fg = colors.orange })
highlight("@float", { fg = colors.orange })

highlight("@function", { fg = colors.fg_light, style = "bold" })
highlight("@function.builtin", { fg = colors.fg_light })
highlight("@function.macro", { fg = colors.blue })
highlight("@function.call", { fg = colors.fg_light })
highlight("@method", { fg = colors.fg_light })
highlight("@method.call", { fg = colors.fg_light })

highlight("@constructor", { fg = colors.fg_light })
highlight("@parameter", { fg = colors.fg })

highlight("@keyword", { fg = colors.purple })
highlight("@keyword.function", { fg = colors.purple })
highlight("@keyword.operator", { fg = colors.purple })
highlight("@keyword.return", { fg = colors.purple })

highlight("@conditional", { fg = colors.purple })
highlight("@repeat", { fg = colors.purple })
highlight("@label", { fg = colors.purple })
highlight("@operator", { fg = colors.fg })
highlight("@exception", { fg = colors.purple })

highlight("@type", { fg = colors.yellow })
highlight("@type.builtin", { fg = colors.yellow })
highlight("@type.qualifier", { fg = colors.purple })

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
highlight("DiagnosticHint", { fg = colors.gray })

highlight("DiagnosticUnderlineError", { sp = colors.red, style = "underline" })
highlight("DiagnosticUnderlineWarn", { sp = colors.yellow, style = "underline" })
highlight("DiagnosticUnderlineInfo", { sp = colors.blue, style = "underline" })
highlight("DiagnosticUnderlineHint", { sp = colors.gray, style = "underline" })

-- // Git signs
highlight("GitSignsAdd", { fg = colors.green })
highlight("GitSignsChange", { fg = colors.blue })
highlight("GitSignsDelete", { fg = colors.red })

-- // Telescope
highlight("TelescopeBorder", { fg = colors.fg_light, bg = colors.bg_alt })
highlight("TelescopeSelection", { fg = colors.black, bg = colors.fg_light })
highlight("TelescopeSelectionCaret", { fg = colors.fg_light })
highlight("TelescopeMatching", { fg = colors.blue, style = "bold" })

-- // Which-key
highlight("WhichKey", { fg = colors.fg_light })
highlight("WhichKeyGroup", { fg = colors.blue })
highlight("WhichKeyDesc", { fg = colors.fg })
highlight("WhichKeySeparator", { fg = colors.gray })

-- // NeoTree
highlight("NeoTreeNormal", { fg = colors.fg, bg = colors.bg_alt })
highlight("NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg_alt })
highlight("NeoTreeDirectoryIcon", { fg = colors.blue })
highlight("NeoTreeDirectoryName", { fg = colors.blue })
highlight("NeoTreeFileName", { fg = colors.fg })
highlight("NeoTreeFileNameOpened", { fg = colors.fg_light })
highlight("NeoTreeGitAdded", { fg = colors.green })
highlight("NeoTreeGitModified", { fg = colors.yellow })
highlight("NeoTreeGitDeleted", { fg = colors.red })

-- // Bufferline
highlight("BufferLineFill", { bg = colors.bg_alt })
highlight("BufferLineBackground", { fg = colors.gray, bg = colors.bg_alt })
highlight("BufferLineBufferSelected", { fg = colors.fg, bg = colors.bg, style = "bold" })
highlight("BufferLineIndicatorSelected", { fg = colors.fg_light, bg = colors.bg })
