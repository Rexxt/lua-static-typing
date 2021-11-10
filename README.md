# lua-static-typing
 A module for static typing in native Lua

## `static.lua` vs `autostatic.lua` - what's the difference?
`static.lua`, when used, enforces static typing on ONLY the table and not its child tables.
`autostatic.lua`, however, enforces static typing on the table and its child tables.

## Usage
First, clone this repository, then copy `static.lua` and/or `autostatic.lua` over to your project.<br>
Then, in your lua file, insert this:
```lua
local enable_static = require "static" -- or "autostatic"
```

You may now use the `enable_static` function:
```lua
-- syntax:
enable_static(table, ?mode)
-- where table is any table
--       mode  is "strict" or "soft"
```