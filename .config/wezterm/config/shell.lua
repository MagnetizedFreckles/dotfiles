local os_name = require("utils.os_name")

if os_name.os_name() == "macos" then
    return { "/opt/local/bin/fish", "-l" }
elseif os_name.os_name() == "linux" then
    return { "/usr/bin/fish", "-l" }
else
    return { "pwsh.exe" }
end
