--채팅명령어 모음
local sayCommend = {}
sayCommend[1] = "/사랑해 할말 - 결혼한 배우자와 1:1 토크, 조건 : 혼인상태" -- 스크립트 위치 결혼
sayCommend[2] = "/가족 할말 - 가족끼리 대화, 조건 : 가족상태" -- 스크립트 위치 결혼
sayCommend[3] = "/너타 아이디 - 차량 탑승한 상태에서 같은 필드안에 대상에게 탑승권유, 조건 : 차량장착" -- 스크립트 위치 너타
sayCommend[4] = "/너내려 - 탑승중인 유저 하차(운전자), 조건 : 탑승자 탑승중" -- 스크립트 위치 너타
sayCommend[5] = "/나내려 - 차량에서 하차(동승자), 조건 : 상대 차량에 탑승중" -- 스크립트 위치 너타

sayCommend[6] ="/친구이리 아이디 - 나보다 낮은 레벨 유저를 소환, 조건 : 친구이리 스킬보유" 
sayCommend[7] ="/친구어디 아이디 - 조회아이디의 위치확인 , 조건 : 친구어디 스킬보유"
sayCommend[8] ="/친구갈래 아이디 - 나보다 낮은 레벨 유저에게 출두, 조건 : 친구갈래 스킬보유"

sayCommend[9] ="/나여기갈래 - 맵이름 ,x,y - 맵아이디와 x,y좌표를 입력하여 특정위치로 이동. 현재 준비중"
sayCommend[10] ="/나고목갈래  - 고목나무 앞으로 이동, 조건 : 해당 스킬보유"
sayCommend[11] ="/나로또갈래 -로또상점앞으로 이동, 조건 : 해당 스킬보유"
sayCommend[12] ="/나낚시갈래 - 비밀지역 낚시상인 앞으로 이동, 조건 : 해당 스킬보유"
sayCommend[13] ="/나시청갈래 - 시청으로 이동, 조건 : 해당 스킬보유"
sayCommend[14] ="/나웨딩갈래1 - 해피시티 웨딩홀로 이동, 조건 : 해당 스킬보유"
sayCommend[15] ="/나웨딩갈래2 - 에버토크 웨딩홀로 이동, 조건 : 해당 스킬보유"
sayCommend[16] ="/나꼬피아갈래 - 꼬피아앞 낚시터로 이동, 조건 : 해당 스킬보유"
sayCommend[17] ="/나유령갈래 - 유령사냥터로 이동, 조건 : 해당 스킬보유"
sayCommend[18] ="/나해피오엑스갈래 - 해피시티 오엑스장으로 이동, 조건 : 해당 스킬보유"
sayCommend[19] ="/나에버오엑스갈래 - 메인마을 오엑스로 이동(현재 보스사냥이벤트 맵으로 이용중), 조건 : 해당 스킬보유"
sayCommend[20] ="/나마녀갈래 - 마녀의집 앞으로 이동(현재 개뼈염색만 가능), 조건 : 해당 스킬보유"

local command = {}
command[1] = "/나고목갈래"
command[2] = "/나로또갈래"
command[3] = "/나낚시갈래"
command[4] = "/나시청갈래"
command[5] = "/나웨딩갈래1"
command[6] = "/나웨딩갈래2"
command[7] = "/나유령갈래"
command[8] = "/나해피오엑스갈래"
command[9] = "/나에버오엑스갈래"
command[10] = "/나마녀갈래"
command[11] = "/나꼬피아갈래"




------------------------------- 콜백-------------------------------

