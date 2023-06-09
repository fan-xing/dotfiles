hs.hotkey.bind({ "ctrl", "cmd" }, "t", function()
    local app = hs.application.get("kitty")
    if app:isFrontmost() then
        app:hide()
    else
        hs.application.launchOrFocus(app:name())
    end
end)
