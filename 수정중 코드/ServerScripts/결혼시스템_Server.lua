

function find_unit(nm)
    for i,v in pairs(Server.players) do
        if v.name == nm then
            --unit.SendSay("유닛찾음")
            return v.unit
        end
    end
end

function find_name(id)
    for i,v in pairs(Server.players) do
        if v.id == id then
            --unit.SendSay("유닛찾음")
            return v.unit
        end
    end
end

Server.GetTopic("결혼신청").Add(function(nm)--배우자 이름
   if nm == "토토비" then
      unit.SendCenterLabel("토토비에게는 청혼하실 수 없습니다.")
      return
   end
   if unit.player.name == nm then
      unit.SendCenterLabel("본인에게는 신청할 수 없습니다.")
      return
   end
   local find_marr = find_unit(nm)
   if find_marr then
      if find_marr.GetStringVar(115) ~= nil and find_marr.GetStringVar(115) ~= "" then
         unit.SendCenterLabel(find_marr.name.."님은 배우자가 있습니다.")
      else
         unit.SendSay(find_marr.GetStringVar(115))
         unit.SendCenterLabel(find_marr.name.."님에게 결혼을 신청하였습니다.")
            find_marr.FireEvent("결혼신청대기", unit.player.name)--내이름, 배우자이름
      end
   else
      unit.SendCenterLabel("찾으시는 배우자가 없습니다.")
   end
    --[[for i,v in pairs(Server.players) do
      if 
        if v.name == nm then
            v.unit.SetStringVar(116,unit.player.name)
            if v.unit.GetStringVar(115) == nil then
            unit.SendSay(v.unit.GetStringVar(115))
            unit.SendCenterLabel(v.name.."님에게 결혼을 신청하였습니다.")
                v.unit.FireEvent("결혼신청대기",unit.player.name)
            else
            unit.SendCenterLabel(v.name.."님은 배우자가 있습니다.")
            end
            userbool = true
            break
        else
            userbool = false
        end
    end
    if userbool == false then
        unit.SendCenterLabel("찾으시는 배우자가 없습니다.")
    end]]--
end)

function Marry_System()
    --unit.SendSay(unit.GetStringVar(115))
   if unit.GetStringVar(115) ~= nil and unit.GetStringVar(115) ~= "" then
      unit.SendCenterLabel("이미 결혼을 하셨습니다.")
   else
        unit.FireEvent("결혼")
   end
end

Server.GetTopic("결혼수락").Add(function(nm)
   local married_time = os.date("%Y년 %m월 %d일",os.time()+32400)
   local married_man = find_unit(nm)
   if married_man then
      unit.SetStringVar(115,nm)
      unit.SetStringVar(117,married_time)
      married_man.SetStringVar(115,unit.player.name)
      married_man.SetStringVar(117,married_time)
      unit.AddItem(1250,1)
      married_man.AddItem(1250,1)
      unit.SendSay("결혼을 기념하여 운영자 축하 선물 [결혼 반지]를 지급받았습니다.")
      married_man.SendSay("결혼을 기념하여 운영자 축하 선물 [결혼 반지]를 지급받았습니다.")
      Server.SendCenterLabel(unit.player.name.."님과 "..unit.GetStringVar(115).."님의 혼인신고가 접수 되었습니다.")   
   end
end)

Server.GetTopic("결혼거절").Add(function(nm)
   local target = find_unit(nm)
   target.SendSay("상대방이 결혼을 거절하였습니다..")
   unit.SendSay("결혼을 거절하였습니다..")
end)

function sayToMyHoney (unit,text)
   if string.match(text,"/사랑해 ") then
        text = text:gsub("/사랑해 ","")
        if unit.GetStringVar(115) ~= nil and unit.GetStringVar(115) ~= "" then
            for i,v in pairs(Server.players) do
                if v.name == unit.GetStringVar(115) then
                    marr = v.unit
                    break
                else
                    marr = nil
                end
            end
            if marr == nil then
                unit.SendCenterLabel("배우자가 비활성화 상태입니다.")
            else
                unit.SendSay("<color=#FF00CC>"..unit.name..": ♥ "..text.."</color>")
                marr.SendSay("<color=#FF00CC>"..unit.name..": ♥ "..text.."</color>")
            end
        else
         unit.SendSay("<color=Red>[!]부부 사이만 이용 가능한 시스템입니다.</color>")
        end
    end
end


-- 이혼 시작


function Devorce_System()
   if unit.GetStringVar(115) == nil and unit.GetStringVar(115) == "" then
      unit.SendCenterLabel("결혼한 상태가 아닙니다.")
   else
        unit.FireEvent("이혼")
   end
end

