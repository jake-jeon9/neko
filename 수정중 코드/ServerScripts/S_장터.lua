
---------------------------------------------------------
--[[
세팅 해야할 부분이며, 안쓰는 번호로 등록바람
스트링변수와 변수는 별개이므로, 숫자가 중복되어도 상관없다.

한번에 많은 사람이 동시다발적으로 한 물건을 누르게 됬을때, 동시처리가 안되서 문제가 발생할 수 있다고 들은 적이 있습니다. (직접 보진 못했습니다. 혹, 발견하시면 제보해주세요)
이 점 유의하시고, 여러 테스트 이후 사용하여 주시길 바랍니다. 문제 발생 시 책임은 사용자에게 있습니다.
그 밖에 다른 문제 발생 시 제보 부탁드립니다.


Made By - HanRyang 한량
]]--

varStringList = {1001,1002,1003,1004,1005}
-- 아이템정보 저장 스트링변수번호

varString_Title = 1000
-- 장터 간판 이름 저장 스트링변수번호

var_Open = 1011
-- 장터오픈 유무 변수번호

var_item = 2040
-- 아이템 선택 변수번호

var_safe = 1000
-- 안전장치1 변수번호

var_fee = 50
-- 장터 수수료 변수번호

global_Event = 1999
-- 데이터베이스 - 공용이벤트 - '장터 아이템등록'이 있는 이벤트의 번호를 넣어주면 됩니다.

SuperGM = {"TEST_1","TEST_2"}
-- 운영자 이름으로 넣어주시길 바랍니다. 대상 아이템을 강제로 회수시킬 수 있는 권한이 생깁니다.
-- {"한량","껄껄"} 이런식으로 두명 이상 지정 가능.

---------------------------------------------------------


s_market = {}


function s_market:GM(target_playerID,target_playerName)
	if not unit or not target_playerID then
		return
	end
	
	local ck = 0
	for i, v in ipairs(SuperGM) do
		if v or v ~= "" then
			if v == unit.player.name then
				ck = ck+1
				break
			end
		end
	end
	if ck <= 0 then
		unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 강제회수는 운영자 권한입니다.</size>")
		s_market:target(target_playerID, target_playerName)
		return
	end
	
	for i, v in ipairs(Server.players) do
		if v.id == target_playerID then
			local count = 0
			for j, y in ipairs(varStringList) do
				if v.unit.GetStringVar(y) and v.unit.GetStringVar(y) ~= "" then
					count = count + 1
				end
			end
			if count <= 0 then
				unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 등록된 아이템이 없습니다.</size>")
				return
			end
			break
		end
	end
	
	for i, v in ipairs(Server.players) do
		if v.id == target_playerID then
			v.unit.SetVar(var_Open, 0)
			for j, y in ipairs(varStringList) do
				if v.unit.GetStringVar(y) and v.unit.GetStringVar(y) ~= "" then
					local list = Utility.JSONParse(v.unit.GetStringVar(y))
					v.unit.SetStringVar(y, "")
					v.unit.AddItem(list[1], list[2])
					local a = v.unit.player.GetItems()
					for k, z in ipairs(a) do
						if z.dataID == list[1] and #z.options == 0 and z.level == 0 then
							z.level = list[3]
							for m=5, #list, 3 do
								Utility.AddItemOption(z,list[m],list[m+1],list[m+2])
							end
							v.unit.player.SendItemUpdated(z)
						break
						end
					end
				end
			end
			s_market:target(v.id, v.name)
			unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 성공적으로 모든 아이템을 강제회수 시켰습니다.</size>")
			v.unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 운영자가 장터에 등록된 아이템을 강제회수 시켰습니다.</size>")
			break
		end
	end
end
Server.GetTopic("s_market:GM").Add(function(a,b) s_market:GM(a,b) end)


function s_market:text(a)
	if not unit then
		return
	end
	
	if a == 1 then
		unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 마지막 페이지 입니다.</size>")
	elseif a == 2 then
		unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 첫 페이지 입니다.</size>")
	elseif a == 3 then
		if unit.GetVar(var_Open) ~= 1 then
			unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 이제 판매가 시작됩니다!</size>")
			unit.SetVar(var_Open,1)
		else
			unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 이미 판매시작 했습니다!</size>")
		end
	elseif a == 4 then
		unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 먼저 상품을 등록해주세요.</size>")
	elseif a == 5 then
		unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 목록갱신 완료!</size>")
	elseif a == 6 then
		unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 내 장터는 볼 수 없습니다!</size>")
	end
end
Server.GetTopic("s_market:text").Add(function(a) s_market:text(a) end)


