--[[
	제작 : 사랑요
	마음대로 사용하시고 마음껏 수정하세요.
	
	☑ 사용법
	서버에서 사용하려면 selling_start() 를 입력하시면 됩니다.
	클라이언트에서 사용하려면 Client.FireEvent("selling") 를 입력하시면 됩니다.
]]

Server.GetTopic("selling_end").Add(function(ID, su)
	local id = Utility.JSONParse(ID)
	local Tem = {}
	for i, p in pairs(id) do
		Tem[i] = unit.player.GetItem(p)
		if Tem[i] == nil then 
			unit.SendCenterLabel("비정상적 판매시도")
			return
		end
		if Tem[i].count < su then
			unit.SendCenterLabel("수량이 부족합니다.")
			return
		end
		if unit.IsEquippedItem(p) then
			unit.SendCenterLabel("착용 중인 아이템은 판매할 수 없습니다.")
			return
		end
	end
	
	local sum = 0
	for i, p in pairs(id) do
		local Sem = Server.GetItem(Tem[i].dataID).sellerPrice
		sum = sum + Sem*su
		unit.RemoveItemByID(p, su, false)
	end
	
	unit.AddGameMoney(sum)
	unit.SendCenterLabel("<color=#81DAF5>아이템을 판매하여 "..sum.."골드를 획득하셨습니다.</color>")
end)

Server.GetTopic("selling_end2").Add(function(ID)
	local id = Utility.JSONParse(ID)
	local Tem = {}
	for i, p in pairs(id) do
		Tem[i] = unit.player.GetItem(p)
		if Tem[i] == nil then 
			unit.SendCenterLabel("비정상적 판매시도")
			return
		end
		if unit.IsEquippedItem(p) then
			unit.SendCenterLabel("착용 중인 아이템은 판매할 수 없습니다.")
			return
		end
	end
	
	local sum = 0
	local su = 0
	for i, p in pairs(id) do
		local Sem = Server.GetItem(Tem[i].dataID).sellerPrice * Tem[i].count
		sum = sum + Sem
		su = Tem[i].count
		unit.RemoveItemByID(p, su, false)
	end
	
	unit.AddGameMoney(sum)
	unit.SendCenterLabel("<color=#81DAF5>아이템을 판매하여 "..sum.."골드를 획득하셨습니다.</color>")
end)

Server.GetTopic("selling_end3").Add(function(DATA_ID)
	local sum = Server.GetItem(DATA_ID).sellerPrice * unit.CountItem(DATA_ID)
	
	unit.RemoveItem(DATA_ID, unit.CountItem(DATA_ID), false)
	unit.AddGameMoney(sum)
	unit.SendCenterLabel("<color=#81DAF5>아이템을 판매하여 "..sum.."골드를 획득하셨습니다.</color>")
end)

Server.GetTopic("selling").Add(function()
	selling_start()
end)

--아이템 사용하기 시작

Server.GetTopic("using_item").Add(function(ID, su,itemNum)
	--print("서버 함수 시작")
	local id = Utility.JSONParse(ID)
	local Tem = {}
	for i, p in pairs(id) do
		Tem[i] = unit.player.GetItem(p)
		if Tem[i] == nil then 
			unit.SendCenterLabel("비정상적 판매시도")
			return
		end
		if Tem[i].count < su then
			unit.SendCenterLabel("수량이 부족합니다.")
			return
		end
	end
	--print(itemNum.."입니다.")
	local sum = 0
	for i, p in pairs(id) do
		local Sem = getExpOfItem(itemNum)
		sum = sum + Sem*su
		unit.RemoveItemByID(p, su, false)
	end
	--print("값은?"..sum)
	unit.AddEXP(sum)
	unit.SendCenterLabel("<color=#81DAF5>아이템을 사용하여 "..sum.."경험치를 획득하셨습니다.</color>")
	--print("서버 함수 종료")
end)


Server.GetTopic("using_itemALL").Add(function(ID, itemNum)
	local id = Utility.JSONParse(ID)
	local Tem = {}
	for i, p in pairs(id) do
		Tem[i] = unit.player.GetItem(p)
		if Tem[i] == nil then 
			unit.SendCenterLabel("비정상적 판매시도")
			return
		end
	end
	local su = Tem[1].count
	local sum = 0
	for i, p in pairs(id) do
		local Sem = getExpOfItem(itemNum)
		sum = sum + Sem*su
		unit.RemoveItemByID(p, su, false)
	end
	--print("값은?"..sum)
	unit.AddEXP(sum)
	unit.SendCenterLabel("<color=#81DAF5>아이템을 사용하여 "..sum.."경험치를 획득하셨습니다.</color>")
	--print("서버 함수 종료")
end)

--아이템 교환하기
Server.GetTopic("change_itemA").Add(function(ID, itemNum,targetNum,count,targetName)
	local id = Utility.JSONParse(ID)
	local Tem = {}
	for i, p in pairs(id) do
		Tem[i] = unit.player.GetItem(p)
		if Tem[i] == nil then 
			unit.SendCenterLabel("비정상적 판매시도")
			return
		end
	end
	local getItemCount = math.floor(Tem[1].count/count)
	local removeItemCount = getItemCount * count

	if getItemCount <1 then
		unit.SendCenterLabel("수량 부족합니다.")
		return
	end
	
	for i, p in pairs(id) do
		unit.RemoveItemByID(p, removeItemCount, false)
		
	end
	--print("값은?"..sum)
	unit.AddItem(targetNum,getItemCount,false)
	unit.SendCenterLabel("<color=#81DAF5>"..targetName.."을 "..getItemCount.."개 획득하셨습니다.</color>")
	--print("서버 함수 종료")
end)