Server.GetTopic("이혼신청").Add(function(nm)--배우자 이름
   
   if unit.player.name == nm then
      unit.SendCenterLabel("본인에게는 신청할 수 없습니다.")
      return
   end

   local find_marr = find_unit(nm) -- 배우자 이름
   local find_marr_family = find_marr.GetStringVar(500)
   local myFamily = unit.GetStringVar(500)
   local firstChild = unit.GetStringVar(501)
   
   if find_marr_family == myFamily then
      if firstChild ~= nil or firstChild ~= '' then
         unit.SendCenterLabel("자녀가 있는 상태에선 이혼하실 수 없습니다. 파양을 먼저해주세요.")
         return
      end
   end

   if find_marr then -- 케이스 1 대상이 배우자 없을때
       if find_marr.GetStringVar(115) == unit.player.name then -- 내 배우자가 맞는지 확인하고 진행
         if unit.IsEquippedItem(1250) and find_marr.IsEquippedItem(1250) then
            unit.SendCenterLabel("당사자와 배우자 모두 결혼 반지를 장착 해제 후 이혼이 가능합니다. ")
            find_marr.SendCenterLabel("당사자와 배우자 모두 결혼 반지를 장착 해제 후 이혼이 가능합니다. ")
         else
            unit.SendSay(find_marr.GetStringVar(115))
             unit.SendCenterLabel(find_marr.name.."님에게 이혼을 신청하였습니다.")
            find_marr.FireEvent("이혼신청대기", unit.player.name)--내이름, 배우자이름
         end
          
        else
            unit.SendCenterLabel(find_marr.."과(와) 결혼한 상태가 아닙니다.")
      end
   else
      unit.SendCenterLabel("찾으시는 배우자가 없습니다.")
   end
end)


Server.GetTopic("이혼수락").Add(function(nm)
   local married_man = find_unit(nm)
   if married_man then
      unit.SetStringVar(115,"")
      unit.SetStringVar(117,"")
      married_man.SetStringVar(115,"")
      married_man.SetStringVar(117,"")
      unit.RemoveItem(1250,10,false,false,true)
      married_man.RemoveItem(1250,10,false,false,true)
      unit.SendSay("이혼을 하여 결혼반지는 회수됩니다.")
      married_man.SendSay("이혼을 하여 결혼반지는 회수됩니다.")
      Server.SendCenterLabel(unit.name.."님과 "..nm.."님의 이혼 신고가 접수 되었습니다.")   
   end
end)

Server.GetTopic("이혼거절").Add(function(nm)
   local target = find_unit(nm)
   target.SendSay("상대방이 이혼을 거절하였습니다..")
   unit.SendSay("이혼을 거절하였습니다..")
end)




--[[ 페밀리 제도 시작]]

function getRequireMoney()
   return 1000000
end

function getAddChildRequireMoney()
   return 5000000
end

Server.GetTopic("가족신청").Add(function(family_name,child_name)--가족만들기 이름
   local money = unit.gameMoney
   local requireMoney = getRequireMoney()


   --print("가족신청 진입")
   --print("unit.GetStringVar(115) : "..unit.GetStringVar(115))
   --print("child_name : "..child_name)
   --print("unit.player.name : "..unit.player.name)
   --print("family_name : "..family_name)

   if money <requireMoney then
      unit.SendCenterLabel("비용이 부족합니다.\n가족 신청 비용은"..requireMoney.."입니다.")
      return

   elseif string.len(family_name) > 5 then
      unit.SendCenterLabel("가족명은 4글자 이하만 가능합니다.")

   elseif unit.GetStringVar(115) == nil or unit.GetStringVar(115) == '' then
      unit.SendCenterLabel("결혼한 상태에서만 가족신청이 가능합니다.")
      return
   elseif child_name == '동아리회장' then
      unit.SendCenterLabel("운영자에게는 신청할 수 없습니다.")
      return
   
   elseif unit.GetStringVar(115) == child_name then
      unit.SendCenterLabel("배우자는 자녀가 될 수 없습니다.")
      return

   elseif unit.player.name == child_name then
      unit.SendCenterLabel("본인에게는 신청할 수 없습니다.")
      return
   end

   local couple = unit.GetStringVar(115)
   local find_couple = find_unit(couple) -- 배우자
   --print(couple.."<<가족신청자 배우자")


   for i,v in pairs(Server.players) do
      if v.unit.GetStringVar(500) == family_name then
         --print(family_name.."가족명은 이미 사용중")
         unit.SendCenterLabel(family_name.."명은 이미 사용중입니다.")
         return
      end
   end

   local find_child = find_unit(child_name)
   if find_child then
      if find_child.GetStringVar(500) ~= nil and find_child.GetStringVar(500) ~= "" then
         unit.SendCenterLabel(child_name.."님은 이미 가족이 있습니다.")
         return
      else
         --unit.SendSay(find_child.GetStringVar(500))
         --print("가족신청 fier이벤트 시도")
         unit.SendCenterLabel(find_child.name.."님에게 가족명["..family_name.."] 신청하였습니다.")
         find_couple.SendCenterLabel(unit.player.name.."님이 "..find_child.name.."님에게 가족명["..family_name.."]을 신청하였습니다.")
         find_child.FireEvent("가족신청대기", unit.player.name,family_name,couple,find_child.name)--내이름, 배우자이름
      end
   else
      unit.SendCenterLabel("찾으시는"..child_name.."님이 없습니다.")
   end
end)

