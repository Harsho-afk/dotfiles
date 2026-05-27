hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@144.42",
    position = "1920x0",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@100.00",
    position = "0x0",
    scale = 1,
})

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = "rgba(ffffffff)",
            inactive_border = "rgba(000000ff)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 5,
        rounding_power = 5,
        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = false,
        },
    },
})

hl.curve({ "easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } } })
hl.curve({ "easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } } })
hl.curve({ "linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } } })
hl.curve({ "almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } } })
hl.curve({ "quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, curve = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, curve = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, curve = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })

-- animation = global, 1, 10, default
-- animation = border, 1, 5.39, easeOutQuint
-- animation = windows, 1, 4.79, easeOutQuint
-- animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
-- animation = windowsOut, 1, 1.49, linear, popin 87%
-- animation = fadeIn, 1, 1.73, almostLinear
-- animation = fadeOut, 1, 1.46, almostLinear
-- animation = fade, 1, 3.03, quick
-- animation = layers, 1, 3.81, easeOutQuint
-- animation = layersIn, 1, 4, easeOutQuint, fade
-- animation = layersOut, 1, 1.5, linear, fade
-- animation = fadeLayersIn, 1, 1.79, almostLinear
-- animation = fadeLayersOut, 1, 1.39, almostLinear
-- animation = workspaces, 1, 1.94, almostLinear, fade
-- animation = workspacesIn, 1, 1.21, almostLinear, fade
-- animation = workspacesOut, 1, 1.94, almostLinear, fade
--
