
Server.GetTopic("주장이성공").Add(function(items,itemsCount)
    --print("성공진입")
    local itemNumber = ItemList(items,itemsCount,"JUJANG")
    local itemName =Server.GetItem(itemNumber).name
    --print("보상으로 받은 아이템번호 : ? "..itemNumber..",이름은 ? "..itemName)

    unit.AddItem(itemNumber, 1)
    unit.say("!8")
    unit.say(string.format( "<color=#ffcc00>나 %s 얻었어요~!</color>\n",itemName ))
    
end)


Server.GetTopic("주장이실패").Add(function(items,itemsCount)
    --print("실패진입")
    local ITEMS = Utility.JSONParse(items)
    local ITEMSCOUNT = Utility.JSONParse(itemsCount)
    local item =  {}
    local count = {}
    for i,data in pairs(ITEMS) do
        item[i] = data
    end

    for i,data in pairs(ITEMSCOUNT) do
        count[i] = data
        unit.RemoveItem(item[i],count[i])
        --print(i.."번쨰 아이템 제거 : "..item[i]..", 수량 : "..count[i])
    end
    unit.say("!6")
    unit.say("<color=#ffcc00>나 아까비깡 얻었어요~!</color>\n")

    unit.AddItem(14, 1)
end)

Server.GetTopic("startJujang").Add(function()
    jobMakingStart("jujang")
end)