function Family_System()
      --unit.SendSay(unit.GetStringVar(115))
   if unit.GetStringVar(500) ~= nil and unit.GetStringVar(500) ~= "" then
      unit.SendCenterLabel("이미 가족이 있습니다.")
   else
      unit.FireEvent("가족")
   end
end

Server.GetTopic("가족거절").Add(function(couple1,couple2)
   unit.SendSay("가족신청을 거절하였습니다..")
   local unit1 = find_unit(couple1)
   local unit2 = find_unit(couple2)
   unit1.SendCenterLabel("상대방이 가족구성 거절하였습니다..")
   unit2.SendCenterLabel("상대방이 가족구성 거절하였습니다..")
end)


Server.GetTopic("가족수락").Add(function(parent1,family_name,parent2)
   local married_time = os.date("%Y년 %m월 %d일",os.time()+32400)

   local find_parnet1 = find_unit(parent1)
   local find_parnet2 = find_unit(parent2)

   local requireMoney = getRequireMoney()
   local money = find_parnet1.gameMoney

   if money < requireMoney then
      find_parnet1.SendCenterLabel("가족 신청 비용이 부족하여 실패하였습니다.\n 필요한 비용은"..requireMoney.."원 입니다.")
      return
   else
      find_parnet1.UseGameMoney(requireMoney)
      find_parnet1.SendCenterLabel("가족 신청 비용 ["..requireMoney.."]원을 지불하였습니다.")
   end
   
   if find_parnet1 ~=nil and find_parnet2 ~=nil then
      --자녀
      unit.SetStringVar(500,family_name)
      unit.SetStringVar(501,unit.player.name)
      unit.SetStringVar(504,married_time)
      --부모1
      find_parnet1.SetStringVar(500,family_name)
      find_parnet1.SetStringVar(501,unit.player.name)
      find_parnet1.SetStringVar(504,married_time)

      --부모2
      find_parnet2.SetStringVar(500,family_name)
      find_parnet2.SetStringVar(501,unit.player.name)
      find_parnet2.SetStringVar(504,married_time)

      --[[아이템 지급
      unit.AddItem(1250,1)
      find_couple1.AddItem(1250,1)
      find_child1.AddItem(1250,1)
      unit.SendSay("가족기념 기념하여 0000를 지급받았습니다.")
      find_couple1.SendSay("가족기념 기념하여 0000를 지급받았습니다.")
      find_child1.SendSay("가족기념 기념하여 0000를 지급받았습니다.")
      ]]--

      unit.SendSay(family_name.."의 구성을 축하드립니다.")
      find_parnet1.SendSay(family_name.."의 구성을 축하드립니다.")
      find_parnet2.SendSay(family_name.."의 구성을 축하드립니다.")

      Server.SendCenterLabel(parent1.."님과 "..parent2.."님의 자녀 "..unit.player.name.."가 "..family_name.." 가족으로 구성되었습니다.")   
   end
end)

function sayToMyFamilt(unit,text)
   if string.match(text,"/가족 ") then
         text = text:gsub("/가족 ","")
         if unit.GetStringVar(500) ~= nil and unit.GetStringVar(500) ~= "" then
            local family_name = unit.GetStringVar(500)
            for i,v in pairs(Server.players) do
                  if v.unit.GetStringVar(500) == unit.GetStringVar(500) then
                     target1 = v.unit
                     if target1 ~= nil then
                        target1.SendSay("<color=#FF00CC> "..unit.name..":  "..text.."</color>")
                     end
                  end
               end
         else
         unit.SendSay("<color=Red>[!]가족 사이만 이용 가능한 시스템입니다.</color>")
         end
      end
end

function Family_System_Add_Child()
   --unit.SendSay(unit.GetStringVar(115))
if unit.GetStringVar(500) == nil or unit.GetStringVar(500) == "" then
   unit.SendCenterLabel("가족이 없습니다. 먼저 가족부터 구성하세요.")
elseif unit.GetStringVar(503) ~= nil or unit.GetStringVar(503) ~= '' then
   unit.SendCenterLabel("5인가족 구성이 모두 완료되었습니다.")
else
   unit.FireEvent("가족추가",unit.GetStringVar(500))
end
end

Server.GetTopic("내가족명").Add(function ()
--   print("내가족명 진입")
   if unit.GetStringVar(500) ~= nil or unit.GetStringVar(500) ~= '' then
      local family_name = unit.GetStringVar(500)
  --    print("함수 진입")
      unit.FireEvent("가족추가",family_name)
   end
end)

