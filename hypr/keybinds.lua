require("variables")

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal), { description = "Open the terminal" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "Open the file manager" })
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(menu), { description = "Open search menu" })
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }), { description = "Move focus to left window" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }), { description = "Move focus to right window" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }), { description = "Move focus to up window" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }), { description = "Move focus to down window" })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scripts .. "/volume.sh --inc"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scripts .. "/volume.sh --dec"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scripts .. "/volume.sh --toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(scripts .. "/volume.sh --mic-toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(scripts .. "/brightness.sh --inc"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scripts .. "/brightness.sh --dec"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(scripts .. "/wallpaper_change.sh"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mainMod .. " + D",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy && wtype -M ctrl -k v -m ctrl"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("blueman-manager"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprshutdown"))
hl.bind("CTRL + ALT + L",hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + CTRL + N",hl.dsp.exec_cmd("/usr/bin/shutdown now"))
hl.bind(mainMod .. " + CTRL + R",hl.dsp.exec_cmd("/usr/bin/reboot"))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i, monitor = "eDP-1" }, {
        description = "Focus workspace " ..
            i
    }))
    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i, monitor = "eDP-1" }, {
            description = "Move window to workspace " ..
                i
        }))
end

for i = 11, 20 do
    local key = (i - 10) % 10
    hl.bind("ALT + " .. key, hl.dsp.focus({ workspace = i, monitor = "HDMI-A-1" }, {
        description = "Focus workspace " ..
            i
    }))
    hl.bind("SHIFT + ALT + " .. key,
        hl.dsp.window.move({ workspace = i, monitor = "HDMI-A-1" }, {
            description = "Move window to workspace " ..
                i
        }))
end

hl.bind(mainMod .. " + C", hl.dsp.window.close("activewindow"), { description = "Close active window" })
hl.bind("ALT + F4", hl.dsp.window.close("activewindow"), { description = "Close active window" })
hl.bind(mainMod .. " + V", hl.dsp.window.float("toggle", "activewindow"),
    { description = "Toggle active window floating" })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())
hl.bind(mainMod .. " + CTRL + F",hl.dsp.window.fullscreen({mode="fullscreen",action="toggle",window="activewindow"}))
hl.bind(mainMod .. " + A",hl.dsp.window.fullscreen({mode="maximized",action="toggle",window="activewindow"}))
hl.bind("ALT + TAB",hl.dsp.window.cycle_next())

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special("special"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.move({ workspace = "special" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.workspace.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.workspace.move({ workspace = "r-1" }))
