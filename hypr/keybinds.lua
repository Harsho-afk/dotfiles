require("variables")
require("rules")

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal), { description = "Open terminal" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "Open file manager" })
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(menu), { description = "Open app launcher" })
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser), { description = "Open browser" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("blueman-manager"), { description = "Open Bluetooth manager" })
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("spotify"), { description = "Open Spotify" })
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd(""), { description = "Reserved shortcut" })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scripts .. "/volume.sh --inc"),
    { locked = true, repeating = true, description = "Increase volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scripts .. "/volume.sh --dec"),
    { locked = true, repeating = true, description = "Decrease volume" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scripts .. "/volume.sh --toggle"),
    { locked = true, description = "Toggle speaker mute" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(scripts .. "/volume.sh --mic-toggle"),
    { locked = true, description = "Toggle microphone mute" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),
    { locked = true, repeating = true, description = "Next media track" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true, description = "Toggle media playback" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play or pause media" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),
    { locked = true, repeating = true, description = "Previous media track" })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(scripts .. "/brightness.sh --inc"),
    { repeating = true, description = "Increase brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scripts .. "/brightness.sh --dec"),
    { repeating = true, description = "Decrease brightness" })

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(scripts .. "/wallpaper_change.sh"), { description = "Change wallpaper" })

hl.bind(mainMod .. " + D",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy && wtype -M ctrl -k v -m ctrl"),
    { description = "Open clipboard manager" })

hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprshutdown"), { description = "Exit hyperland" })
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("hyprlock"), { description = "Lock screen" })
hl.bind(mainMod .. " + CTRL + N", hl.dsp.exec_cmd("/usr/bin/shutdown now"), { description = "Shutdown system" })
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("/usr/bin/reboot"), { description = "Reboot system" })

hl.bind("Print", hl.dsp.exec_cmd(scripts .. "/screenshot.sh area"), { description = "Take area screenshot" })
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(scripts .. "/screenshot.sh full"),
    { description = "Take fullscreen screenshot" })
hl.bind("CTRL + Print", hl.dsp.exec_cmd(scripts .. "/screenshot.sh window"),
    { description = "Take active window screenshot" })

for i = 1, 10 do
    local key = i % 10

    hl.bind(mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i }),
        { description = "Focus workspace " .. i })

    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i }),
        { description = "Move window to workspace " .. i })
end

for i = 11, 20 do
    local key = (i - 10) % 10

    hl.bind("ALT + " .. key,
        hl.dsp.focus({ workspace = i }),
        { description = "Focus workspace " .. i })

    hl.bind("SHIFT + ALT + " .. key,
        hl.dsp.window.move({ workspace = i }),
        { description = "Move window to workspace " .. i })
end

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }), { repeating = true, description = "Focus left window" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }), { repeating = true, description = "Focus right window" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }), { repeating = true, description = "Focus upper window" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }), { repeating = true, description = "Focus lower window" })

hl.bind(mainMod .. " + C", hl.dsp.window.close("activewindow"), { description = "Close active window" })
hl.bind("ALT + F4", hl.dsp.window.close("activewindow"), { description = "Close active window" })
hl.bind(mainMod .. " + V", hl.dsp.window.float("toggle", "activewindow"), { description = "Toggle floating mode" })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "Drag window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "Resize window" })
hl.bind(mainMod .. " + CTRL + F",
    hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle", window = "activewindow" }),
    { description = "Toggle fullscreen" })
hl.bind(mainMod .. " + A",
    hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle", window = "activewindow" }),
    { description = "Toggle maximized mode" })
hl.bind("ALT + TAB", hl.dsp.window.cycle_next(), { repeating = true, description = "Cycle windows" })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special("special"),
    { description = "Toggle special workspace" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.move({ workspace = "special" }),
    { description = "Move window to special workspace" })

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "r+1" }), { description = "Go to next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "r-1" }), { description = "Go to previous workspace" })
hl.bind(mainMod .. " + Z", function()
    if transperant:is_enabled() then
        transperant:set_enabled(false)
    else
        transperant:set_enabled(true)
    end
end, {
    description = "Toggle transparency"
})

hl.bind(mainMod .. " + SHIFT + right", hl.dsp.layout("rotatesplit 90"),
    { repeating = true, description = "Rotate split right" })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.layout("rotatesplit -90"),
    { repeating = true, description = "Rotate split left" })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.layout("togglesplit"),
    { repeating = true, description = "Toggle split orientation" })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.layout("swapsplit"),
    { repeating = true, description = "Swap split direction" })
