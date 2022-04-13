g_but, g_menu, g_Delicate, g_count = {}, {}, {}, {}
Server.GetTopic('Love').Add(function(A, B, C, D)
	g_but, g_menu, g_Delicate, g_count = Utility.JSONParse(A), Utility.JSONParse(B), Utility.JSONParse(C), Utility.JSONParse(D)
end)

Server.GetTopic('Love2').Add(function(Q, W)
	local E, R = {}, {}
	if g_Delicate[tostring(g_menu[g_but[Q]][W])] == nil then return end
	for i, v in pairs(g_Delicate[tostring(g_menu[g_but[Q]][W])]) do
		table.insert(E, unit.CountItem(v))
		table.insert(R, v)
	end
	unit.FireEvent('Love3', Utility.JSONSerialize(E), Utility.JSONSerialize(R), tostring(g_menu[g_but[Q]][W]))
end)

Server.GetTopic('Love4').Add(function(Q)
	for i, v in pairs(g_count[Q]) do
		if unit.CountItem(g_Delicate[Q][i]) < v then
			unit.SendCenterLabel('재료가 부족합니다.')
			return
		end
		if unit.IsEquippedItemByDataID(g_Delicate[Q][i]) then
			unit.SendCenterLabel('재료가 될 아이템이 장착 상태입니다.\n<color=#F78181>아이템을 창고에 넣어두고 제작하세요.</color>')
			return
		end
	end
	
	for i, v in pairs(g_count[Q]) do
		unit.RemoveItem(g_Delicate[Q][i], v, false)
	end
	unit.AddItem(tonumber(Q), 1, false)
	unit.SendCenterLabel(Server.GetItem(tonumber(Q)).name..' 제작에 성공하였습니다!')
end)











