Server.GetTopic("가족추가신청").Add(function(child_name,family_name)--가족만들기 이름
   local count = 0
   local isChild = false
   for i,v in pairs(Server.players) do
      if v.unit.GetStringVar(500) == family_name then
         count = count+1
      end
      if v.unit.GetStringVar(501) == unit.player.name then
         isChild = true
      elseif v.unit.GetStringVar(502) == unit.player.name then
         isChild = true
      elseif v.unit.GetStringVar(503) == unit.player.name then
         isChild = true
      end
   end


   if count == 5 then
      unit.SendCenterLabel("5인 가족 구성이 모두 완료되었습니다.")
      return
   end

   local money = unit.gameMoney
   local requireMoney = getAddChildRequireMoney()
   if money <requireMoney then
      unit.SendCenterLabel("비용이 부족합니다.\n가족 신청 비용은"..requireMoney.."입니다.")
      return

   elseif unit.GetStringVar(500) == nil or unit.GetStringVar(500) == '' then
      unit.SendCenterLabel("가족이 구성된 상태에서만 자녀 추가 신청이 가능합니다.")
      return
   elseif child_name == '동아리회장' then
      unit.SendCenterLabel("운영자에게는 신청할 수 없습니다.")
      return

   elseif unit.GetStringVar(115) == child_name then
      unit.SendCenterLabel("배우자는 자녀가 될 수 없습니다.")
      return

   elseif unit.player.name == child_name then
      unit.SendCenterLabel("본인에게는 신청할 수 없습니다.")
      return

   elseif unit.GetStringVar(501) == child_name then
      --print("unit의 501? "..unit.GetStringVar(501))
      unit.SendCenterLabel(child_name.."은 이미 자녀입니다.")
      return
   elseif isChild then
      unit.SendCenterLabel("자녀는 자식추가를 신청할 수 없습니다.")
      return
   end

   local couple = unit.GetStringVar(115)
   local find_couple = find_unit(couple)

   if unit.GetStringVar(501) ==nil or unit.GetStringVar(501) == '' then
      local find_child = find_unit(child_name)
      if find_child then
         if find_child.GetStringVar(500) ~= nil and find_child.GetStringVar(500) ~= "" then
            unit.SendCenterLabel(child_name.."님은 이미 가족이 있습니다.")
            return
         else
            --unit.SendSay(find_child.GetStringVar(500))
            --print("가족신청 fier이벤트 시도")
            if find_couple then
               find_couple.SendCenterLabel(unit.player.name.."님이 "..find_child.name.."님에게 가족명["..family_name.."]을 신청하였습니다.")
            else
               unit.SendCenterLabel("가족이 모두 접속해 있어야 새로운 가족을 맞이할 수 있습니다. ") 
               return
            end
            unit.SendCenterLabel(child_name.."님에게 가족명["..family_name.."] 신청하였습니다.")
            find_child.FireEvent("자녀입양대기", unit.player.name,family_name,couple,child1,child_name)
            return
         end
      else
         unit.SendCenterLabel("찾으시는"..child_name.."님이 없습니다.")
         return
      end

   elseif unit.GetStringVar(502) ==nil or unit.GetStringVar(502) == '' then
      --둘째 진입.
      local child1 = unit.GetStringVar(501)
      local child_unit = find_unit(child1)

      local find_child = find_unit(child_name)
      if find_child then
         if find_child.GetStringVar(500) ~= nil and find_child.GetStringVar(500) ~= "" then
            unit.SendCenterLabel(child_name.."님은 이미 가족이 있습니다.")
            return
         else
            --unit.SendSay(find_child.GetStringVar(500))
            --print("가족신청 fier이벤트 시도")
            if find_couple then
               find_couple.SendCenterLabel(unit.player.name.."님이 "..find_child.name.."님에게 가족명["..family_name.."]을 신청하였습니다.")
            else
               unit.SendCenterLabel("가족이 모두 접속해 있어야 새로운 가족을 맞이할 수 있습니다. ") 
               return
            end
            if child_unit then
               child_unit.SendCenterLabel(unit.player.name.."님이 "..find_child.name.."님에게 가족명["..family_name.."]을 신청하였습니다.")
            else
               unit.SendCenterLabel("가족이 모두 접속해 있어야 새로운 가족을 맞이할 수 있습니다. ") 
               return
            end
            unit.SendCenterLabel(child_name.."님에게 가족명["..family_name.."] 신청하였습니다.")
            find_child.FireEvent("자녀입양대기", unit.player.name,family_name,couple,child1,child_name)
            return
         end
      else
         unit.SendCenterLabel("찾으시는"..child_name.."님이 없습니다.")
         return
      end
   else--셋째 시작
      --둘쨰랑 같은지?
      if unit.GetStringVar(502) == child_name then
         unit.SendCenterLabel(child_name.."은 이미 자녀입니다.")
         return
      else
         local child1 = unit.GetStringVar(501)
         local child_unit1 = find_unit(child1)
         local child2 = unit.GetStringVar(502)
         local child_unit2 = find_unit(child2)
   
         local find_child = find_unit(child_name)
         if find_child then
            if find_child.GetStringVar(500) ~= nil and find_child.GetStringVar(500) ~= "" then
               unit.SendCenterLabel(child_name.."님은 이미 가족이 있습니다.")
               return
            else
               --print("가족신청 fier이벤트 시도")
               if find_couple then
                  find_couple.SendCenterLabel(unit.player.name.."님이 "..find_child.name.."님에게 가족명["..family_name.."]을 신청하였습니다.")
               else
                  unit.SendCenterLabel("가족이 모두 접속해 있어야 새로운 가족을 맞이할 수 있습니다. ") 
                  return
               end
               if child_unit1 then
                  child_unit1.SendCenterLabel(unit.player.name.."님이 "..find_child.name.."님에게 가족명["..family_name.."]을 신청하였습니다.")
               else
                  unit.SendCenterLabel("가족이 모두 접속해 있어야 새로운 가족을 맞이할 수 있습니다. ") 
                  return
               end
               if child_unit2 then
                  child_unit2.SendCenterLabel(unit.player.name.."님이 "..find_child.name.."님에게 가족명["..family_name.."]을 신청하였습니다.")
               else
                  unit.SendCenterLabel("가족이 모두 접속해 있어야 새로운 가족을 맞이할 수 있습니다. ") 
                  return
               end

               unit.SendCenterLabel(find_child.name.."님에게 가족명["..family_name.."] 신청하였습니다.")
               find_child.FireEvent("자녀입양대기", unit.player.name,family_name,couple,child1,child_name,child2)--내이름, 배우자이름
            end
         else
            unit.SendCenterLabel("찾으시는"..child_name.."님이 없습니다.")
         end
      end
   end
end)


