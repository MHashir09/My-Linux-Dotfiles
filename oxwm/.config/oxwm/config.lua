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

-- Color palette
local colors = {
  	bg = "#131313", -- Deepest black
	fg = "#c9c9c9", -- Bright silver
	grey = "#343434", -- Dark grey (for inactive elements)
	light_grey = "#5d5d5e", -- Mid-tone
	silver = "#8c8c8d", -- Muted highlight
	accent = "#c9c9c9", -- Pure highlight

	-- Keeping standard names but mapping to monochrome shades
	red = "#5d5d5e", -- Muted dark grey for urgency
	cyan = "#8c8c8d",
	green = "#c9c9c9",
	lavender = "#5d5d5e",
	light_blue = "#8c8c8d",
	blue = "#8c8c8d",
	purple = "#c9c9c9",
}

-- Workspace tags
local tags = { " 1 ", " 2 ", " 3 ", " 4 ", " 5 " }

-- Status bar font
local bar_font = "JetBrainsMono Nerd Font:style=Bold:size=11.5"

-------------------------------------------------------------------------------
-- STATUS BAR BLOCKS
-------------------------------------------------------------------------------

local blocks = {
    -- Separator
    oxwm.bar.block.static({
        text = "  │  ",
        interval = 999999999,
        color = colors.light_grey,
        underline = false,
    }),

    -- RAM usage
    oxwm.bar.block.ram({
        format = "󱑾   {used} / {total} GB",
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
        format = "  {}",
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
        format = "  {}%",
        charging = "  {}%",
        discharging = "  {}%",
        full = "  {}%",
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
        format = "󰃮  {}  ",
        date_format = "%a, %d - %I:%M %p",
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

oxwm.set_layout_symbol("scrolling", "│ Layout: [Scrolling] ")
oxwm.set_layout_symbol("tiling", "│ Layout: [Tiling] ")
oxwm.set_layout_symbol("normie", "│ Layout: [Floating] ")
oxwm.set_layout_symbol("tabbed", "│ Layout: [Tabbed] ")
oxwm.set_layout_symbol("monocle", "│ Layout: [Monocle] ")
oxwm.set_layout_symbol("grid", "│ Layout: [Monocle]  ")

-------------------------------------------------------------------------------
-- APPEARANCE
-------------------------------------------------------------------------------

-- Window borders
oxwm.border.set_width(0)
oxwm.border.set_focused_color(colors.fg)
oxwm.border.set_unfocused_color(colors.grey)

-- Gaps
oxwm.gaps.set_smart(false)  -- No gaps if only 1 window
oxwm.gaps.set_inner(1, 1)  -- Horizontal, Vertical
oxwm.gaps.set_outer(0, 0)  -- Horizontal, Vertical

-------------------------------------------------------------------------------
-- STATUS BAR
-------------------------------------------------------------------------------

oxwm.bar.set_font(bar_font)
oxwm.bar.set_blocks(blocks)
oxwm.bar.set_hide_vacant_tags(true)

-- Bar color schemes
oxwm.bar.set_scheme_normal(colors.fg, colors.bg, colors.bg)           -- Unoccupied tags
oxwm.bar.set_scheme_occupied(colors.silver, colors.bg, colors.bg)       -- Occupied tags
oxwm.bar.set_scheme_selected(colors.fg, colors.bg, colors.bg)     -- Selected tag
oxwm.bar.set_scheme_urgent(colors.fg, colors.bg, colors.bg)          -- Urgent tags

-------------------------------------------------------------------------------
-- WINDOW RULES
-------------------------------------------------------------------------------

-- Workspace: 1 { Browser & WebApps }
oxwm.rule.add({ class = "Helium", tag = 1 })

-- Workspace: 2 { Terminal & Coding }
oxwm.rule.add({ class = "kitty", tag = 2 })

-- Workspace: 3 { Files }
oxwm.rule.add({ class = "org.gnome.Nautilus", tag = 3 })

-- Workspace: 4 { Steam }
oxwm.rule.add({ class = "steam", tag = 4 })

-- Workspace: 5 { Miscellaneous }
-- Idk what to do with this workspace lol

-------------------------------------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------------------------------------

-- Applications
oxwm.key.bind({ modkey }, "Return", oxwm.spawn_terminal())
oxwm.key.bind({ modkey }, "B", oxwm.spawn("helium-browser"))
oxwm.key.bind({ modkey }, "E", oxwm.spawn("nautilus"))
oxwm.key.bind({ modkey }, "D", oxwm.spawn("vesktop"))

-- Rofi Keybinds
oxwm.key.bind({ modkey, modkey2 }, "Space", oxwm.spawn({ "sh", "-c", "rofi -show codeverse -modi 'codeverse:/home/mhia/.config/rofi/scripts/main-menu.sh' -no-lazy-grab" }))
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

-- Volume controls
oxwm.key.bind({}, "XF86AudioRaiseVolume", oxwm.spawn({ "sh", "-c", "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+ && ~/.config/oxwm/Scripts/volume-notify.sh" }))
oxwm.key.bind({}, "XF86AudioLowerVolume", oxwm.spawn({ "sh", "-c", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && ~/.config/oxwm/Scripts/volume-notify.sh" }))
oxwm.key.bind({}, "XF86AudioMute", oxwm.spawn({ "sh", "-c", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && ~/.config/oxwm/Scripts/volume-notify.sh" }))

-- Media controls
oxwm.key.bind({}, "XF86AudioPlay", oxwm.spawn({ "playerctl", "play-pause" }))
oxwm.key.bind({}, "XF86AudioStop", oxwm.spawn({ "playerctl", "stop" }))
oxwm.key.bind({}, "XF86AudioPrev", oxwm.spawn({ "playerctl", "previous" }))
oxwm.key.bind({}, "XF86AudioNext", oxwm.spawn({ "playerctl", "next" }))

-- Brightness controls
oxwm.key.bind({}, "XF86MonBrightnessUp", oxwm.spawn({ "sh", "-c", "brightnessctl set 5%+ && ~/.config/oxwm/Scripts/brightness-notify.sh" }))
oxwm.key.bind({}, "XF86MonBrightnessDown", oxwm.spawn({ "sh", "-c", "brightnessctl set 5%- && ~/.config/oxwm/Scripts/brightness-notify.sh" }))

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
for i = 1, 5 do
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
oxwm.autostart("xset r rate 200 60")
oxwm.autostart("flameshot")
oxwm.autostart("greenclip daemon") Cuz, I feel like I dont need a clipboard Manager lol
oxwm.autostart("~/.config/oxwm/Scripts/set-default-layout.sh")
oxwm.autostart("~/.config/oxwm/Scripts/set-wallpaper.sh")
