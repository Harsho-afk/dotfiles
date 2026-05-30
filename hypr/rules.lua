hl.window_rule({
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    match = {
        class = "^mcontrolcenter$",
    },
    float = true,
    size = { 750, 550 },
})

transperant = hl.window_rule({
    name = "transperant",
    match = {
        class = ".*",
    },
    opacity = "1 0.8",
})
transperant:set_enabled(false)

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
    workspace = "2",
    monitor = "eDP-1",
})
hl.workspace_rule({
    workspace = "3",
    monitor = "eDP-1",
})
hl.workspace_rule({
    workspace = "4",
    monitor = "eDP-1",
})
hl.workspace_rule({
    workspace = "5",
    monitor = "eDP-1",
})

hl.workspace_rule({
    workspace = "11",
    monitor = "HDMI-A-1",
    default = true
})
hl.workspace_rule({
    workspace = "12",
    monitor = "HDMI-A-1",
})
hl.workspace_rule({
    workspace = "13",
    monitor = "HDMI-A-1",
})
hl.workspace_rule({
    workspace = "14",
    monitor = "HDMI-A-1",
})
hl.workspace_rule({
    workspace = "15",
    monitor = "HDMI-A-1",
})
