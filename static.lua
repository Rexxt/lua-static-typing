-- static typing module

local __static_type_proxy = {}

return function(space, mode)
    space[__static_type_proxy] = {}
    
    space[__static_type_proxy].__type_mode = mode ~= nil and mode or "strict"
    if space[__static_type_proxy].__type_mode == "strict" then elseif mode == "soft" then else error("invalid mode: " .. mode, 2) end
    setmetatable(space, {
        __index = function(t, k)
            return t[__static_type_proxy][k]
        end,
        __newindex = function(t, k, v)
            if t[__static_type_proxy][k] == nil then
                t[__static_type_proxy][k] = v
            else
                -- perform type checking
                if type(t[__static_type_proxy][k]) ~= type(v) then
                    if t[__static_type_proxy].__type_mode == "strict" then
                        error("type mismatch: attempted to assign " .. type(v) .. " to variable of type " .. type(t[__static_type_proxy][k]), 2)
                    elseif t[__static_type_proxy].__type_mode == "soft" then
                        print("type mismatch: attempted to assign " .. type(v) .. " to variable of type " .. type(t[__static_type_proxy][k]))
                    end
                else
                    t[__static_type_proxy][k] = v
                end
            end
        end
    })
end