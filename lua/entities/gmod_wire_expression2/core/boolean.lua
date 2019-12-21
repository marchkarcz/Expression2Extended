-- I was bored lol

registerType("bool", "bl", true, false,
	nil,
	function(self, output) return Vector(output[1], output[2], output[3]) end,
	function(retval)
		if isvector(retval) then return end
		if not istable(retval) then error("Return value is neither a Vector nor a table, but a "..type(retval).."!",0) end
		if #retval ~= 3 then error("Return value does not have exactly 3 entries!",0) end
	end,
	function(v)
		return not isvector(v) and (not istable(v) or #v ~= 3)
	end
)