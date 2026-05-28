hl.window_rule({
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

transperant = hl.window_rule({
    name = "transperant",
    match = {
        class = ".*",
    },
    opacity = "1 0.8",
})

hl.layer_rule({
    match = {
        class = "selector",
    },
    no_anim = true
})

hl.workspace_rule({
    workspace = "1",
    monitor = "eDP-1",
    default = true
})

hl.workspace_rule({
    workspace = "11",
    monitor = "HDMI-A-1",
    default = true
})

hl.workspace_rule({
    workspace = "r[1-10]",
    monitor = "eDP-1",
})

hl.workspace_rule({
    workspace = "r[11-20]",
    monitor = "HDMI-A-1",
})