Server.GetTopic("입양수락").Add(function(parent1,family_name,parent2,child1,child2)
   local married_time = os.date("%Y년 %m월 %d일",os.time()+32400)

   local find_parnet1 = find_unit(parent1)
   local find_parnet2 = find_unit(parent2)
   local find_child1 = nil
   local find_child2 = nil

   local requireMoney = getAddChildRequireMoney()
   local money = find_parnet1.gameMoney

   if money < requireMoney then
      find_parnet1.SendCenterLabel("가족 신청 비용이 부족하여 실패하였습니다.\n 필요한 비용은"..requireMoney.."원 입니다.")
      return
   else
      find_parnet1.UseGameMoney(requireMoney)
      find_parnet1.SendCenterLabel("가족 신청 비용 ["..requireMoney.."]원을 지불하였습니다.")
   end


   --3번쨰 자녀 케이스
   if child2 ~= nil then
      find_child2 = find_unit(child2)
      find_child1 = find_unit(child1)
      find_parnet1.SetStringVar(503,unit.player.name)
      find_parnet2.SetStringVar(503,unit.player.name)
      find_child1.SetStringVar(503,unit.player.name)
      find_child2.SetStringVar(503,unit.player.name)

      unit.SetStringVar(500,family_name)
      unit.SetStringVar(501,child1)
      unit.SetStringVar(502,child2)
      unit.SetStringVar(503,unit.player.name)
      unit.SetStringVar(504,married_time)

      unit.SendSay(family_name.."에 가족이 되신 것을 축하드립니다.")
      find_parnet1.SendSay(family_name.."의 셋째 ["..unit.player.name.."]가 추가되었습니다. 축하드립니다.")
      find_parnet2.SendSay(family_name.."의 셋째 ["..unit.player.name.."]가 추가되었습니다.축하드립니다.")
      find_child1.SendSay(family_name.."의 셋째 ["..unit.player.name.."]가 추가되었습니다.축하드립니다.")
      find_child2.SendSay(family_name.."의 셋째 ["..unit.player.name.."]가 추가되었습니다.축하드립니다.")
      Server.SendCenterLabel(parent1.."님과 "..parent2.."님의 셋째 자녀 "..unit.player.name.."가 "..family_name.." 가족이 되었습니다.")   

      --아이템 지급
      --unit.AddItem(1250,1)
      --unit.SendSay("가족기념 기념하여 0000를 지급받았습니다.")

   elseif child1 ~= nil then --2번쨰 자녀 케이스
         find_child1 = find_unit(child1)
         find_parnet1.SetStringVar(502,unit.player.name)
         find_parnet2.SetStringVar(502,unit.player.name)
         find_child1.SetStringVar(502,unit.player.name)
   
         unit.SetStringVar(500,family_name)
         unit.SetStringVar(501,child1)
         unit.SetStringVar(502,unit.player.name)
         unit.SetStringVar(504,married_time)
   
         unit.SendSay(family_name.."에 가족이 되신 것을 축하드립니다.")
         find_parnet1.SendSay(family_name.."의 둘째 ["..unit.player.name.."]가 추가되었습니다. 축하드립니다.")
         find_parnet2.SendSay(family_name.."의 둘째 ["..unit.player.name.."]가 추가되었습니다.축하드립니다.")
         find_child1.SendSay(family_name.."의 둘째 ["..unit.player.name.."]가 추가되었습니다.축하드립니다.")
         Server.SendCenterLabel(parent1.."님과 "..parent2.."님의 둘째 자녀 "..unit.player.name.."가 "..family_name.." 가족이 구성되었습니다.")   
   
         --아이템 지급
         --unit.AddItem(1250,1)
         --unit.SendSay("가족기념 기념하여 0000를 지급받았습니다.")
      end
end)




