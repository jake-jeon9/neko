

Server.GetTopic("GET_ITEM_INFO").Add(function(i,id)
	--unit.FireEvent("StatRePet",id,unit.GetVar(id))
	Get_Item_Info(i,id)
end) -- 
function Get_Item_Info(i,id)
	local item = Server.GetItem(id)
	local name = item.name
	local image = item.imageID
	--local desc = item.desc
	unit.FireEvent("SET_CLIEN_SHOP_ITEMLIST",i,name,image)
end

Server.GetTopic("GET_SHOP_INFO").Add(function(i,adIt,adCo,item1,count1)
	--unit.FireEvent("StatRePet",id,unit.GetVar(id))
	Get_Shop_Info(i,adIt,adCo,item1,count1)
end) -- 
function Get_Shop_Info(i,adIt,adCo,item1,count1)
	local item = Server.GetItem(adIt)
	local name = item.name
	local image = item.imageID
	local desc = item.desc
	local needItem = Server.GetItem(item1).name
	local needCount = count1
	local typeStr = ""
	if item.type == 0 then
		typeStr = "- 아이템 타입 : 모자"
	elseif item.type == 1 then
		typeStr = "- 아이템 타입 : 갑옷"
	elseif item.type == 2 then
		typeStr = "- 아이템 타입 : 무기"
	elseif item.type == 3 then
		typeStr = "- 아이템 타입 : 방패"
	elseif item.type == 4 then
		typeStr = "- 아이템 타입 : 신발"
	elseif item.type == 5 then
		typeStr = "- 아이템 타입 : 반지"
	elseif item.type == 6 then
		typeStr = "- 아이템 타입 : 악세사리"
	elseif item.type == 7 then
		typeStr = "- 아이템 타입 : 날개"
	elseif item.type == 8 then
		typeStr = "- 아이템 타입 : 포션"
	elseif item.type == 9 then
		typeStr = "- 아이템 타입 : 재료"
	elseif item.type == 10 then
		typeStr = "- 아이템 타입 : 소모"
	end
	print(item.type)

	Get_Item_Count(item1)
	unit.FireEvent("SET_CLIEN_SHOP_INFO",i,name,image,desc,needItem,needCount,adCo,typeStr)
end

Server.GetTopic("GET_SHOP_BUY").Add(function(i,adIt,adCo,item1,count1)
	-- 아이템구매
	Get_Shop_Buy(i,adIt,adCo,item1,count1)
end) -- 
function Get_Shop_Buy(i,adIt,adCo,item1,count1)
	local needItemName = Server.GetItem(item1).name

	if unit.CountItem(item1) >= count1 then
		unit.RemoveItem(item1,count1,false)
		unit.AddItem(adIt,adCo)
	else
		unit.SendCenterLabel("<color=#ff0000>"..needItemName.." 아이템이 부족합니다.</color>")
	end

	Get_Item_Count(item1)
end

Server.GetTopic("GET_ITEM_COUNT").Add(function(id)
	-- 아이템구매
	Get_Item_Count(id)
end)

function Get_Item_Count(id)
	local count = unit.CountItem(id)
	local name = Server.GetItem(id).name
	unit.FireEvent("SET_NEED_ITEM_COUNT",name,count)
end