movingSwitch = false
setTime =90
driver = ''
guest = ''
changeToBeAInvisibleCharacter = 999 -- 변신할 캐릭터

function vehicleList(item)
    local list = {352,353,354,355} -- 아이템 목록
	local values = false

	for key,value in pairs(list) do
		if value == item then
			values = true
			return values
		end
	end
	return values
end

function Isgotten()
    local list = {352,353,354,355} -- 아이템 목록
    return list
end

function onLeavePlayerForDriving(player)
    --Server.SendCenterLabel(player.name.."님이 나갔습니다.")
    --print(player.name.."님이 나갔습니다.")

    if player.name == driver then
        --print("나간사람 운전자")
        local guest = find_unit(guest)
        --print("510 Guest : "..guest.GetStringVar(510))
        guest.SendCenterLabel("운전자가 접속을 종료하였습니다. 하차합니다.")
        guest.SetStringVar(510,'')
        guest.FireEvent("나내려")
        local items = {}
        for i=1,9 do
            items[i] = guest.GetEquipItem(i)
            if items[i] ~= nil then
                guest.UnequipItem(items[i].id)
                guest.EquipItem(items[i].id)
            end
        end
        --print("510 Guest 수정후 : "..guest.GetStringVar(510))
        movingSwitch = false
    elseif player.name == guest then
        --print("나간사람 탑승자")
        --print("510 driver : "..driver)
        local driver = find_unit(driver)
        driver.SendCenterLabel("탑승자가 접속을 종료하였습니다.")
        driver.SetStringVar(510,'')
        --print("510 driver 후: "..driver.GetStringVar(510))
        
    end
    driver = ''
    guest = ''
end


function onJoinPlayerForDriving(player)
    local unit = find_unit(player.name)
    if unit.GetStringVar(510) ~= nil or unit.GetStringVar(510) ~='' then
        unit.SetStringVar(510,'')
    end
end

Server.onJoinPlayer.Add(onJoinPlayerForDriving)
Server.onLeavePlayer.Add(onLeavePlayerForDriving)

function takeInCar(unit,text)
    if string.match(text,"/너타 ") then
        local targetid = text:gsub("/너타 ","")
        local target

        if unit.player.name == targetid then
            unit.SendCenterLabel("본인은 태울수 없습니다.")
            return
        end

        if unit.GetStringVar(510) == nil or unit.GetStringVar(510) == '' then
            
        else
            unit.SendCenterLabel("차량에 "..unit.GetStringVar(510).."가 탑승중입니다.")
            return
        end
        
        local canPass = true
        local itemList = Isgotten()
        for i,num in pairs(itemList) do
            --print(i..", "..num)
            if unit.IsEquippedItemByDataID(num) then
                --print(num.."아이템 장착")
                canPass =false
                break
            end    
        end

        if canPass then
            unit.SendCenterLabel("탑승가능한 이동수단을 착용해주세요.")
            return
        end


        for i,v in pairs(Server.players) do -- 
            if v.name == targetid then
                if v.unit.field.name == unit.field.name then
                    target = v.unit
                    unit.SendSay("차탈래"..v.name.."에게 물어봄")
                    target.FireEvent("너탈래",unit.player.name,v.name)
                    return
                else
                    unit.SendCenterLabel("찾으시는 유저가 근처에 없습니다.")
                    return
                end
            end
        end     
        unit.SendCenterLabel("찾으시는 유저가 없습니다.")
    end
end


Server.GetTopic("너타거절").Add(function(nm)
    local target = find_unit(nm)
    target.SendSay("상대방이 탑승 거절하였습니다..")
    unit.SendSay(nm.."의 이동수단 탑승을 거절하였습니다..")
 end)

 
Server.GetTopic("너타승인").Add(function (nm)
    if not nm then
        return
    end
    local target = find_unit(nm)
    
    --투명 캐릭터로 변신(해당캐릭터 이동속도 맥스로)
    --unit.characterID()
    unit.StartGlobalEvent(changeToBeAInvisibleCharacter)--바꿔야함

    target.SendSay("상대방이 탑승 승인하였습니다..")
    unit.SendSay(nm.."의 이동수단 탑승을 승인하였습니다..")

    target.SetStringVar(510,unit.player.name)
    unit.SetStringVar(510,target.player.name)

    --print("내탑승자 :"..unit.GetStringVar(510))
    --print("나는 여기에탑승 :"..target.GetStringVar(510))

    local x1 = target.x
    local y1 = target.y

    local im = unit.player.name
    --print("이름 ."..im)
    unit.SpawnAt(x1, y1)
    --print("탑승 좌표 X :"..x1..",Y :"..y1)
    unit.FireEvent("출발",target.name,1)

    taker = nm
    follower = im
    movingSwitch = true
    for i = 1, setTime do
        called(i)
    end
 end)



