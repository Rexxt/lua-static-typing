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