function s_market:players()
	if not unit then
		return
	end
	
	local list = {[1]={},[2]={},[3]={}}
	
	for i, v in ipairs(Server.players) do
		if v.unit.GetVar(var_Open) == 1 then
			table.insert(list[1], v.id)
			table.insert(list[2], v.name)
			table.insert(list[3], v.unit.GetStringVar(varString_Title))
		end
	end
	
	if #list[1] <= 0 then
		unit.SendCenterLabel("<size=15><Color=Red>[장터]</color>등록된 아이템이 없어 이용 불가능합니다.</size>")
		return
	end

	list[1] = Utility.JSONSerialize(list[1])
	list[2] = Utility.JSONSerialize(list[2])
	list[3] = Utility.JSONSerialize(list[3])

	unit.FireEvent("c_market:players", list[1], list[2], list[3], unit.player.id)
end
Server.GetTopic("s_market:players").Add(function() s_market:players() end)


function s_market:target(target_id,target_name)
	if not unit or not target_id then
		return
	end
	
	local list = {}
	for i, v in ipairs(Server.players) do
		if v.id == target_id then
			for j, y in ipairs(varStringList) do
				if v.unit.GetStringVar(y) and v.unit.GetStringVar(y) ~= "" then
					table.insert(list, v.unit.GetStringVar(y))
				else
					table.insert(list, 0)
				end
			end
			unit.FireEvent("c_market:target_table", list[1], list[2], list[3], list[4], list[5], target_id, target_name)
			return
		end
	end
	unit.SendCenterLabel("<size=15><Color=Red>[장터]</color>해당 유저는 서버에 없습니다(장터닫힘)</size>")
	unit.FireEvent("c_market:players")
end
Server.GetTopic("s_market:target").Add(function(a,b) s_market:target(a,b) end)


function s_market:sellItemList()
	if not unit then
		return
	end
	
	local list = {}
	for i, v in ipairs(varStringList) do
		if unit.GetStringVar(v) and unit.GetStringVar(v) ~= "" then
			table.insert(list, unit.GetStringVar(v))
		else
			table.insert(list, 0)
		end
	end
	
	if not unit.GetStringVar(varString_Title) then
		unit.SetStringVar(varString_Title, "아이템 팝니다.")
	end
	
	unit.FireEvent("c_market:management", unit.GetStringVar(varString_Title), list[1], list[2], list[3], list[4], list[5])
end
Server.GetTopic("s_market:sellItemList").Add(function() s_market:sellItemList() end)


function s_market:reTitle(reTitle)
	if not unit or not reTitle then
		return
	end
	
	unit.SetStringVar(varString_Title, reTitle)
	s_market:sellItemList()
end
Server.GetTopic("s_market:reTitle").Add(function(a) s_market:reTitle(a) end)


function s_market:registerItem()
	if not unit then
		return
	end
	
	unit.StartGlobalEvent(global_Event)
end
Server.GetTopic("s_market:registerItem").Add(function() s_market:registerItem() end)


function s_market:registerItem2(item_price, num, item_count)
	if not unit or not item_price or not num or not item_count then
		return
	end
	
	local item = unit.player.GetItem(unit.GetVar(var_item))
	
	if item.count < item_count then -- 보안 검사
		unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 아이템 수량이 이상합니다.</size>")
		return
	end

	local list = {item.dataID,item_count,item.level,item_price}
	for i, v in ipairs(item.options) do
		table.insert(list, item.options[i].type)
		table.insert(list, item.options[i].statID)
		table.insert(list, item.options[i].value)
	end
	unit.RemoveItemByID(unit.GetVar(var_item),item_count)
	unit.SetStringVar(varStringList[num], Utility.JSONSerialize(list))
	s_market:sellItemList()
end
Server.GetTopic("s_market:registerItem2").Add(function(a,b,c) s_market:registerItem2(a,b,c) end)


function s_market:collectItem(num, check)
	if not unit or not num or not check then
		return
	end
	
	if not unit.GetStringVar(varStringList[num]) or  unit.GetStringVar(varStringList[num]) == "" or unit.GetStringVar(varStringList[num]) ~= check  then -- 1차 보안
		unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 아이템이 이미 팔렸거나 회수되었습니다.</size>")
		return
	end

	local item = Utility.JSONParse(unit.GetStringVar(varStringList[num]))
	--item[1] = dataID / [2] = count / [3] = level / [4] = price / ... options
	unit.SetStringVar(varStringList[num], nil)
	
	if unit.GetStringVar(varStringList[num]) and unit.GetStringVar(varStringList[num]) ~= "" then -- 2차 보안
		return
	end
	
	unit.AddItem(item[1], item[2])
	local a = unit.player.GetItems()
	for i, v in ipairs(a) do
		if v.dataID == item[1] and #v.options == 0 and v.level == 0 then
			v.level = item[3]
			for j=5, #item, 3 do
				Utility.AddItemOption(v,item[j],item[j+1],item[j+2])
			end
			unit.player.SendItemUpdated(v)
		break
		end
	end
	s_market:sellItemList()
	for i, v in ipairs(varStringList) do
		if unit.GetStringVar(varStringList[i]) and unit.GetStringVar(varStringList[i]) ~= "" then
			return
		end
	end
	unit.SetVar(var_Open, 0)
