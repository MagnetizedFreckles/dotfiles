local systemstuff = require("utils.systemstuff")

if systemstuff.os_name() == "linux" then
    if systemstuff.windowsystem() == "x11" then
        return 0.90
    elseif systemstuff.windowsystem() == "wayland" then
        return 0.95
    end
elseif systemstuff.os_name() == "macos" then
    return 0.80
end