-- 가족 파산

Server.GetTopic("내가족명1").Add(function ()
   --   print("내가족명 진입")
      if unit.GetStringVar(500) ~= nil or unit.GetStringVar(500) ~= '' then
         local family_name = unit.GetStringVar(500)
     --    print("함수 진입")
         unit.FireEvent("자식파양",family_name)
      end
   end)


function Family_System_Remove_Child()
   --unit.SendSay(unit.GetStringVar(115))
if unit.GetStringVar(500) == nil or unit.GetStringVar(500) == "" then
   unit.SendCenterLabel("가족이 없습니다.")
else
   unit.FireEvent("자식파양",unit.GetStringVar(500))
end
end

Server.GetTopic("자녀파양").Add(function(target_name,family_name)

  local find_child = find_unit(target_name) -- 자녀이름
  local childFamilyName = find_child.GetStringVar(500)
  
--배우자 
  local isChild = false
for i,v in pairs(Server.players) do
   if v.unit.GetStringVar(501) == unit.player.name then
      isChild = true
   elseif v.unit.GetStringVar(502) == unit.player.name then
      isChild = true
   elseif v.unit.GetStringVar(503) == unit.player.name then
      isChild = true
   end
end

if unit.player.name == target_name then
   unit.SendCenterLabel("본인에게는 신청할 수 없습니다.")
   return
elseif childFamilyName ~= family_name then
   unit.SendCenterLabel(target_name.." 유저는 ["..family_name.."]가 아닙니다.")
   return
elseif isChild then
   unit.SendCenterLabel("자녀는 가족을 파양할 수 없습니다.")
   return
elseif unit.GetStringVar(115) == target_name then
   unit.SendCenterLabel("배우자를 파양할 수 없습니다.")
   return
end

--몇번쨰 자녀인지 확인
local partner = unit.GetStringVar(115)
local isFirst = unit.GetStringVar(501)
local isSecond = unit.GetStringVar(502)
local isThird = unit.GetStringVar(503)

local find_partner = find_unit(partner)
local find_First = find_unit(isFirst)
local find_Second = find_unit(isSecond)
local find_Third = find_unit(isThird)

local targetNum = 0

if isFirst == target_name then
   targetNum = 501
elseif isSecond == target_name then
   targetNum = 502
elseif isThird==target_name then
   targetNum = 503
end

if targetNum == 0 then
   unit.SendCenterLabel("자녀는 가족을 파양 신청을 할 수 없습니다.")
   return
elseif not find_partner then
   unit.SendCenterLabel("배우자 없이는 자녀 파양 신청을 할 수 없습니다.")
   return
end

  if find_child then -- 케이스 1 대상이 배우자 없을때
      if find_child.GetStringVar(500) == unit.GetStringVar(500) then
         if find_partner then
            find_partner.SendCenterLabel(unit.name.."이 자녀 ["..target_name.."] 을 파양신청하였습니다.")    
         end
         if find_First then
            find_First.SendCenterLabel(unit.name.."이 자녀 ["..target_name.."] 을 파양신청하였습니다.")    
         end
         if find_Second  then
            find_Second.SendCenterLabel(unit.name.."이 자녀 ["..target_name.."] 을 파양신청하였습니다.")    
         end
         if find_Third then
            find_Third.SendCenterLabel(unit.name.."이 자녀 ["..target_name.."] 을 파양신청하였습니다.")    
         end

         find_child.FireEvent("자식파양대기",unit.name,family_name,targetNum)
         unit.SendCenterLabel("자녀 ["..target_name.."]에게 파양신청을 하였습니다.")    

      else
         unit.SendCenterLabel("자녀번호가 일치하지 않습니다.")    
     end
  else
     unit.SendCenterLabel("찾으시는 유저가 없습니다.")
  end
end)