---------------------------------
-----    아이템 리스트     -------
---------------------------------
theListOfJujang  = {}
function listOfJujnag ()
    --print("리스트업 완료")
    local items = {}
    items["itemNumber"] = 189 -- 아련이날개
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.6
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 139 -- 일반 땅의 요정석
    item1["count"] = 1
    
    local item2 = {}
    item2["itemNum"] = 140 -- 일반 바람의 요정석
    item2["count"] = 1
    
    local item3 = {}
    item3["itemNum"] = 141 -- 일반 불의 요정석
    item3["count"] = 1
    
    items["Data"] = {item1,item2,item3}
    table.insert( theListOfJujang , items )

    local items = {}
    items["itemNumber"] = 196 -- 아련이성날개
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.6
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 189 -- 아련이날개
    item1["count"] = 2
    
    local item2 = {}
    item2["itemNum"] = 130 -- 마스터땅요
    item2["count"] = 2
    
    local item3 = {}
    item3["itemNum"] = 14 -- 아까비깡 20개
    item3["count"] = 20
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 159 -- 해피쫑
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 139 -- 땅
    item1["count"] = 5
    
    local item2 = {}
    item2["itemNum"] = 140 -- 바람
    item2["count"] = 5
    
    local item3 = {}
    item3["itemNum"] = 141 -- 불
    item3["count"] = 5
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 260 -- 강달이 호랑이세트
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.3
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 15 -- 마알
    item1["count"] = 2
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 2
    
    local item3 = {}
    item3["itemNum"] = 17 -- 개구리
    item3["count"] = 2
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 267 -- 강달이 호랑이세트 벅
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 15 -- 마알
    item1["count"] = 3
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 3
    
    local item3 = {}
    item3["itemNum"] = 17 -- 개구리
    item3["count"] = 3
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 244 -- 강달이 호랑이세트 벅2
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 15 -- 마알
    item1["count"] = 4
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 4
    
    local item3 = {}
    item3["itemNum"] = 17 -- 개구리
    item3["count"] = 4
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 245 -- 강달이 호랑이세트 적
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.4
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 15 -- 마알
    item1["count"] = 4
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 4
    
    local item3 = {}
    item3["itemNum"] = 260 -- 강달이옷
    item3["count"] = 1
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 261 -- 대박이 사자
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.3
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 15 -- 마알
    item1["count"] = 2
    
    local item2 = {}
    item2["itemNum"] = 14 -- 아까비
    item2["count"] = 2
    
    local item3 = {}
    item3["itemNum"] = 17 -- 개구리
    item3["count"] = 2
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 268 -- 대박이 사자 벅
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 15 -- 마알
    item1["count"] = 3
    
    local item2 = {}
    item2["itemNum"] = 14 -- 아까비
    item2["count"] = 3
    
    local item3 = {}
    item3["itemNum"] = 17 -- 개구리
    item3["count"] = 3
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 246 -- 대박이 사자 벅2
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 15 -- 마알
    item1["count"] = 4
    
    local item2 = {}
    item2["itemNum"] = 14 -- 아까비
    item2["count"] = 4
    
    local item3 = {}
    item3["itemNum"] = 17 -- 개구리
    item3["count"] = 4
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 247 -- 대박이 사자 적
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.4
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 15 -- 마알
    item1["count"] = 4
    
    local item2 = {}
    item2["itemNum"] = 14 -- 아까비
    item2["count"] = 4
    
    local item3 = {}
    item3["itemNum"] = 261 -- 사자옷
    item3["count"] = 1
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 263 -- 미단이 개구리
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.3
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 2
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 2
    
    local item3 = {}
    item3["itemNum"] = 14 -- 아까비
    item3["count"] = 2
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 264 -- 미단이 개구리 벅
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 3
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 3
    
    local item3 = {}
    item3["itemNum"] = 14 -- 아까비
    item3["count"] = 3
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 248 -- 미단이 개구리 벅2
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 4
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 4
    
    local item3 = {}
    item3["itemNum"] = 14 -- 아까비
    item3["count"] = 4
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 249 -- 미단이 개구리 적
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.4
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 4
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 4
    
    local item3 = {}
    item3["itemNum"] = 263 -- 개구리옷
    item3["count"] = 1
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 265 -- 무찬이 악어옷
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.3
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 2
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 2
    
    local item3 = {}
    item3["itemNum"] = 146 -- 가루
    item3["count"] = 2
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 266 -- 무찬이 악어옷 벅
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 3
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 3
    
    local item3 = {}
    item3["itemNum"] = 146 -- 가루
    item3["count"] = 3
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 250 -- 무찬이 악어옷 벅2
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 4
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 4
    
    local item3 = {}
    item3["itemNum"] = 146 -- 가루
    item3["count"] = 4
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 251 -- 무찬이 악어옷 적
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.4
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 4
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 4
    
    local item3 = {}
    item3["itemNum"] = 265 -- 무찬이옷
    item3["count"] = 1
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 258 -- 아련이 고양이
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.3
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 2
    
    local item2 = {}
    item2["itemNum"] = 15 -- 마알
    item2["count"] = 2
    
    local item3 = {}
    item3["itemNum"] = 146 -- 가루
    item3["count"] = 2
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 259 -- 아련이 벅고양이
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 3
    
    local item2 = {}
    item2["itemNum"] = 15 -- 마알
    item2["count"] = 3
    
    local item3 = {}
    item3["itemNum"] = 146 -- 가루
    item3["count"] = 3
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 240 -- 아련이 벅고양이 2
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 4
    
    local item2 = {}
    item2["itemNum"] = 15 -- 마알
    item2["count"] = 4
    
    local item3 = {}
    item3["itemNum"] = 146 -- 가루
    item3["count"] = 4
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 241 -- 아련이 고양이 적
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.4
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 17 -- 개구리
    item1["count"] = 4
    
    local item2 = {}
    item2["itemNum"] = 15 -- 마알
    item2["count"] = 4
    
    local item3 = {}
    item3["itemNum"] = 258 -- 고양이옷
    item3["count"] = 1
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 262 -- 나연이 꿀벌옷
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.3
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 15 -- 마알
    item1["count"] = 2
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 2
    
    local item3 = {}
    item3["itemNum"] = 14 -- 아까비
    item3["count"] = 2
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 242 -- 나연이 꿀벌옷 벅
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.2
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 15 -- 마알
    item1["count"] = 3
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 3
    
    local item3 = {}
    item3["itemNum"] = 14 -- 아까비
    item3["count"] = 3
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )
	
	local items = {}
    items["itemNumber"] = 243 -- 나연이 꿀벌옷 적
    items["itemCount"] = 3
    items["rateOfSeccess"] = 0.4
    items["Data"] = {}
    
    local item1 = {}
    item1["itemNum"] = 15 -- 마알
    item1["count"] = 4
    
    local item2 = {}
    item2["itemNum"] = 16 -- 약초
    item2["count"] = 4
    
    local item3 = {}
    item3["itemNum"] = 262 -- 나연옷
    item3["count"] = 1
    
    items["Data"] = {item1,item2,item3}

    table.insert( theListOfJujang , items )

end
