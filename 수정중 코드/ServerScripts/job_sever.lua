
Server.RunLater(function()
    --print("헬로")
    listOfJujnag ()      --주장이 아이템 리스트
    listOfMagicCooking ()-- 마법요리 아이템 리스트
end, 3)

function ItemList(items,itemsCount,TYPE) 
    --print("리스트진입")
    local ITEMS = Utility.JSONParse(items)
    local ITEMSCOUNT = Utility.JSONParse(itemsCount)

    local itemNumber = 0

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

    local firstitem = false
    local seconditem = false
    local thirdItem = false
    local forthitem = false -- 아직 미사용
    local fifthitem = false -- 아직 미사용


    local items = {}
    items["itemNumber"] = 0
    items["itemCount"] = #item
    items["Data"] = {}

    
    for i = 1 , #item do
        local itemarry = {}
        itemarry["itemNum"] =item[i]
        itemarry["count"] = count[i]
        table.insert( items["Data"] , itemarry )
    end

    
    if #item == 2 then
        thirdItem = true
        forthitem = true -- 아직미사용
        fifthitem = true -- 아직미사용
    elseif #item==3 then
        forthitem = true -- 아직미사용
        fifthitem = true -- 아직미사용
    elseif #item == 4 then
        fifthitem = true -- 아직미사용
    end

    local targetItemNum = 0
    local targetItemRateOfSeccess = 0

    --print("items 갯수? "..items["itemCount"])
    --print("--------------")

    local isDone = false

    local tempList = {}
    
    if TYPE == "JUJANG" then
        tempList = theListOfJujang
    elseif TYPE == "MAGICCOOKING" then
        tempList = theListOfMagicCooking
    end

    for i,Li in pairs(tempList) do
        if isDone then
            --print("반복문 탈출")
            break
        end
        --print("포문 진입..")
        --print("타켓 아이템 갯수?"..items.itemCount)
        --print("LI 아이템 갯수? "..Li.itemCount)
        if Li.itemCount == items["itemCount"] then
            -- print("아이템 갯수 매치 진입")
            local counter = 0
            for k, Litem in pairs(Li.Data) do
                --print("카운터 ? "..counter)
                -- print("타켓아이템 ")
                -- print("아이템 : "..Litem.itemNum)
                -- print("갯수 : "..Litem.count)
                
                for m , itemarry in pairs(items["Data"]) do
                    -- print(m.."번 아이템"..itemarry["itemNum"])
                    -- print(m.."번 개수"..itemarry["count"])
                    if Litem.itemNum == itemarry["itemNum"] then
                        if Litem.count == itemarry["count"] then
                            --print(m.."번 타겟 아이템 갯수 일치  카운트업")
                            counter = counter +1
                            break
                        end
                    end
                    --print("------------------------------------")
                end

                if counter ~= 0  then
                    --print(counter.."번째 아이템 매치")
                    if counter> 0 then
                        firstitem = true
                    end
                    if counter >1 then
                        seconditem = true
                    end
                    if counter > 2 then
                        thirdItem = true
                    end
                    if counter > 3 then
                        forthitem = true -- 아직미사용
                    end
                    if counter > 4 then
                        fifthitem = true -- 아직미사용
                    end

                    if items["itemCount"]== counter then
                        targetItemNum = Li.itemNumber
                        targetItemRateOfSeccess = Li.rateOfSeccess
                        -- print(counter.."번째 까지 매치됨. 아이템 리턴? "..targetItemNum)
                        -- print(counter.."번째 까지 매치됨. 아이템 확률은? "..targetItemRateOfSeccess*10)
                        isDone = true
                    end
                end
            end
        end
    end

    if firstitem and seconditem and thirdItem  then
        local randomN = math.random( 1,10)
        targetItemRateOfSeccess = targetItemRateOfSeccess * 10
        --print("랜덤 숫자 :"..randomN)
        if targetItemRateOfSeccess >= randomN then
            --print("확률 60% 에 진입")
            itemNumber = targetItemNum
        else
            --print("확률 40% 에 진입")
            itemNumber = 14
        end
    else
        itemNumber = 14
    end

    return itemNumber
end

function jobMakingStart(TYPE)
	local Q, W, E=  {}, {},{}
    local user_items = unit.player.GetItems()
	for i, p in pairs(user_items) do
		table.insert(Q, p.dataID)
		table.insert(W, p.id)
		table.insert(E, p.count)
	end

	local q, w, e = Utility.JSONSerialize(Q), Utility.JSONSerialize(W), Utility.JSONSerialize(E)
	unit.FireEvent("MakingJob", q, w, e, TYPE)
end