Server.sayCallback = function(u,text)
    if string.match(text,"/도움말") then
        return false
    elseif string.match(text,"/친구이리 ") then
        return false
    elseif string.match(text,"/친구갈래 ") then
        return false
    elseif string.match(text,"/친구어디 ") then
        return false
    elseif string.match(text,"/나고목갈래") then
        return false
    elseif string.match(text,"/나로또갈래") then
        return false
    elseif string.match(text,"/나낚시갈래") then
        return false
    elseif string.match(text,"/나시청갈래") then
        return false
    elseif string.match(text,"/나웨딩갈래1") then
        return false
    elseif string.match(text,"/나웨딩갈래2") then
        return false
    elseif string.match(text,"/나유령갈래") then
        return false
    elseif string.match(text,"/나해피오엑스갈래") then
        return false
    elseif string.match(text,"/나에버오엑스갈래") then
        return false
    elseif string.match(text,"/나마녀갈래") then
        return false
    elseif string.match(text,"/나꼬피아갈래") then
        return false
    elseif string.match(text,"/너타 ") then
        return false
    elseif string.match(text,"/나내려") then
        return false
    elseif string.match(text,"/너내려") then
        return false
    elseif string.match(text,"/사랑해 ") then
        return false
    elseif string.match(text,"/가족 ") then
        return false
    else
        return true
    end
 end
-------------------------------onSay-------------------------------
Server.onSay.add(function (unit,text)
    if string.match(text,"/도움말") then
        unit.FireEvent("커맨드명령어",JSONSerialize(sayCommend))
        return
    elseif string.match(text,"/친구이리 ") then
        ComeFriend(unit,text)
        return 
    elseif string.match(text,"/친구갈래 ") then
        --print("onsay친구갈래 진입")
        GoToFriend(unit,text)
        return 
    elseif string.match(text,"/친구어디 ") then
        whereFriend(unit,text)
        return
    elseif string.match(text,command[1]) then
        Goto(unit,text)
        return
    elseif string.match(text,command[2]) then
        Goto(unit,text)
        return
    elseif string.match(text,command[3]) then
        Goto(unit,text)
        return
    elseif string.match(text,command[4]) then
        Goto(unit,text)
        return
    elseif string.match(text,command[5]) then
        Goto(unit,text)
        return
    elseif string.match(text,command[6]) then
        Goto(unit,text)
        return
    elseif string.match(text,command[7]) then
        Goto(unit,text)
        return
    elseif string.match(text,command[8]) then
        Goto(unit,text)
        return
    elseif string.match(text,command[9]) then
        Goto(unit,text)
        return
    elseif string.match(text,command[10]) then
        Goto(unit,text)
        return
    elseif string.match(text,command[11]) then
        Goto(unit,text)
        return
    elseif string.match(text,"/너타 ") then
        takeInCar(unit,text)
        return
    elseif string.match(text,"/나내려") then
        GetOutCar(unit,text)
        return
    elseif string.match(text,"/너내려") then
        kickFromMyCar (unit,text)
        return 
    elseif string.match(text,"/사랑해 ") then
        sayToMyHoney (unit,text)
        return
    elseif string.match(text,"/가족 ") then
        sayToMyFamilt(unit,text)
        return
    else
    end
end)


--클라에 구현필요
Server.GetTopic("친구갈래").Add(function(text)
    --print("getTopic친구갈래 진입")
    local textline = "/친구갈래 "..text
	GoToFriend(unit,textline)
end)

Server.GetTopic("친구이리").Add(function(text)
    local textline = "/친구이리 "..text
	ComeFriend(unit,textline)
end)

Server.GetTopic("친구어디").Add(function(text)
    local textline = "/친구어디 "..text
	whereFriend(unit,textline)
end)

Server.GetTopic("나어디").Add(function()
	whereIam()
end)

Server.GetTopic("나고목갈래").Add(function()
    Goto(unit,command[1])
end)

Server.GetTopic("나로또갈래").Add(function()
    Goto(unit,command[2])
end)

Server.GetTopic("나낚시갈래").Add(function()
    Goto(unit,command[3])
end)

Server.GetTopic("나시청갈래").Add(function()
    Goto(unit,command[4])
end)

Server.GetTopic("나웨딩갈래1").Add(function()
    Goto(unit,command[5])
end)

Server.GetTopic("나웨딩갈래2").Add(function()
    Goto(unit,command[6])
end)

