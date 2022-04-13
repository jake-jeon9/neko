--주식 스크립트 설정---
--주식 1~8 아이템 최소가
stock1_minP = 1
stock2_minP = 1
stock3_minP = 1
stock4_minP = 1
stock5_minP = 1
stock6_minP = 1
stock7_minP = 1
stock8_minP = 1
--주식 1~8 아이템 최대가
stock1_maxP = 500000
stock2_maxP = 500000
stock3_maxP = 500000
stock4_maxP = 500000
stock5_maxP = 500000
stock6_maxP = 500000
stock7_maxP = 500000
stock8_maxP = 500000
---------------------------
Server.GetTopic("set_price").Add(function()

    pm = rand(0,2)
    cost = rand(1, 50000)
	if Server.GetWorldVar(101) == 0 then
		Server.SetWorldVar(101,Server.GetWorldVar(101) + cost)
	else	
		if(pm == 0) then
			Server.SetWorldVar(101,Server.GetWorldVar(101) + cost)
		elseif(pm == 1) then
			Server.SetWorldVar(101,Server.GetWorldVar(101) - cost)
		end
	end
	
	pm = rand(0,2)
    cost = rand(1, 50000)
	if Server.GetWorldVar(102) == 0 then
		Server.SetWorldVar(102,Server.GetWorldVar(102) + cost)
	else	
		if(pm == 0) then
			Server.SetWorldVar(102,Server.GetWorldVar(102) + cost)
		elseif(pm == 1) then
			Server.SetWorldVar(102,Server.GetWorldVar(102) - cost)
		end
	end
	
	pm = rand(0,2)
    cost = rand(1, 50000)
	if Server.GetWorldVar(103) == 0 then
		Server.SetWorldVar(103,Server.GetWorldVar(103) + cost)
	else	
		if(pm == 0) then
			Server.SetWorldVar(103,Server.GetWorldVar(103) + cost)
		elseif(pm == 1) then
			Server.SetWorldVar(103,Server.GetWorldVar(103) - cost)
		end
	end
	
	pm = rand(0,2)
    cost = rand(1, 50000)
	if Server.GetWorldVar(104) == 0 then
		Server.SetWorldVar(104,Server.GetWorldVar(104) + cost)
	else	
		if(pm == 0) then
			Server.SetWorldVar(104,Server.GetWorldVar(104) + cost)
		elseif(pm == 1) then
			Server.SetWorldVar(104,Server.GetWorldVar(104) - cost)
		end
	end
	
	pm = rand(0,2)
    cost = rand(1, 50000)
	if Server.GetWorldVar(105) == 0 then
		Server.SetWorldVar(105,Server.GetWorldVar(105) + cost)
	else	
		if(pm == 0) then
			Server.SetWorldVar(105,Server.GetWorldVar(105) + cost)
		elseif(pm == 1) then
			Server.SetWorldVar(105,Server.GetWorldVar(105) - cost)
		end
	end
	
	pm = rand(0,2)
    cost = rand(1, 50000)
	if Server.GetWorldVar(106) == 0 then
		Server.SetWorldVar(106,Server.GetWorldVar(106) + cost)
	else	
		if(pm == 0) then
			Server.SetWorldVar(106,Server.GetWorldVar(106) + cost)
		elseif(pm == 1) then
			Server.SetWorldVar(106,Server.GetWorldVar(106) - cost)
		end
	end
	
	pm = rand(0,2)
    cost = rand(1, 50000)
	if Server.GetWorldVar(107) == 0 then
		Server.SetWorldVar(107,Server.GetWorldVar(107) + cost)
	else	
		if(pm == 0) then
			Server.SetWorldVar(107,Server.GetWorldVar(107) + cost)
		elseif(pm == 1) then
			Server.SetWorldVar(107,Server.GetWorldVar(107) - cost)
		end
	end
	
	pm = rand(0,2)
    cost = rand(1, 50000)
	if Server.GetWorldVar(108) == 0 then
		Server.SetWorldVar(108,Server.GetWorldVar(108) + cost)
	else	
		if(pm == 0) then
			Server.SetWorldVar(108,Server.GetWorldVar(108) + cost)
		elseif(pm == 1) then
			Server.SetWorldVar(108,Server.GetWorldVar(108) - cost)
		end
	end


    --Setting
    if(Server.GetWorldVar(101) < stock1_minP) then
        Server.SetWorldVar(101, stock1_minP)
	elseif(Server.GetWorldVar(101) > stock1_maxP) then
		Server.SetWorldVar(101, stock1_maxP)
    end

    if(Server.GetWorldVar(102) < stock2_minP) then
        Server.SetWorldVar(102, stock2_minP)
	elseif(Server.GetWorldVar(102) > stock2_maxP) then
		Server.SetWorldVar(102, stock2_maxP)
    end

    if(Server.GetWorldVar(103) < stock3_minP) then
        Server.SetWorldVar(103, stock3_minP)
	elseif(Server.GetWorldVar(103) > stock3_maxP) then
		Server.SetWorldVar(103, stock3_maxP)
    end

    if(Server.GetWorldVar(104) < stock4_minP) then
        Server.SetWorldVar(104, stock4_minP)
	elseif(Server.GetWorldVar(104) > stock4_maxP) then
		Server.SetWorldVar(104, stock4_maxP)
    end
	
	if(Server.GetWorldVar(105) < stock5_minP) then
        Server.SetWorldVar(105, stock5_minP)
	elseif(Server.GetWorldVar(105) > stock5_maxP) then
		Server.SetWorldVar(105, stock5_maxP)
    end
	
	if(Server.GetWorldVar(106) < stock6_minP) then
        Server.SetWorldVar(106, stock6_minP)
	elseif(Server.GetWorldVar(106) > stock6_maxP) then
		Server.SetWorldVar(106, stock6_maxP)
    end
	
	if(Server.GetWorldVar(107) < stock7_minP) then
        Server.SetWorldVar(107, stock7_minP)
	elseif(Server.GetWorldVar(107) > stock7_maxP) then
		Server.SetWorldVar(107, stock7_maxP)
    end
	
	if(Server.GetWorldVar(108) < stock8_minP) then
        Server.SetWorldVar(108, stock8_minP)
	elseif(Server.GetWorldVar(108) > stock8_maxP) then
		Server.SetWorldVar(108, stock8_maxP)
    end
    Server.FireEvent('stock', "1," .. Server.GetWorldVar(101))
    Server.FireEvent('stock', "2," .. Server.GetWorldVar(102))
    Server.FireEvent('stock', "3," .. Server.GetWorldVar(103))
    Server.FireEvent('stock', "4," .. Server.GetWorldVar(104))
	Server.FireEvent('stock', "5," .. Server.GetWorldVar(105))
	Server.FireEvent('stock', "6," .. Server.GetWorldVar(106))
	Server.FireEvent('stock', "7," .. Server.GetWorldVar(107))
	Server.FireEvent('stock', "8," .. Server.GetWorldVar(108))
end)

