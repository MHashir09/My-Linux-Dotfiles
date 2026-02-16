---@meta
-------------------------------------------------------------------------------
-- OXWM Configuration File
-------------------------------------------------------------------------------
-- Dynamic window manager configuration for OxWM
-- Reload with Mod+Shift+R (no compilation needed)
-------------------------------------------------------------------------------

---Load type definitions for LSP
---@module 'oxwm'

-------------------------------------------------------------------------------
-- VARIABLES
-------------------------------------------------------------------------------

-- Modifier keys
local modkey = "Mod4"   -- Super/Windows key
local modkey2 = "Mod1"  -- Alt key

-- Terminal emulator
local terminal = "kitty"

-- Color palette (Gruvbox pastel/bright variant)
local colors = {
    -- Backgrounds
    bg = "#1D2021",

    -- Foregrounds
    fg = "#C6A77E",
    fg_light = "#f2e5bc",

    -- Gruvbox colors (pastel/brighter)
    red = "#fb4934",
    light_red = "#ff6b5a",
    green = "#b8bb26",
    light_green = "#d4d987",
    yellow = "#fabd2f",
    light_yellow = "#ffdb6e",
    blue = "#83a598",
    light_blue = "#a0c4d9",
    purple = "#d3869b",
    light_purple = "#e7a9c0",
    aqua = "#8ec07c",
    light_aqua = "#a8dda2",
    orange = "#fe8019",
    light_orange = "#ffa157",

    -- Grays
    grey = "#a89984",
    light_grey = "#bdae93",

    -- Aliases
    cyan = "#a8dda2",
    lavender = "#e7a9c0",
}

-- Workspace tags
local tags = { " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 " }

-- Status bar font
local bar_font = "JetBrainsMono Nerd Font:style=Bold:size=11"

-------------------------------------------------------------------------------
-- STATUS BAR BLOCKS
-------------------------------------------------------------------------------

local blocks = {
    -- RAM usage
    oxwm.bar.block.ram({
        format = "Ram: {used}/{total} GB",
        interval = 5,
        color = colors.fg,
        underline = false,
    }),

    -- Separator
    oxwm.bar.block.static({
        text = "  │  ",
        interval = 999999999,
        color = colors.light_grey,
        underline = false,
    }),

    -- Kernel version
    oxwm.bar.block.shell({
        format = "OS: {}",
        command = "uname -r",
        interval = 999999999,
        color = colors.fg,
        underline = false,
    }),

    -- Separator
    oxwm.bar.block.static({
        text = "  │  ",
        interval = 999999999,
        color = colors.light_grey,
        underline = false,
    }),

    -- Battery status
    oxwm.bar.block.battery({
        format = "Battery: {}%",
        charging = "⚡ Charging: {}%",
        discharging = "Battery: {}%",
        full = "✓ Charged: {}%",
        interval = 30,
        color = colors.fg,
        underline = false,
    }),

    -- Separator
    oxwm.bar.block.static({
        text = "  │  ",
        interval = 999999999,
        color = colors.light_grey,
        underline = false,
    }),

    -- Date and time
    oxwm.bar.block.datetime({
        format = "Date: {}  ",
        date_format = "%a, %b %d - %I:%M %p",
        interval = 1,
        color = colors.fg,
        underline = false,
    }),

}

-------------------------------------------------------------------------------
-- BASIC SETTINGS
-------------------------------------------------------------------------------

oxwm.set_terminal(terminal)
oxwm.set_modkey(modkey)
oxwm.set_tags(tags)

-------------------------------------------------------------------------------
-- LAYOUTS
-------------------------------------------------------------------------------

oxwm.set_layout_symbol("tiling", " [T] ")
oxwm.set_layout_symbol("normie", " [F] ")
oxwm.set_layout_symbol("tabbed", " [=] ")

-------------------------------------------------------------------------------
-- APPEARANCE
-------------------------------------------------------------------------------

-- Window borders
oxwm.border.set_width(0)
oxwm.border.set_focused_color(colors.light_yellow)
oxwm.border.set_unfocused_color(colors.grey)

-- Gaps
oxwm.gaps.set_smart(false)  -- No gaps if only 1 window
oxwm.gaps.set_inner(1, 1)  -- Horizontal, Vertical
oxwm.gaps.set_outer(1, 1)  -- Horizontal, Vertical

-------------------------------------------------------------------------------
-- STATUS BAR
-------------------------------------------------------------------------------

oxwm.bar.set_font(bar_font)
oxwm.bar.set_blocks(blocks)

-- Bar color schemes
oxwm.bar.set_scheme_normal(colors.fg, colors.bg, colors.bg)           -- Unoccupied tags
oxwm.bar.set_scheme_occupied(colors.fg_light, colors.bg, colors.bg)       -- Occupied tags
oxwm.bar.set_scheme_selected(colors.orange, colors.bg, colors.bg)     -- Selected tag
oxwm.bar.set_scheme_urgent(colors.fg_light, colors.bg, colors.bg)          -- Urgent tags

-------------------------------------------------------------------------------
-- WINDOW RULES
-------------------------------------------------------------------------------