function called(i)
    Server.RunLater(function ()
        if movingSwitch then

        else
            return
        end
        local target = find_unit(taker)
        local me = find_unit(follower)

        
        local canPass = true
        local itemList = Isgotten()
        for i,num in pairs(itemList) do
            --print(i..", "..num)
            if target.IsEquippedItemByDataID(num) then
                --print(num.."아이템 장착")
                canPass =false
                break
            end 
        end

        driver = target.player.name
        guest = me.player.name
        

        if canPass then
            movingSwitch = false
            me.FireEvent("나내려")
            driver = ''
            guest = ''
            me.SendCenterLabel("차량에서 내렸습니다.")
            
            
            target.SetStringVar(510,'')
            me.SetStringVar(510,'')
            local items = {}
            for i=1,9 do
                items[i] = me.GetEquipItem(i)
                if items[i] ~= nil then
                    me.UnequipItem(items[i].id)
                    me.EquipItem(items[i].id)
                end
            end

            return
        end

        local x = target.x
        local y = target.y
        --print("타켓 x,y호출완료")
        local fieldId = target.field.dataID
        local targetChannel = target.field.channelID

        --print("이동중 좌표 X :"..x..",Y :"..y)

        local myfield = me.field.dataID

        if movingSwitch then

        else
            return
        end
        --print("where : "..myfield)
        if fieldId == myfield then--같은지역
            --print("같은동네")
            me.FireEvent("이동중",x,y)
        else
            --print("다른동네")
            me.SpawnAtFieldID(fieldId,x, y,targetChannel)
            Server.RunLater(function ()
                me.FireEvent("출발",target.name,2)    
            end,1)
            
        end
        --print("함수끝")
    end,i*2)
    
    Server.RunLater(function ()
        if movingSwitch then

        else
            movingSwitch = false
            return
        end

        movingSwitch = false
        if not unit.player.naem then
            return
        end
        driver = ''
        guest = ''

        unit.FireEvent("나내려")
        unit.SendCenterLabel("차량에서 내렸습니다.")
        local withUser = unit.GetStringVar(510)
        local find_u = find_unit(withUser)
        unit.SetStringVar(510,'')
        find_u.SetStringVar(510,'')
        local items = {}
        for i=1,9 do
            items[i] = unit.GetEquipItem(i)
            if items[i] ~= nil then
                unit.UnequipItem(items[i].id)
                unit.EquipItem(items[i].id)
            end
        end
    end,((setTime*2)+1))

end
    
function GetOutCar(unit,text)
    if string.match(text,"/나내려") then
        if unit.GetStringVar(510) == nil or unit.GetStringVar(510) == '' then
            unit.SendCenterLabel("탑승자가 없습니다.")  
            return  
        end
        unit.SendCenterLabel("차량에서 내렸습니다.")
        movingSwitch = false
        --Server.onTick.Remove(onTick)
        unit.FireEvent("나내려")
        local withUser = unit.GetStringVar(510)
        local find_u = find_unit(withUser)
        unit.SetStringVar(510,'')
        find_u.SetStringVar(510,'')
        driver = ''
        guest = ''

        --print("내탑승자 :"..unit.GetStringVar(510))
        --print("나는 여기에탑승 :"..find_u.GetStringVar(510))
        local items = {}
        for i=1,9 do
            items[i] = unit.GetEquipItem(i)

            if items[i] ~= nil then
                --print("아이템 장착함"..items[i].dataID)
                --print("서버에가가져온 아이템 정보"..items[i].id)
                unit.UnequipItem(items[i].id)
                unit.EquipItem(items[i].id)
            end
            
        end
            
    end
end
    
function kickFromMyCar (unit,text)
    if string.match(text,"/너내려") then
        
        if unit.GetStringVar(510) == nil or unit.GetStringVar(510) == '' then
            unit.SendCenterLabel("탑승중인 유저가 없습니다.")
            return
        end
        local user = unit.GetStringVar(510)
        local find_u = find_unit(user)
        
        find_u.FireEvent("나내려")
        unit.SetStringVar(510,'')
        find_u.SetStringVar(510,'')
        driver = ''
        guest = ''
        --print("내탑승자 :"..unit.GetStringVar(510))
        --print("나는 여기에탑승 :"..find_u.GetStringVar(510))
        movingSwitch = false
        local items = {}
        for i=1,9 do
            items[i] = find_u.GetEquipItem(i)

            if items[i] ~= nil then
                --print("아이템 장착함"..items[i].dataID)
                --print("서버에가가져온 아이템 정보"..items[i].id)
                find_u.UnequipItem(items[i].id)
                find_u.EquipItem(items[i].id)
            end
            
        end
            
    end
end