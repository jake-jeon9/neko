Server.GetTopic("getMapName").Add(function()
	local str = unit.field.name
	unit.FireEvent("getMapName",str)
end)