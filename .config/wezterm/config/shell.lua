local session = require("utils.session")

if session.os_name() == "macos" then
    return { "/usr/bin/env", "fish", "-l" }
elseif session.os_name() == "linux" then
    return { "/usr/bin/env", "fish", "-l" }
else
    return { "pwsh.exe" }
end
