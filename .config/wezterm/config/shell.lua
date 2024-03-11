local systemstuff = require("utils.systemstuff")

if systemstuff.os_name() == "macos" then
    return { "/usr/bin/env", "fish", "-l" }
elseif systemstuff.os_name() == "linux" then
    return { "/usr/bin/env", "fish", "-l" }
else
    return { "pwsh.exe" }
end
