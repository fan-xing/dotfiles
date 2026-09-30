local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

config.default_domain = "WSL:Ubuntu"
config.default_prog = {"zsh", "-l"}
config.default_cwd = "~"

config.font = wezterm.font_with_fallback({{
    family = "Maple Mono NF CN",
    weight = "Medium"
}})

config.font_size = 11
config.color_scheme = "Catppuccin Mocha"

config.audible_bell = "Disabled"
config.window_close_confirmation = "AlwaysPrompt"

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

config.keys = {{
    key = "s",
    mods = "CTRL|ALT",
    action = act.SplitVertical({
        domain = "CurrentPaneDomain"
    })
}, {
    key = "v",
    mods = "CTRL|ALT",
    action = act.SplitHorizontal({
        domain = "CurrentPaneDomain"
    })
}, {
    key = "d",
    mods = "CTRL|ALT",
    action = act.CloseCurrentPane({
        confirm = false
    })
}, {
    key = "z",
    mods = "CTRL|ALT",
    action = act.TogglePaneZoomState
}, {
    key = "h",
    mods = "CTRL|ALT",
    action = act.ActivatePaneDirection("Left")
}, {
    key = "j",
    mods = "CTRL|ALT",
    action = act.ActivatePaneDirection("Down")
}, {
    key = "k",
    mods = "CTRL|ALT",
    action = act.ActivatePaneDirection("Up")
}, {
    key = "l",
    mods = "CTRL|ALT",
    action = act.ActivatePaneDirection("Right")
}, {
    key = "H",
    mods = "CTRL|ALT|SHIFT",
    action = act.AdjustPaneSize({"Left", 5})
}, {
    key = "J",
    mods = "CTRL|ALT|SHIFT",
    action = act.AdjustPaneSize({"Down", 5})
}, {
    key = "K",
    mods = "CTRL|ALT|SHIFT",
    action = act.AdjustPaneSize({"Up", 5})
}, {
    key = "L",
    mods = "CTRL|ALT|SHIFT",
    action = act.AdjustPaneSize({"Right", 5})
}, {
    key = "p",
    mods = "CTRL|ALT",
    action = act.PaneSelect({
        show_pane_ids = true
    })
}, {
    key = "w",
    mods = "CTRL|ALT",
    action = act.ShowLauncherArgs({
        flags = "FUZZY|TABS|WORKSPACES"
    })
}, {
    key = "[",
    mods = "CTRL|ALT",
    action = act.ActivateWindowRelative(-1)
}, {
    key = "]",
    mods = "CTRL|ALT",
    action = act.ActivateWindowRelative(1)
}, {
    key = "1",
    mods = "ALT",
    action = act.ActivateTab(0)
}, {
    key = "2",
    mods = "ALT",
    action = act.ActivateTab(1)
}, {
    key = "3",
    mods = "ALT",
    action = act.ActivateTab(2)
}, {
    key = "4",
    mods = "ALT",
    action = act.ActivateTab(3)
}, {
    key = "5",
    mods = "ALT",
    action = act.ActivateTab(4)
}, {
    key = "6",
    mods = "ALT",
    action = act.ActivateTab(5)
}, {
    key = "7",
    mods = "ALT",
    action = act.ActivateTab(6)
}, {
    key = "8",
    mods = "ALT",
    action = act.ActivateTab(7)
}, {
    key = "9",
    mods = "ALT",
    action = act.ActivateTab(8)
}, {
    key = "0",
    mods = "ALT",
    action = act.ActivateTab(-1)
}, {
    key = "LeftArrow",
    mods = "ALT|SHIFT",
    action = act.MoveTabRelative(-1)
}, {
    key = "RightArrow",
    mods = "ALT|SHIFT",
    action = act.MoveTabRelative(1)
}, {
    key = "c",
    mods = "CTRL",
    action = wezterm.action_callback(function(window, pane)
        local selection = window:get_selection_text_for_pane(pane)
        if selection and selection ~= "" then
            window:perform_action(act.CopyTo("Clipboard"), pane)
            window:perform_action(act.ClearSelection, pane)
        else
            window:perform_action(act.SendKey({
                key = "c",
                mods = "CTRL"
            }), pane)
        end
    end)
}, {
    key = "v",
    mods = "CTRL",
    action = wezterm.action.PasteFrom("Clipboard")
}}

return config
