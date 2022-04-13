

--local ip = '3.36.140.72:8080'
local ip = '192.168.219.103:8081'
local isDownloaddata = 888;


function onLeavePlayer(player)
    checkServer(player,'out')
    toSendServer(player)


end

Server.onLeavePlayer.Add(onLeavePlayer)

function onJoinPlayer(player)
    checkServer(player,'in')
end

Server.onJoinPlayer.Add(onJoinPlayer)

function toSendServer ( player )

    local member = {}
    member.username = player.name
    member.characterID  = player.unit.characterID
    member.cumulativeEXP  = player.unit.cumulativeEXP
    member.gameMoney  = player.unit.gameMoney
    member.job  = player.unit.job
    member.StringVar  = '1234'
    --t.member.StringVar[1125] = "TEST2"
    --t.member.StringVar[1126] = "2020-11-25"

    local items = {}
    items.username = player.name
    

    
    local invenItems = player.GetItems()
    --print(#invenItems.."의 아이템")
    if #invenItems >0 then
        items.itemName={}
        items.itemNum = {}
        items.itemCnt = {}
        
        for i=1,#invenItems do
            
            if invenItems[i] ~=nil then
                
                local titem = invenItems[i]
                local itemData = Server.GetItem(titem.dataID)
                
                if itemData ~=nil and titem ~=0 then
                    
                    items.itemName[i] = itemData.name
                    items.itemNum[i] = titem.dataID
                    items.itemCnt[i] = titem.count
                    
                end
            end
        end
    else
        
        items.itemName = 'null'
        items.itemNum = '0'
        items.itemCnt = '0'
    end
    -- print(#items.itemName)
    -- print(#items.itemNum)
    -- print(#items.itemCnt)



    local storage = {}
    storage.username = player.name

    storage.storageId = {}
    -- print("----------[[인벤 시작]]-----------")

    for j = 0,1 do
        local storageItems = player.GetStorageItems(j)
        if #storageItems > 0 then
            storage.storageId[j] = {}
            storage.storageId[j].itemNum  = {}
            storage.storageId[j].itemName = {}
            storage.storageId[j].itemCnt = {}
            for i = 1, #storageItems do
                if storageItems[i] ~= nil then
                    local titem = storageItems[i]
                    local itemData = Server.GetItem(titem.dataID)
                    
                    if itemData ~= nil and titem.count ~= 0 then
                        storage.storageId[j].itemNum[i]  = titem.dataID
                        storage.storageId[j].itemName[i] = itemData.name
                        storage.storageId[j].itemCnt[i] = titem.count
                    end
                end
            end
            -- print(j.."번쨰 인벤토리 ----------")
            -- print(#storage.storageId[j])
            -- print(#storage.storageId[j].itemNum)
            -- print(#storage.storageId[j].itemName)
            -- print(#storage.storageId[j].itemCnt)
        end
    end

    -- print("----------[[인벤 종료]]-----------")

    local table = {}
    local j_member = Utility.JSONSerialize(member)
    local j_items = Utility.JSONSerialize(items)
    local j_storage = Utility.JSONSerialize(storage)
    table.type = 'out'
    table.member = j_member
    table.items = j_items
    table.storage = j_storage


    print("----------[[서버 통신 시작]]-----------")
    Server.HttpPost('http://'..ip..'/neko/server/upload.do',table,function (res)
        print("결과 : "..res)
    end)
    
    print("----------[[서버 통신 종료]]-----------")
    
end

function checkServer(player,type)
    local t = {}
    t.username = player.name
    t.type = type
    --print(name)
    Server.HttpPost('http://'..ip..'/neko/server/checker.do',t,function (res)
    end)
end

function togetSever(unit)

    local target = searchUser(unit.player.name)
    
    if target.GetStringVar(isDownloaddata) ~= nil and target.GetStringVar(isDownloaddata) ~= "" then
        target.SendCenterLabel("이미 백업되되었습니다.")
        return
    end

    local t = {}
    local tb = {}

    t.username = unit.player.name
    Server.HttpPost('http://'..ip..'/neko/server/download.do',t,function (res)

        local k = string.gsub( res,'\\/','' )
        tb = Utility.JSONParse(k)
        local itemsRT = tb["itemsRT"]
        local storageRT = tb["storageRT"]
        local memberRT = tb["memberRT"]
        -- print("itemsRT : "..itemsRT)
        -- print("storageRT : "..storageRT)
        -- print("memberRT : "..memberRT)
        

        local chk_item = false
        local chk_storage = false
        local chk_member = false

        local items = {}
        local member = {}
        local storage = {}
        if itemsRT == "OK" then
            items = tb["items"]
            chk_item = true
        end
        if storageRT == "OK" then
            storage = tb["storage"]
            chk_storage = true
        end
        if memberRT == "OK" then
            member = tb["member"]
            chk_member = true
        end

        local user = member["username"]
        local target = searchUser(user)

        --print("타겟 입장")
        if chk_member then
            target.AddEXP(member["cumulativeEXP"])
            target.AddGameMoney(member["gameMoney"])
            target.SetJob(member["jobId"],true)
            target.characterID = member["characterID"]    
        end


        if chk_item then
            for i=1, #items do
                --print(i.."번째")
                data = items[i]

                local name,cnt,dataId
                for key,value in pairs(data) do
                    if key == "itemCnt" then
                        cnt = value
                    elseif key == "dataID" then
                        dataId = value
                    end
                end
                --print(dataId.."의 아이템 "..cnt)
                target.AddItem(dataId,cnt,false)
            end
        end

        
        if chk_storage then
            

        end

        target.SetStringVar(isDownloaddata,"get");

    end)

end


function searchUser(nm)
    for i,v in pairs(Server.players) do
        if v.name == nm then
            --print("대상 찾음")
            return v.unit
        end
    end
end
