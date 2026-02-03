-- This file handles themes. You can comment and uncomment the theme you dont want to use or want to use respectively, also you can add your custom themes in similar format

return {
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	priority = 2000,
	lazy = false,
	config = function()
		require("gruvbox").setup({
			contrast = "hard", -- soft | medium | hard
			transparent_mode = true,
			terminal_colors = true,
			italic = {
				strings = false,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			bold = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			undercurl = true,
			underline = true,
			dim_inactive = false,
		})

		vim.cmd.colorscheme("gruvbox")

		-- Gruvbox dark palette (hard)
		local gb = {
			bg0   = "#1d2021",
			bg1   = "#282828",
			bg2   = "#32302f",
			bg3   = "#3c3836",
			fg0   = "#fbf1c7",
			fg1   = "#ebdbb2",
			fg2   = "#d5c4a1",
			red   = "#fb4934",
			green = "#b8bb26",
			yellow= "#fabd2f",
			blue  = "#83a598",
			purple= "#d3869b",
			aqua  = "#8ec07c",
			gray  = "#928374",
			orange= "#fe8019",
		}

		-- Telescope
		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = gb.bg3, bg = gb.bg1 })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = gb.fg1, bg = gb.bg1 })
		vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = gb.yellow, bg = gb.bg2, bold = true })
		vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = gb.orange, bg = gb.bg2 })
		vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = gb.fg1, bg = gb.bg3 })

		vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = gb.bg0, bg = gb.green, bold = true })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = gb.bg0, bg = gb.blue, bold = true })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = gb.bg0, bg = gb.purple, bold = true })

		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = gb.fg1, bg = gb.bg2 })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = gb.bg2, bg = gb.bg2 })

		-- Neo-tree transparency
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
	end,
}


--[[
-- Catppuccin theme
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 2000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = false,
			term_colors = true,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = { "bold" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},

			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = false,
				neotree = true,
				telescope = true,
				which_key = true,
				notify = true,
				mini = true,
				treesitter = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")

		local cp = require("catppuccin.palettes").get_palette("mocha")

		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = cp.surface2, bg = cp.surface0 })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = cp.text, bg = cp.surface0 })
		vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = cp.lavender, bg = cp.surface1 })
		vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = cp.pink, bg = cp.surface1 })
		vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = cp.text, bg = cp.surface2 })

		vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = cp.crust, bg = cp.mauve })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = cp.crust, bg = cp.sky })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = cp.crust, bg = cp.lavender })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = cp.text, bg = cp.surface1 })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = cp.surface1, bg = cp.surface1 })

		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
	end,
}
]]

--[[
-- Rose Pine theme
return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 2000,
  lazy = false,
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      dark_variant = "moon",

      highlight_groups = {
            NeoTreeFileName = { fg = "love" },
            NeoTreeFileIcon = { fg = "love" },
            NeoTreeDirectoryName = { fg = "iris" },
            NeoTreeDirectoryIcon = { fg = "iris" },
            NeoTreeNormal = { fg = "love", bg = "base" },
            NeoTreeNormalNC = { fg = "love", bg = "base" },
            NeoTreeWinSeparator = { fg = "highlight_med", bg = "none" },
            NeoTreeGitUntracked = { fg = "iris" },
            NeoTreeGitModified = { fg = "love" },
            NeoTreeGitAdded = { fg = "foam" },
            NeoTreeGitDeleted = { fg = "love" },

            TelescopeBorder = { fg = "overlay", bg = "overlay" },
            TelescopeNormal = { fg = "subtle", bg = "overlay" },
            TelescopeSelection = { fg = "text", bg = "highlight_med" },
            TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
            TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

            TelescopeTitle = { fg = "base", bg = "love" },
            TelescopePromptTitle = { fg = "base", bg = "pine" },
            TelescopePreviewTitle = { fg = "base", bg = "iris" },
            TelescopePromptNormal = { fg = "text", bg = "surface" },
            TelescopePromptBorder = { fg = "surface", bg = "surface" },
      }
    })
    vim.cmd("colorscheme rose-pine")
  end,
}
]]

--[[
-- Tokyo Night theme
return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  priority = 2000,
  lazy = false,
  config = function()
    require("tokyonight").setup({
      style = "moon",
      transparent = false,
      styles = {
        sidebars = "dark",
        floats = "dark",
      },

      on_highlights = function(hl, c)
        hl.NeoTreeFileName = { fg = c.blue }
        hl.NeoTreeFileIcon = { fg = c.blue }
        hl.NeoTreeDirectoryName = { fg = c.magenta }
        hl.NeoTreeDirectoryIcon = { fg = c.magenta }
        hl.NeoTreeNormal = { fg = c.fg, bg = c.bg_dark }
        hl.NeoTreeNormalNC = { fg = c.fg, bg = c.bg_dark }
        hl.NeoTreeWinSeparator = { fg = c.border_highlight, bg = "none" }
        hl.NeoTreeGitUntracked = { fg = c.magenta }
        hl.NeoTreeGitModified = { fg = c.orange }
        hl.NeoTreeGitAdded = { fg = c.green }
        hl.NeoTreeGitDeleted = { fg = c.red }

        hl.TelescopeBorder = { fg = c.border_highlight, bg = c.bg_dark }
        hl.TelescopeNormal = { fg = c.fg_dark, bg = c.bg_dark }
        hl.TelescopeSelection = { fg = c.fg, bg = c.bg_highlight }
        hl.TelescopeSelectionCaret = { fg = c.blue, bg = c.bg_highlight }
        hl.TelescopeMultiSelection = { fg = c.fg, bg = c.bg_visual }

        hl.TelescopeTitle = { fg = c.bg, bg = c.blue }
        hl.TelescopePromptTitle = { fg = c.bg, bg = c.magenta }
        hl.TelescopePreviewTitle = { fg = c.bg, bg = c.cyan }
        hl.TelescopePromptNormal = { fg = c.fg, bg = c.bg_dark }
        hl.TelescopePromptBorder = { fg = c.bg_dark, bg = c.bg_dark }
      end,
    })
    vim.cmd("colorscheme tokyonight")
  end,
}
]]
