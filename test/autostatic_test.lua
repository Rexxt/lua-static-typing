local enable_static = require "autostatic"
enable_static(_G, "soft")

foo = "foo"
namespace = {
    bar = "bar",
    baz = "baz",
}

print(foo)
print(namespace.bar)
print(namespace.baz)
namespace.bar = 12 -- should throw an error because namespace is statically typed
print(namespace.bar)

--[[ Prevent automatic static typing on a specific table:
local enable_static, loosen = require "autostatic"
enable_static(_G, "soft")
myTable = loosen {
    -- dynamically typed table
    x = 10
}
myTable.x = "10" -- should not throw an error because myTable has been loosened
]]
