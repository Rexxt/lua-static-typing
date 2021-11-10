local enable_static = require "static"

enable_static(_G, "soft")

print("initializing variable pi in _G with type 'number'")
pi = 3.14159

print(pi, type(Pi))

-- attempting to assign string to number variable
print("attempting to assign pi -> number to \"foo bar baz\" -> string")
pi = "foo bar baz" -- this will throw an error
print(pi, type(pi)) -- this does not run because of the error