Server.GetTopic("파양수락").Add(function(targetNum,familyName)
   --print("targetNum? :"..targetNum)

   if targetNum< 500 then
      unit.SendCenterLabel("부모는 가출할 수 없습니다.")
      return
   end
   unit.SetStringVar(500,'')
   unit.SetStringVar(501,'')
   unit.SetStringVar(502,'')
   unit.SetStringVar(503,'')
   unit.SetStringVar(504,'')
   unit.SendCenterLabel(familyName.."에서 가출했습니다.")

   if targetNum == 501 then --자녀 1번 지우기
      for i,v in pairs(Server.players) do
         if v.unit.GetStringVar(500) == familyName then
            local f502 = v.unit.GetStringVar(502)
            local f503 = v.unit.GetStringVar(503)

            v.unit.SetStringVar(501,'')
            v.unit.SetStringVar(502,'')
            v.unit.SetStringVar(503,'')
            if f502 ~= nil or f502 ~= '' then
               v.unit.SetStringVar(501,f502)   
            end
            if f503 ~= nil or f503 ~= '' then
               v.unit.SetStringVar(502,f503)
            end
            v.unit.SendCenterLabel(familyName.."에서 ["..unit.name.."]이 가출했습니다.")
         end
      end
   elseif targetNum==502 then --자녀 2번 지우기
      for i,v in pairs(Server.players) do
         if v.unit.GetStringVar(500) == familyName then
            local f503 = v.unit.GetStringVar(503)

            v.unit.SetStringVar(502,'')
            v.unit.SetStringVar(503,'')

            if f503 ~= nil or f503 ~= '' then
               v.unit.SetStringVar(502,f503)
            end
            
            v.unit.SendCenterLabel(familyName.."에서 ["..unit.name.."]이 가출했습니다.")
         end
      end
   elseif targetNum==503 then
      for i,v in pairs(Server.players) do
         if v.unit.GetStringVar(500) == familyName then
            v.unit.SetStringVar(503,"")
            v.unit.SendCenterLabel(familyName.."에서 ["..unit.name.."]이 가출했습니다.")
         end
      end
   end

   
end)


Server.GetTopic("파양거절").Add(function()

   local familyName = unit.GetStringVar(500)
   
   for i,v in pairs(Server.players) do
      if v.unit.GetStringVar(500) == familyName then

         v.unit.SendCenterLabel(unit.name.."이 파양을 거절하였습니다..")
      end
   end
   
end)


Server.GetTopic("결혼정보").Add(function ()

   if unit.GetStringVar(115) ~= nil or unit.GetStringVar(115) ~= '' then
      local partner = unit.GetStringVar(115)
      unit.FireEvent("강제이혼",partner)
   else
      unit.SendCenterLabel("배우자가 없습니다.")
   end
end)

Server.GetTopic("강제이혼진행").Add(function(partner)
   local married_man = find_unit(partner)
   unit.SetStringVar(115,"")
   unit.SetStringVar(117,"")
   married_man.SetStringVar(115,"")
   married_man.SetStringVar(117,"")
   unit.RemoveItem(1250,10,false,false,true)
   married_man.RemoveItem(1250,10,false,false,true)
   unit.SendSay("이혼을 하여 결혼반지는 회수됩니다.")

   if married_man then
      married_man.SendSay("이혼을 하여 결혼반지는 회수됩니다.")
   end
   
end)


Server.GetTopic("강제가족정보삭제진행").Add(function()

local familyName = unit.GetStringVar(500)

if familyName == nil or familyName =='' then
   unit.SendCenterLabel("현재 가족이 없습니다.")
   return
end

local myname = unit.player.name

local first = unit.GetStringVar(501)
local second = unit.GetStringVar(502)
local third = unit.GetStringVar(503)

local targetNum =0
local check = false
if myname == first then
   check = true
   targetNum = 501
elseif myname == second then
   check = true
   targetNum = 502
elseif myname == third then
   check = true
   targetNum = 503
end

if not check then
   unit.SendCenterLabel("부모는 강제가족정보를 삭제할 수 없습니다.\n 가족 파산 신청 가능합니다.")
   return
end

if targetNum == 501 then --자녀 1번 지우기
   for i,v in pairs(Server.players) do
      if v.unit.GetStringVar(500) == familyName then
         local f502 = v.unit.GetStringVar(502)
         local f503 = v.unit.GetStringVar(503)
         v.unit.SetStringVar(501,f502)
         v.unit.SetStringVar(502,f503)
         v.unit.SetStringVar(503,"")
      
      end
   end
elseif targetNum==502 then --자녀 2번 지우기
   for i,v in pairs(Server.players) do
      if v.unit.GetStringVar(500) == familyName then
         local f503 = v.unit.GetStringVar(503)
         v.unit.SetStringVar(502,f503)
         v.unit.SetStringVar(503,"")
         
      end
   end
elseif targetNum==503 then
   for i,v in pairs(Server.players) do
      if v.unit.GetStringVar(500) == familyName then
         v.unit.SetStringVar(503,"")
      end
   end
end

unit.SetStringVar(500,'')
unit.SetStringVar(501,'')
unit.SetStringVar(502,'')
unit.SetStringVar(503,'')
unit.SetStringVar(504,'')
unit.SendCenterLabel("가족정보가 모두 삭제되었습니다.")

end)


