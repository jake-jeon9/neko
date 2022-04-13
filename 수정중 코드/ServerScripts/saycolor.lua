
--버프랑 컬러랑 쌍으로 이루어져야 함. 만약 갯수가 다르면 오류 발생할 수 있음
--버프정보 번호입력
local buff = {11,12,13,14,15,16,17,18,19,20} --DB에 반드시 상태 셋팅을 해야 작동함.
--색상정보 첫번쨰가 버프 1번자리
local colorList = {'#ff5e00','#d49797','#842d2d','#c6ea39','#7eea39','#39ea4d','#39eaa7','#39eac2','#39ceea','#3964ea'}

Server.sayCallback = function(player, text, type)
    local hasBuff = -1;
    
    if type == 0 then -- 근처 채팅
        for t,i in pairs(buff) do -- 몇번 버프를 가지고 있나 확인.
            print("포문 실행중 praris i? "..i.."/t?"..t)
            if player.unit.HasBuff(i) then
                hasBuff = i-10;
                print("버프 번호 : "..hasBuff)
                break
            end
        end

        if hasBuff > 0 then --버프를 가지고 있다면 
            Server.onSay.add(hasTextColor(player.unit,text,colorList[hasBuff])) -- 해당버프를 색상을 실행
            return false
        else -- 버프를 가지고 있지 않다면 기본색상으로 실행
            Server.onSay.add(hasTextColor(player.unit,text,'#000000'))
            return false
        end
    else -- 근처가 아니면
        return true
    end
end

function hasTextColor(unit,text,color)
    print("전달받은 색상 ?"..color)
    unit.Say("<color="..color..">"..text.."</color>" )
    return 
 end