Server.GetTopic('auto').Add(function()
    Server.FireEvent('stock', "1," .. Server.GetWorldVar(101))
    Server.FireEvent('stock', "2," .. Server.GetWorldVar(102))
    Server.FireEvent('stock', "3," .. Server.GetWorldVar(103))
    Server.FireEvent('stock', "4," .. Server.GetWorldVar(104))
	Server.FireEvent('stock', "5," .. Server.GetWorldVar(105))
	Server.FireEvent('stock', "6," .. Server.GetWorldVar(106))
	Server.FireEvent('stock', "7," .. Server.GetWorldVar(107))
	Server.FireEvent('stock', "8," .. Server.GetWorldVar(108))
end)

Server.GetTopic('buy1').Add(function()
    if(unit.gameMoney >= Server.GetWorldVar(101)) then
        unit.gameMoney = unit.gameMoney - Server.GetWorldVar(101)
        unit.AddItem(101, 1)
	else
		unit.SendCenterLabel("골드가 부족합니다")
    end
end)

Server.GetTopic('buy2').Add(function()
    if(unit.gameMoney >= Server.GetWorldVar(102)) then
        unit.gameMoney = unit.gameMoney - Server.GetWorldVar(102)
        unit.AddItem(102, 1)
	else
		unit.SendCenterLabel("골드가 부족합니다")
    end
end)