Server.GetTopic("가족정보").Add(function ()

   if unit.GetStringVar(500) ~= nil or unit.GetStringVar(500) ~= '' then
      local family = unit.GetStringVar(500)
      unit.FireEvent("가족해산",family)
   else
      unit.SendCenterLabel("가족이 없습니다.")
   end
end)

Server.GetTopic("가족해산진행").Add(function(family_name)

   local family = unit.GetStringVar(500)

   if family == nil or family == '' then
      unit.SendCenterLabel("가족이 없습니다. ")
      return
   end

local isChild = false
for i,v in pairs(Server.players) do
   if v.unit.GetStringVar(500)== family_name then
      if v.unit.GetStringVar(501) == unit.player.name then
         isChild = true
      elseif v.unit.GetStringVar(502) == unit.player.name then
         isChild = true
      elseif v.unit.GetStringVar(503) == unit.player.name then
         isChild = true
      end
   end
end


if isChild then
   unit.SendCenterLabel("자녀는 가족해산을 할 수 없습니다.")
   return
end

--몇번쨰 자녀인지 확인
local partner = unit.GetStringVar(115)
local isFirst = unit.GetStringVar(501)
local isSecond = unit.GetStringVar(502)
local isThird = unit.GetStringVar(503)

local find_partner = find_unit(partner)
local find_First = find_unit(isFirst)
local find_Second = find_unit(isSecond)
local find_Third = find_unit(isThird)

--[[
print("-----------------")
print("유저? "..unit.player.name)
print("partner?"..partner)
print("isFirst?"..isFirst)
print("isSecond?"..isSecond)
print("isThird?"..isThird)
print("-----------------")


print("----------삭제 전-------")
print("유저? "..unit.GetStringVar(500))
print("partner?"..find_partner.GetStringVar(500))
print("isFirst?"..find_First.GetStringVar(500))
print("-----------------")
]]--
--내 가족정보삭제
unit.SetStringVar(500,'')
unit.SetStringVar(501,'')
unit.SetStringVar(502,'')
unit.SetStringVar(503,'')
unit.SetStringVar(504,'')
unit.SendCenterLabel("가족을 해산하였습니다. ")

find_partner.SetStringVar(500,'')
find_partner.SetStringVar(501,'')
find_partner.SetStringVar(502,'')
find_partner.SetStringVar(503,'')
find_partner.SetStringVar(504,'')
if find_partner then
   find_partner.SendCenterLabel(unit.player.name.."이 가족을 해산하였습니다. ")
end

find_First.SetStringVar(500,'')
find_First.SetStringVar(501,'')
find_First.SetStringVar(502,'')
find_First.SetStringVar(503,'')
find_First.SetStringVar(504,'')
if find_First then
   find_First.SendCenterLabel(unit.player.name.."이 가족을 해산하였습니다. ")
end
--[[
print("----------삭제 후-------")
print("유저? "..unit.GetStringVar(500))
print("partner?"..find_partner.GetStringVar(500))
print("isFirst?"..find_First.GetStringVar(500))
print("-----------------")
]]--

if isSecond ~= nil or isSecond ~= '' then
   if find_Second.GetStringVar(500) then
      --print("----------삭제 전-------")
      --print("isSecond?"..find_Second.GetStringVar(500))
      find_Second.SetStringVar(500,'')
      find_Second.SetStringVar(501,'')
      find_Second.SetStringVar(502,'')
      find_Second.SetStringVar(503,'')
      find_Second.SetStringVar(504,'')
      --print("----------삭제 후-------")
      --print("isSecond?"..find_Second.GetStringVar(500))
   end
end
if find_Second then
   find_Second.SendCenterLabel(unit.player.name.."이 가족을 해산하였습니다. ")
end


if isThird ~= nil or isThird ~= '' then
   if find_Third.GetStringVar(500) then
      --print("----------삭제 전-------")
      --print("isThird?"..find_Third.GetStringVar(500))
      find_Third.SetStringVar(500,'')
      find_Third.SetStringVar(501,'')
      find_Third.SetStringVar(502,'')
      find_Third.SetStringVar(503,'')
      find_Third.SetStringVar(504,'')
      --print("----------삭제 후-------")
      --print("isThird?"..find_Third.GetStringVar(500))
   end
end
if find_Third then
   find_Third.SendCenterLabel(unit.player.name.."이 가족을 해산하였습니다. ")
end


end)