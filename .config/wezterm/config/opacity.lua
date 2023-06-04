local os_name = require("utils.os_name")

if os_name.os_name() == "linux" then
    return 0.90
elseif os_name.os_name() == "macos" then
    return 0.80
end