Server.GetTopic('buy3').Add(function()
    if(unit.gameMoney >= Server.GetWorldVar(103)) then
        unit.gameMoney = unit.gameMoney - Server.GetWorldVar(103)
        unit.AddItem(103, 1)
	else
		unit.SendCenterLabel("골드가 부족합니다")
    end
end)

Server.GetTopic('buy4').Add(function()
    if(unit.gameMoney >= Server.GetWorldVar(104)) then
        unit.gameMoney = unit.gameMoney - Server.GetWorldVar(104)
        unit.AddItem(104, 1)
	else
		unit.SendCenterLabel("골드가 부족합니다")
    end
end)

Server.GetTopic('buy5').Add(function()
    if(unit.gameMoney >= Server.GetWorldVar(105)) then
        unit.gameMoney = unit.gameMoney - Server.GetWorldVar(105)
        unit.AddItem(105, 1)
	else
		unit.SendCenterLabel("골드가 부족합니다")
    end
end)

Server.GetTopic('buy6').Add(function()
    if(unit.gameMoney >= Server.GetWorldVar(106)) then
        unit.gameMoney = unit.gameMoney - Server.GetWorldVar(106)
        unit.AddItem(106, 1)
	else
		unit.SendCenterLabel("골드가 부족합니다")
    end
end)

Server.GetTopic('buy7').Add(function()
    if(unit.gameMoney >= Server.GetWorldVar(107)) then
        unit.gameMoney = unit.gameMoney - Server.GetWorldVar(107)
        unit.AddItem(107, 1)
	else
		unit.SendCenterLabel("골드가 부족합니다")
    end
end)

Server.GetTopic('buy8').Add(function()
    if(unit.gameMoney >= Server.GetWorldVar(108)) then
        unit.gameMoney = unit.gameMoney - Server.GetWorldVar(108)
        unit.AddItem(108, 1)
	else
		unit.SendCenterLabel("골드가 부족합니다")
    end
end)

--
Server.GetTopic('ck1').Add(function()
        unit.StartGlobalEvent(2001)
end)
Server.GetTopic('ck2').Add(function()
        unit.StartGlobalEvent(2002)
end)
Server.GetTopic('ck3').Add(function()
        unit.StartGlobalEvent(2003)
end)
Server.GetTopic('ck4').Add(function()
        unit.StartGlobalEvent(2004)
end)
Server.GetTopic('ck5').Add(function()
        unit.StartGlobalEvent(2005)
end)
Server.GetTopic('ck6').Add(function()
        unit.StartGlobalEvent(2006)
end)
Server.GetTopic('ck7').Add(function()
        unit.StartGlobalEvent(2007)
end)
Server.GetTopic('ck8').Add(function()
        unit.StartGlobalEvent(2008)
end)

Server.GetTopic('stk1').Add(function()
    unit.gameMoney = unit.gameMoney + Server.GetWorldVar(101)
end)
Server.GetTopic('stk2').Add(function()
    unit.gameMoney = unit.gameMoney + Server.GetWorldVar(102)
end)
Server.GetTopic('stk3').Add(function()
    unit.gameMoney = unit.gameMoney + Server.GetWorldVar(103)
end)
Server.GetTopic('stk4').Add(function()
    unit.gameMoney = unit.gameMoney + Server.GetWorldVar(104)
end)
Server.GetTopic('stk5').Add(function()
    unit.gameMoney = unit.gameMoney + Server.GetWorldVar(105)
end)
Server.GetTopic('stk6').Add(function()
    unit.gameMoney = unit.gameMoney + Server.GetWorldVar(106)
end)
Server.GetTopic('stk7').Add(function()
    unit.gameMoney = unit.gameMoney + Server.GetWorldVar(107)
end)
Server.GetTopic('stk8').Add(function()
    unit.gameMoney = unit.gameMoney + Server.GetWorldVar(108)
end)