Server.GetTopic("나유령갈래").Add(function()
    Goto(unit,command[7])
end)

Server.GetTopic("나해피오엑스갈래").Add(function()
    Goto(unit,command[8])
end)

Server.GetTopic("나에버오엑스갈래").Add(function()
    Goto(unit,command[9])
end)

Server.GetTopic("나마녀갈래").Add(function()
    Goto(unit,command[10])
end)

Server.GetTopic("나꼬피아갈래").Add(function()
    Goto(unit,command[11])
end)


function HasSkill(skillNum)
    local has = false
    local skillInfo = unit.GetSkill(skillNum)
    if skillInfo == nil then
        unit.SendCenterLabel("해당 스킬이 없습니다")
        has = false
    else
        has = true
    end
    return has
    
end

function ComeFriend(unit,text)
    if string.match(text,"/친구이리 ") then
        local targetid = text:gsub("/친구이리 ","")

        --조건걸기 (스킬이 있는지?)
        if not HasSkill(171) then
            return
        end
        
        if unit.player.name == targetid then
            unit.SendCenterLabel("자기 자신한텐 사용할 수 없습니다.")
            return
        elseif not targetid then
            unit.SendCenterLabel("상대방 아이디를 입력해주세요.")
            return
        end

        local target_unit = find_unit(targetid)
        
        if target_unit then
            local myLevel = unit.level
            local target_Level = target_unit.level
            
            if myLevel >= target_Level then
                target_unit.FireEvent("친구이리",targetid,unit.player.name)
                unit.SendCenterLabel(targetid.."에게 물어보는중")
            else
                unit.SendCenterLabel("나보다 높은 레벨 유저에겐 사용할 수 없습니다.")
                return
            end

        else
            unit.SendCenterLabel(targetid.."을 찾을 수 없습니다.")
            return
        end
    end
end

Server.GetTopic("친구이리거절").Add(function (target,taker)
    local me = find_unit(taker)
    me.SendCenterLabel(target.." 유저가 거부하였습니다.")

end)

Server.GetTopic("친구이리동의").Add(function (target,taker)
    local takerUnit = find_unit(taker)
    local targetUnit = find_unit(target)

    local my_field,my_x,my_y,my_channel = getLocation(taker)
        
    if my_field then
        takerUnit.SendCenterLabel(target.." 유저를 나에게 불러옵니다.")
        targetUnit.SendCenterLabel(taker.."유저에게 이동합니다.")
        targetUnit.SpawnAtFieldID(my_field,my_x,my_y,my_channel)
    else
        takerUnit.SendCenterLabel("친구이리 오류발생 잠시후 시도해주세요.")
        targetUnit.SendCenterLabel("친구이리 오류발생 잠시후 시도해주세요.")
    end
end)


function GoToFriend(unit,text)
    
    if string.match(text,"/친구갈래 ") then
        local targetid = text:gsub("/친구갈래 ","")
      
        --조건걸기 (스킬이 있는지?)
        if not HasSkill(170) then
            return
        end
        
        if unit.player.name == targetid then
            unit.SendCenterLabel("자기 자신한텐 사용할 수 없습니다.")
            return
        elseif not targetid then
            unit.SendCenterLabel("상대방 아이디를 입력해주세요.")
            return
        end

        local target_unit = find_unit(targetid)
        
        if target_unit then
            local myLevel = unit.level
            local target_Level = target_unit.level

            if myLevel >= target_Level then
                local my_field,my_x,my_y,my_channel = getLocation(targetid)
                
                if my_field then
                    unit.SpawnAtFieldID(my_field,my_x,my_y,my_channel)
                else
                    unit.SendCenterLabel("친구 위치 확인 오류발생..잠시 후 다시 시도해주세요.")
                end


            else
                unit.SendCenterLabel("나보다 높은 레벨 유저에겐 사용할 수 없습니다.")
                return
            end

        else
            unit.SendCenterLabel(targetid.."을 찾을 수 없습니다.")
            return
        end
    else

    end
