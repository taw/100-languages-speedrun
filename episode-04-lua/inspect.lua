function inspect(value)
  if type(value) == "table" then
    local result = ""
    for k, v in pairs(value) do
      if result ~= "" then
        result = result .. ", "
      end
      result = result .. tostring(k) .. "=" .. inspect(v)
    end
    return "{" .. result .. "}"
  else
    return tostring(value)
  end
end

local x = {"foo", "bar"}
local y = {name="Bob", surname="Ross", age=52}

print(inspect(x))
print(inspect(y))