oxwm.rule.add({ class = "kitty", tag = 2, fullscreen = true })
oxwm.rule.add({ class = "Helium", tag = 1 })
oxwm.rule.add({ class = "vesktop", tag = 3 })
oxwm.rule.add({ class = "org.gnome.Nautilus", tag = 4 })

-------------------------------------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------------------------------------

-- Applications
oxwm.key.bind({ modkey }, "Return", oxwm.spawn_terminal())
oxwm.key.bind({ modkey }, "B", oxwm.spawn("helium-browser"))
oxwm.key.bind({ modkey }, "E", oxwm.spawn("nautilus"))
oxwm.key.bind({ modkey }, "D", oxwm.spawn("vesktop"))

-- Rofi Keybinds
oxwm.key.bind({ modkey, modkey2 }, "Space", oxwm.spawn(
    { "sh", "-c", "rofi -show codeverse -modi 'codeverse:~/.config/rofi/scripts/main-menu.sh'" }))
oxwm.key.bind({ modkey, modkey2 }, "C", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-clipboard.sh" }))
oxwm.key.bind({ modkey, modkey2 }, "N", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-notification-menu.sh" }))
oxwm.key.bind({ modkey, modkey2 }, "B", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-battery-power-menu.sh" }))
oxwm.key.bind({ modkey }, "Space", oxwm.spawn({ "sh", "-c", "rofi -show drun" }))
oxwm.key.bind({ modkey, "Control" }, "Space", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-wallpaper-selector.sh" }))

oxwm.key.bind({ modkey }, "K", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-keybind-menu.sh" }))
oxwm.key.bind({ modkey2 }, "P", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-powermenu.sh" }))
oxwm.key.bind({ modkey2 }, "C", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-configs-menu.sh" }))
oxwm.key.bind({ modkey2 }, "V", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-volume-selector.sh" }))
oxwm.key.bind({ modkey2 }, "B", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-brightness-selector.sh" }))
oxwm.key.bind({ modkey2 }, "W", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-wifi-menu.sh" }))
oxwm.key.bind({ modkey2 }, "S", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-screenshot-menu.sh" }))
oxwm.key.bind({ modkey2 }, "R", oxwm.spawn({ "sh", "-c", "~/.config/rofi/scripts/rofi-screen-recorder-menu.sh" }))

-- Screenshot and Screenrecording
oxwm.key.bind({}, "Print", oxwm.spawn({ "sh", "-c", "~/.config/oxwm/Scripts/screen-shot.sh" }))
oxwm.key.bind({ modkey }, "R", oxwm.spawn({ "sh", "-c", "~/.config/oxwm/Scripts/screen-record.sh" }))

-- Window management
oxwm.key.bind({ modkey }, "Q", oxwm.client.kill())
oxwm.key.bind({ modkey }, "F", oxwm.client.toggle_fullscreen())

-- Layouts
oxwm.key.bind({ modkey }, "T", oxwm.layout.set("tiling"))
oxwm.key.bind({ modkey }, "S", oxwm.layout.set("scrolling"))
oxwm.key.bind({ modkey }, "N", oxwm.layout.cycle())

-- Master area
oxwm.key.bind({ modkey }, "H", oxwm.set_master_factor(-5))
oxwm.key.bind({ modkey }, "L", oxwm.set_master_factor(5))
oxwm.key.bind({ modkey }, "I", oxwm.inc_num_master(1))
oxwm.key.bind({ modkey }, "P", oxwm.inc_num_master(-1))

-- Gaps
oxwm.key.bind({ modkey }, "A", oxwm.toggle_gaps())

-- WM controls
oxwm.key.bind({ modkey, "Shift" }, "Q", oxwm.quit())
oxwm.key.bind({ modkey, "Shift" }, "R", oxwm.restart())
oxwm.key.bind({ modkey, "Shift" }, "Slash", oxwm.show_keybinds())

-- Focus movement
oxwm.key.bind({ modkey2 }, "H", oxwm.client.focus_stack(1))
oxwm.key.bind({ modkey2 }, "L", oxwm.client.focus_stack(-1))

-- Window movement
oxwm.key.bind({ modkey, "Shift" }, "J", oxwm.client.move_stack(1))
oxwm.key.bind({ modkey, "Shift" }, "K", oxwm.client.move_stack(-1))

-- Workspace switching
for i = 1, 9 do
    oxwm.key.bind({ modkey }, tostring(i), oxwm.tag.view(i - 1))
    oxwm.key.bind({ modkey, "Shift" }, tostring(i), oxwm.tag.move_to(i - 1))
    oxwm.key.bind({ modkey, "Control" }, tostring(i), oxwm.tag.toggleview(i - 1))
    oxwm.key.bind({ modkey, "Control", "Shift" }, tostring(i), oxwm.tag.toggletag(i - 1))
end

-------------------------------------------------------------------------------
-- AUTOSTART
-------------------------------------------------------------------------------

oxwm.autostart("picom")
oxwm.autostart("dunst")
oxwm.autostart("xset r rate 200 55")
oxwm.autostart("~/.config/oxwm/Scripts/set-wallpaper.sh")
oxwm.autostart("flameshot")