end
Server.GetTopic("s_market:collectItem").Add(function(a,b) s_market:collectItem(a,b) end)


function s_market:delay(u)
Server.RunLater(function()
	if not u then
		return
	end
	
	u.SetVar(var_safe, 0)
end,2)
end


function s_market:delay_reset()
if not unit then
	return
end
	
unit.SetVar(var_safe, 0)
end
Server.GetTopic("s_market:delay_reset").Add(function() s_market:delay_reset() end)


function s_market:buyItem(num,target_playerID,check)
	if not unit or not num or not target_playerID or not check then
		return
	end
	
	for i, v in ipairs(Server.players) do
		if v.id == target_playerID then
			if v.unit.GetVar(var_Open) == 0 then
				unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 대상이 장터를 닫았습니다.</size>")
				s_market:target(v.id, v.name)
				return
			end
		
			if v.unit.GetVar(var_safe) == 1 then
				unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 대상이 거래중이오니 잠시후 다시 시도하세요.</size>")
				s_market:target(v.id, v.name)
				return
			else
				v.unit.SetVar(var_safe, 1)
				s_market:delay(v.unit)
			end
			
			if not v.unit.GetStringVar(varStringList[num]) or v.unit.GetStringVar(varStringList[num]) == "" or v.unit.GetStringVar(varStringList[num]) ~= check then -- 1차 보안
				unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 아이템이 이미 팔렸거나 회수됬습니다.</size>")
				s_market:target(v.id, v.name)
				return
			end
			
			local item = Utility.JSONParse(v.unit.GetStringVar(varStringList[num]))
			
			if unit.gameMoney < item[4] then
				unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 골드가 <Color=Yellow>" .. item[4]-unit.gameMoney .. "</color>BN이 부족합니다.</size>")
				s_market:target(v.id, v.name)
				return
			end
			
			v.unit.SetStringVar(varStringList[num], "")
	
			if v.unit.GetStringVar(varStringList[num]) and v.unit.GetStringVar(varStringList[num]) ~= "" then -- 2차 보안
				return
			end
			
			unit.AddItem(item[1], item[2])
			local a = unit.player.GetItems()
			for j, y in ipairs(a) do
				if y.dataID == item[1] and #y.options == 0 and y.level == 0 then
					y.level = item[3]
					for k=5, #item, 3 do
						Utility.AddItemOption(y,item[k],item[k+1],item[k+2])
					end
					unit.player.SendItemUpdated(y)
					unit.SendCenterLabel("<size=15><Color=Red>[장터]</color> 아이템을 구매했습니다!</size>")
					unit.AddGameMoney(-item[4])
					v.unit.SetVar(var_fee, item[4]/50)
					v.unit.AddGameMoney(item[4]-v.unit.GetVar(var_fee))
					v.unit.SendCenterLabel("<size=15><Color=Red>[장터] </color><Color=Yellow>" .. Server.GetItem(item[1]).name .. "</color>를(을) 팔아<Color=Yellow>" .. item[4]-v.unit.GetVar(var_fee).. "</color>BN획득![수수료:<color=#FFFF00>" .. v.unit.GetVar(var_fee).. "</color>BN]</size>")
					v.unit.SendSay("<color=#FF0000>[장터] </color><color=#FFFF00>" .. Server.GetItem(item[1]).name .. "</color>를(을) 팔아<color=#FFFF00>" .. item[4]-v.unit.GetVar(var_fee).. "</color>BN획득![수수료:<color=#FFFF00>" .. v.unit.GetVar(var_fee).. "</color>BN]")
					s_market:target(v.id, v.name)
				break
				end
			end
			
			for j, y in ipairs(varStringList) do
				if v.unit.GetStringVar(varStringList[j]) and v.unit.GetStringVar(varStringList[j]) ~= "" then
					return
				end
			end
			v.unit.SendCenterLabel("<size=15><Color=Red>[장터] </color>모든 아이템 판매완료!\n장터가 닫힙니다.</size>")
			v.unit.SetVar(var_Open, 0)
			break
		end
	end
end
Server.GetTopic("s_market:buyItem").Add(function(a,b,c) s_market:buyItem(a,b,c) end)