end

function whereFriend (unit,text)
    if string.match(text,"/친구어디 ") then
        local targetid = text:gsub("/친구어디 ","")
        --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]--
        if not targetid then
            unit.SendCenterLabel("상대방 아이디를 입력해주세요.")
            return
        end

        local target_unit = find_unit(targetid)
        
        if target_unit then
            local myLevel = unit.level
            local target_Level = target_unit.level

            if myLevel >= target_Level then
                local my_field,my_x,my_y,my_channel = getLocation(targetid)
                
                if my_field then
                    unit.SendCenterLabel(targetid.."유저는 ["..target_unit.field.name.."지역 ("..my_channel..")채널 X: "..my_x..", Y: "..my_y.."에 있습니다.")
                else
                    unit.SendCenterLabel("친구 위치 확인 오류발생..잠시 후 다시 시도해주세요.")
                end


            else
                unit.SendCenterLabel("나보다 높은 레벨 유저에겐 사용할 수 없습니다.")
                return
            end

        else
            unit.SendCenterLabel(targetid.."을 찾을 수 없습니다.")
            return
        end
    end
end

function whereIam ()
    local unit = find_unit(unit.player.name)
    local unit_x = unit.x
    local unit_y = unit.y
    local unit_fieldId = unit.field.dataID
    local unit_fieldName = unit.field.name
    unit.SendCenterLabel(string.format("내위치 [맵 : %s /맵아이디 : %d / X : %d, Y : %d]",unit_fieldName,unit_fieldId,unit_x,unit_y))
end


--나 00 갈래

function Goto (unit,text)
    local id =0
    local x= 0
    local y = 0
    local skillId = 0
    if string.match(text,command[1]) then --나고목갈래
         --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]

        id = 36
        x = 538
        y = -366
        skillId = 0
    elseif string.match(text,command[2]) then --나로또갈래
         --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]

        id = 36
        x = 767
        y = -919
        skillId = 0
    elseif string.match(text,command[3]) then --나낚시갈래
         --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]

        id = 29
        x = 1102
        y = -735
        skillId = 0
    elseif string.match(text,command[4]) then--나시청갈래
         --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]

        id = 44
        x = 371
        y = -325
        skillId = 0
    elseif string.match(text,command[5]) then --나웨딩갈래1 (해피)
         --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]

        id = 43
        x = 432
        y = -767
        skillId = 0
    elseif string.match(text,command[6]) then --나웨딩갈래2 (에버)
         --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]

        id = 49
        x = 867
        y = -559
        skillId = 0
    elseif string.match(text,command[7]) then -- 나유령갈래
         --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]

        id = 6
        x = 1396
        y = -582
        skillId = 0
    elseif string.match(text,command[8]) then --나해피오엑스갈래
         --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]

        id = 31
        x = 322
        y = -433
        skillId = 0
    elseif string.match(text,command[9]) then --나에버오엑스갈래
         --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]

        id = 24
        x = 816
        y = -748
        skillId = 0
    elseif string.match(text,command[10]) then -- 나 마녀갈래
         --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]

        id = 47
        x = 108
        y = -223
        skillId = 0
    elseif string.match(text,command[11]) then --나꼬피아갈래
         --조건걸기 (스킬이 있는지?)
        --[[
        if not HasSkill(1) then
            return
        end
        ]]

        id = 17
        x = 791
        y = -277
        skillId = 0
    end

    --조건걸기 (스킬이 있는지?)        
    --[[
    if not HasSkill(1) then
        unit.SendCenterLabel("스킬이 없습니다.")
    end
]]--

--local unit = find_unit(unit.player.name)
unit.SpawnAtFieldID(id,x,y)

end

function getLocation(unitName)
    local unit_id = find_unit(unitName)
    local unit_x = unit_id.x
    local unit_y = unit_id.y
    local unit_field = unit_id.field.dataID
    local targetChannel = unit_id.field.channelID
    return unit_field,unit_x,unit_y,targetChannel
end