Server.GetTopic('bringback').Add(function()
    unit.StartGlobalEvent(2010)
end)

Server.GetTopic('go5').Add(function()
    unit.StartGlobalEvent(2009)
end)


--[[셀링]]
Server.GetTopic('stock_sell').Add(function(item,itemCount)
    unit.SendCenterLabel("셀링 선택"..item.."/"..itemCount)
	if itemCount <= 0 then  unit.SendCenterLabel("0보다 큰 값을 입력하세요") return false end
	local price = nil
	local target_item = nil
	

	if item == "[돼  지]" then
		price = Server.GetWorldVar(101)
		target_item = 101
	elseif item == "[와  플]" then
		price = Server.GetWorldVar(102)
		target_item = 102
	elseif item == "[아이다]" then
		price = Server.GetWorldVar(103)
		target_item = 103
	elseif item =="[세  제]" then
		price = Server.GetWorldVar(104)
		target_item = 104
	elseif item == "[꼴까닥]" then
		price = Server.GetWorldVar(105)
		target_item = 105
	elseif item == "[모르고]" then
		price = Server.GetWorldVar(106)
		target_item = 106
	elseif item == "[우  유]" then
		price = Server.GetWorldVar(107)
		target_item = 107
	elseif item == "[  네  ]" then
		price = Server.GetWorldVar(108)
		target_item = 108
	end

	if price == nil or target_item ==nil then unit.SendCenterLabel("수량 및 주식을 선택해주세요.") return false end


	price = price * itemCount

	local invenItems = unit.player.GetItems()

	for i = 1, #invenItems do
		if invenItems[i] ~= nil then
			local titem = invenItems[i]
			local itemData = Server.GetItem(titem.dataID)
			if titem.dataID == target_item  then
				if titem.count >= itemCount then
					unit.gameMoney = unit.gameMoney + price
					unit.RemoveItem(target_item,itemCount)
					unit.SendCenterLabel(item.."을(를)"..itemCount.."수량을 "..price.."에 판매")
					return
				end
			end
		end
	end
	unit.SendCenterLabel("수량이 부족합니다")
end)

--[[바잉]]
Server.GetTopic('stock_buy').Add(function(item,itemCount)
    unit.SendCenterLabel("바잉 선택"..item.."/"..itemCount)
	if itemCount <= 0 then  unit.SendCenterLabel("0보다 큰 값을 입력하세요") return false end
	local price = nil
	local target_item = nil
	if item == "[돼  지]" then
		price = Server.GetWorldVar(101)
		target_item = 101
	elseif item == "[와  플]" then
		price = Server.GetWorldVar(102)
		target_item = 102
	elseif item == "[아이다]" then
		price = Server.GetWorldVar(103)
		target_item = 103
	elseif item =="[세  제]" then
		price = Server.GetWorldVar(104)
		target_item = 104
	elseif item == "[꼴까닥]" then
		price = Server.GetWorldVar(105)
		target_item = 105
	elseif item == "[모르고]" then
		price = Server.GetWorldVar(106)
		target_item = 106
	elseif item == "[우  유]" then
		price = Server.GetWorldVar(107)
		target_item = 107
	elseif item == "[  네  ]" then
		price = Server.GetWorldVar(108)
		target_item = 108
	end

	if price == nil or target_item == nil then unit.SendCenterLabel("수량 및 주식을 선택해주세요.") return false end

	price = price * itemCount
	if(unit.gameMoney >= price) then
		unit.gameMoney = unit.gameMoney - price
		unit.AddItem(target_item, itemCount)
		unit.SendCenterLabel(item.."을(를)"..itemCount.."수량을 "..price.."에 구매")
	else
		unit.SendCenterLabel("골드가 부족합니다")
	end
	

end)