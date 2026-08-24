------------------
---- MONITORS ----
------------------
hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "auto",
    scale = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "kitty"
local menu = "/home/AleMenon/.config/rofi/scripts/launcher_t1"
local browser = "brave"
local player = "spotify"

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar & hyprpaper & mako")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("wl-paste --watch cliphist store")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Adwaita-dark")
hl.env("GTK_APPLICATION_PREFER_DARK_THEME", "1")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border = "rgb(7f849c)",
            inactive_border = "rgb(6c7086)",
        },

        resize_on_border = false,

        no_focus_fallback = true,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 7,
        rounding_power = 5,

        active_opacity = 1.0,
        inactive_opacity = 0.85,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            popups = true,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 1.3, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.3, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.8, bezier = "linear", style = "slidefade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.3, bezier = "linear", style = "slidefade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.3, bezier = "linear", style = "slidefade" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

----------------
----  MISC ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "br",
        kb_variant = "",
        kb_model = "abnt2",
        kb_options = "",
        kb_rules = "",

       repeat_rate = 40,
       repeat_delay = 350,

        numlock_by_default = true,

        follow_mouse = 1,

        sensitivity = 0,

        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.8
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.gesture({
    fingers = 3,
    direction = "up",
    action = "fullscreen"
})

hl.gesture({
    fingers = 3,
    direction = "down",
    action = "close"
})

---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(player))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser .. " --password-store=basic"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser .. " --app=https://web.whatsapp.com/ --password-store=basic"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("~/.config/rofi/scripts/clipboard_t1"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("wlogout --buttons-per-row 2"))
hl.bind(mainMod .. " + CTRL + N", hl.dsp.exec_cmd("kitty --class float_term -e wlctl"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("kitty --class float_term -e pulsemixer"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("kitty --class float_term -e bluetui"))

hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + X", function()
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
    hl.dispatch(hl.dsp.window.resize({ x = 1092, y = 614}))
    hl.dispatch(hl.dsp.window.center())
end)
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), {repeating = true })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), {repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), {repeating = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), {repeating = true })
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.swap({ direction = "d" }))
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ monitor = i }))
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ monitor = i }))
end

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("F11",hl.dsp.exec_cmd("light -U 5"), { locked = true, repeating = true })
hl.bind("F12", hl.dsp.exec_cmd("light -A 5"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
local suppressMaximizeRule = hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
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

hl.window_rule({
    name = "Whatsapp",
    match = {
        initial_title = "web.whatsapp.com_/"
    },
    tile = true,
    workspace = "2 silent"
})

hl.window_rule({
    name = "Browser",
    match = {
        initial_class = "brave-browser"
    },
    workspace = "4"
})

hl.window_rule({
    name = "Discord",
    match = {
        initial_title = "Discord"
    },
    workspace = "3 silent"
})

hl.window_rule({
    name = "Discord",
    match = {
        title = "Discord Updater"
    },
    workspace = "3 silent"
})

hl.window_rule({
    name = "Telegram",
    match = {
        initial_title = "Telegram"
    },
    workspace = "3 silent"
})

hl.window_rule({
    name = "Spotify",
    match = {
        class = "Spotify"
    },
    workspace = "5"
})

hl.window_rule({
    name = "Float Term",
    match = {
        class = "float_term"
    },
    float = true,
    size = { 1000, 600 },
    move = {( "(monitor_w - 1015)"), 50 }
})
