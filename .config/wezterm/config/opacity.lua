local session = require("utils.session")

if session.os_name() == "linux" then
    if session.windowsystem() == "x11" then
        return 0.90
    elseif session.windowsystem() == "wayland" then
        return 0.98
    end
elseif session.os_name() == "macos" then
    return 0.80
end