function getExpOfItem(itemNumber) -- 해당 번호가 사용 가능한지?
	local list = {10000,30000,50000,1000000,1000000} -- 아이템 목록
	--print("진입 ")
	local exp = 0;
	print(itemNumber)
	if itemNumber == 4 then
		exp = list[1]
	elseif itemNumber == 11 then
		exp = list[2]
	elseif itemNumber == 12 then
		exp = list[3]
	elseif itemNumber == 5 then
		exp = list[4]
	elseif itemNumber == 6 then
		exp = list[5]
	end
	print(exp)
	return exp
end

function selling_start()
	local Q, W, E, R, T = {}, {}, {}, {}, {}
	local Tstr, Eq = {}, {}
	for i, p in pairs(unit.player.GetItems()) do
		table.insert(Q, p.dataID)
		table.insert(W, p.id)
		table.insert(E, p.count)
		table.insert(R, p.level)
		table.insert(T, Utility.GetItemOptions(p))
		table.insert(Tstr, '')
		table.insert(Eq, unit.IsEquippedItem(p.id))
	end
	for i, p in pairs(T) do
		for j, o in pairs(p) do
			Tstr[i] = Tstr[i]..filter(o.type, o.statID, o.value)
		end	
	end
	
	local q, w, e, r, t = Utility.JSONSerialize(Q), Utility.JSONSerialize(W), Utility.JSONSerialize(E), Utility.JSONSerialize(R), Utility.JSONSerialize(Tstr)
	local eq = Utility.JSONSerialize(Eq)
	unit.FireEvent("selling_start", q, w, e, r, t, eq)
end

function filter(Q, W, E)
	local txt = {}
	local text1, text2, text3 = "", "", ""
	
	if W == 0 then
		local atk = Server.GetStrings().attack
		text2 = (atk == "" and "공격력") or atk
	elseif W == 1 then
		local def = Server.GetStrings().defense
		text2 = (def == "" and "방어력") or def
	elseif W == 2 then
		local Matk = Server.GetStrings().magic_attack
		text2 = (Matk == "" and "마법 공격력") or Matk
	elseif W == 3 then
		local Mdef = Server.GetStrings().magic_defense
		text2 = (Mdef == "" and "마법 방어력") or Mdef
	elseif W == 4 then
		local agi = Server.GetStrings().agility
		text2 = (agi == "" and "민첩") or agi
	elseif W == 5 then
		local luk = Server.GetStrings().lucky
		text2 = (luk == "" and "민첩") or luk
	elseif W == 6 then
		local hp = Server.GetStrings().hp
		text2 = (hp == "" and "체력") or hp
	elseif W == 7 then
		local mp = Server.GetStrings().mp
		text2 = (mp == "" and "마나") or mp
	elseif W == 101 then
		text2 = Server.GetStrings().custom1
	elseif W == 102 then
		text2 = Server.GetStrings().custom2
	elseif W == 103 then
		text2 = Server.GetStrings().custom3
	elseif W == 104 then
		text2 = Server.GetStrings().custom4
	elseif W == 105 then
		text2 = Server.GetStrings().custom5
	elseif W == 106 then
		text2 = Server.GetStrings().custom6
	elseif W == 107 then
		text2 = Server.GetStrings().custom7
	elseif W == 108 then
		text2 = Server.GetStrings().custom8
	elseif W == 109 then
		text2 = Server.GetStrings().custom9
	elseif W == 110 then
		text2 = Server.GetStrings().custom10
	elseif W == 111 then
		text2 = Server.GetStrings().custom11
	elseif W == 112 then
		text2 = Server.GetStrings().custom12
	elseif W == 113 then
		text2 = Server.GetStrings().custom13
	elseif W == 114 then
		text2 = Server.GetStrings().custom14
	elseif W == 115 then
		text2 = Server.GetStrings().custom15
	elseif W == 116 then
		text2 = Server.GetStrings().custom16
	elseif W == 117 then
		text2 = Server.GetStrings().custom17
	elseif W == 118 then
		text2 = Server.GetStrings().custom18
	elseif W == 119 then
		text2 = Server.GetStrings().custom19
	elseif W == 120 then
		text2 = Server.GetStrings().custom20
	elseif W == 121 then
		text2 = Server.GetStrings().custom21
	elseif W == 122 then
		text2 = Server.GetStrings().custom22
	elseif W == 123 then
		text2 = Server.GetStrings().custom23
	elseif W == 124 then
		text2 = Server.GetStrings().custom24
	elseif W == 125 then
		text2 = Server.GetStrings().custom25
	elseif W == 126 then
		text2 = Server.GetStrings().custom26
	elseif W == 127 then
		text2 = Server.GetStrings().custom27
	elseif W == 128 then
		text2 = Server.GetStrings().custom28
	elseif W == 129 then
		text2 = Server.GetStrings().custom29
	elseif W == 130 then
		text2 = Server.GetStrings().custom30
	elseif W == 131 then
		text2 = Server.GetStrings().custom31
	elseif W == 132 then
		text2 = Server.GetStrings().custom32
	else
		text2 = 'Error'
	end
	
	text2 = text2:gsub('/', '')
	
	if Q == 1 then
		text1 = '직업 '..text2..' +'..E
	elseif Q == 2 then
		text1 = '직업 '..text2..' +'..E..'%'
	elseif Q == 3 then
		text1 = '아이템 '..text2..' +'..E
	elseif Q == 4 then
		text1 = '아이템 '..text2..' +'..E..'%'
	else
		text1 = text2..' +'..E
	end
	
	text1 = text1.."\n"
	return text1
end

