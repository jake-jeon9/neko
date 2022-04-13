
--로또 가격설정
function lottoPrice()
return 10000
end

--로또 요일설정
drawTime = "20" --추첨시간 20
drawDate = "6"  -- 추첨요일( 0~ 6) -- 일 ~ 토
drawMin = "00" -- 추첨 분


------- 경품 설정
--1 등
FirstAwardWinnerItemNum = 9
FirstAwardWinnerItemName = "1등경품" 
FirstAwardWinnerItemCount = 1000
--2등
SecondAwardWinnerItemNum = 8
SecondAwardWinnerItemName = "2등 경품"
SecondAwardWinnerItemCount = 100
--3등
ThirdAwardWinnerItemNum = 8
ThirdAwardWinnerItemName = "3등경품"
ThirdAwardWinnerItemCount = 5
--4등
ForthAwardWinnerItemNum = 10
ForthAwardWinnerItemName = "4등경품"
ForthAwardWinnerItemCount = 1

-----



Server.GetTopic("로또선택").Add(function ()
    local times = 0
    local lottoPrice = lottoPrice()
    local converText = ""

    if lottoPrice/1000000000 >= 1 then -- 10억
        converText = "1,000,000,000"
    elseif lottoPrice/100000000 >=1 then -- 1억
        converText = "100,000,000"
    elseif lottoPrice/10000000 >=1 then -- 천만
        converText = "10,000,000"
    else
        converText = lottoPrice.."" --기타미만
    end
    

    if Server.GetWorldStringVar(100) == nil or Server.GetWorldStringVar(100) == 0 or Server.GetWorldStringVar(100) == '' then
        times = 1
    else
        times = Server.GetWorldStringVar(100)
    end


    local today = os.date("%Y년 %m월 %d일 %H시 %M 분",os.time()+32400)
    local nextdrawDate = ""
    local yy =os.date("%Y년 ",os.time()+32400)
    local mm = os.date("%m월 ",os.time()+32400)
    local dd = os.date("%d",os.time()+32400)
    local hour = os.date("%H",os.time()+32400)
    local todayOfweek = os.date("%w",os.time()+32400)

    if tonumber(todayOfweek) < tonumber(drawDate) then
        nextdrawDate = yy..mm..(tonumber(dd)+7-tonumber(todayOfweek)-1).."일 "..drawTime.."시 "..drawMin.."분 예정"
    elseif tonumber(todayOfweek) ==tonumber(drawDate) and tonumber(hour) < tonumber(drawTime) then
        nextdrawDate = yy..mm..(tonumber(dd)+7-tonumber(todayOfweek)-1).."일 "..drawTime.."시 "..drawMin.."분 예정"
    else
        nextdrawDate = yy..mm..(tonumber(dd)+7).."일 "..drawTime.."시 "..drawMin.."분 예정"
    end

    unit.FireEvent("로또시작",times,today,nextdrawDate,converText)
end)


Server.GetTopic("숫자부족").Add(function ()
    unit.SendCenterLabel("선택한 숫자가 부족합니다.")
end)

Server.GetTopic("선택초과").Add(function ()
    unit.SendCenterLabel("선택한 숫자가 4개를 초과하였습니다.\n 다시 해주세요.")
end)


Server.GetTopic("로또초기화").Add(function ()
    local myTurn = unit.GetStringVar(600)
    local myNum =  unit.GetStringVar(601)

    unit.FireEvent("초기화묻기",myTurn,myNum)
end)

Server.GetTopic("로또초기화하기").Add(function ()
    local myTurn = unit.GetStringVar(600)
    local myNum =  unit.GetStringVar(601)

    unit.SendCenterLabel(myNum.."회차 초기화하였습니다. 재구매해주세요.")
    unit.SetStringVar(600,'')
    unit.SetStringVar(601,'')
    unit.SetStringVar(602,'')
    unit.SetStringVar(603,'')

end)

Server.GetTopic("로또구매").Add(function(button_data,times,today,drawdate)
    --print("times :"..times)

    local price = lottoPrice()
    local userMoney = unit.gameMoney

    if price>userMoney then
        unit.SendCenterLabel("로또 구매비용이 부족합니다.. \n로또 비용은"..price.."원 입니다.")
        return
    end
    local mytimes = unit.GetStringVar(600)
    local myNum= unit.GetStringVar(601)
        
    local drawNum = Utility.JSONParse(button_data)
    local sortB = {0,0,0,0}
    
    for i=1,4 do
        sortB[i] = tonumber(drawNum[i])
    end
    table.sort(sortB)
    if tonumber(mytimes)==tonumber(times) then
        unit.SendCenterLabel("이미"..mytimes.."회차를 구매한 상태입니다.")
        return
    end

    unit.SetStringVar(600,times)
    unit.SetStringVar(601,sortB[1].."/"..sortB[2].."/"..sortB[3].."/"..sortB[4])
    unit.SetStringVar(602,today)
    unit.SetStringVar(603,drawdate)
    unit.UseGameMoney(price)
    unit.SendCenterLabel(times.."회차 "..sortB[1].."/"..sortB[2].."/"..sortB[3].."/"..sortB[4].." 번호로 구매완료.")
end)

Server.GetTopic("로또자동구매").Add(function(times,today,drawdate)

    local price = lottoPrice()
    local userMoney = unit.gameMoney

    if price>userMoney then
        local lottoPrice = lottoPrice()
    local converText = ""

    if lottoPrice/1000000000 >= 1 then -- 10억
        converText = "1,000,000,000"
    elseif lottoPrice/100000000 >=1 then -- 1억
        converText = "100,000,000"
    elseif lottoPrice/10000000 >=1 then -- 천만
        converText = "10,000,000"
    else
        converText = lottoPrice.."" --기타미만
    end
        unit.SendCenterLabel("로또 구매비용이 부족합니다.. \n로또 비용은"..converText.."원 입니다.")
        return
    end
    local mytimes = unit.GetStringVar(600)
    
    local sortB = getNum()
 
    if tonumber(mytimes)==tonumber(times) then
        unit.SendCenterLabel("이미"..mytimes.."회차를 구매한 상태입니다.")
        return
    end

    unit.SetStringVar(600,times)
    unit.SetStringVar(601,sortB[1].."/"..sortB[2].."/"..sortB[3].."/"..sortB[4])
    unit.SetStringVar(602,today)
    unit.SetStringVar(603,drawdate)
    unit.UseGameMoney(price)
    unit.SendCenterLabel(times.."회차 "..sortB[1].."/"..sortB[2].."/"..sortB[3].."/"..sortB[4].." 번호로 구매완료.")
end)

Server.GetTopic("내로또조회").Add(function()
    local times = unit.GetStringVar(600)
    local myNum= unit.GetStringVar(601)
    local issueDate =  unit.GetStringVar(602)
    local drawDate = unit.GetStringVar(603)
    local nextDrawTiem = Server.GetWorldStringVar(100)
    if myNum == nil or myNum == '' then
        unit.SendCenterLabel(nextDrawTiem.."회차 미구매 하셨습니다.")
        return
    elseif tonumber(times) < tonumber(nextDrawTiem)-1 then
        unit.SendCenterLabel(times.."회차 추첨일 지났습니다. 재구매해주세요.")
        return
    end

    local num= {}

    for i=1,3 do
        local checknum = string.find(myNum,'/')
        table.insert(num,string.sub( myNum, 1,checknum-1 ))
        myNum = string.sub( myNum, checknum+1 )
    end
    table.insert(num,myNum)
    --print("1 :"..num[1]..",2 :"..num[2]..",3 :"..num[3]..", 4 :"..num[4])
    
    unit.FireEvent("로또확인",times,Utility.JSONSerialize(num),issueDate,drawDate)

end)




Server.GetTopic("당첨확인").Add(function(times,mynum)

    local drawTimes = Server.GetWorldStringVar(100)
    local original_drawedNum = Server.GetWorldStringVar(101)

    if tonumber(drawTimes)-1 == tonumber(times) then
        --print("추첨되었음. 확인")
        local drawedNum = original_drawedNum
        local parseNum= {}

        local sortB = Utility.JSONParse(mynum)

        for i=1,3 do
            local checknum = string.find(drawedNum,'/')
            table.insert(parseNum,string.sub( drawedNum, 1,checknum-1 ))
            drawedNum = string.sub( drawedNum, checknum+1 )
        end

        table.insert(parseNum,drawedNum)
        local count = 0
        
        for _,q in pairs(parseNum) do
            for i=1,4 do
                if q == sortB[i] then
                    count = count + 1
                end
            end
        end
        --print("당첨 진입 추첨된 번호는 ? "..original_drawedNum)
        --print("내번호? : "..sortB[1].."/"..sortB[2].."/"..sortB[3].."/"..sortB[4])
        if count == 0 then
            unit.SendSay("내가 구매한 번호 : "..sortB[1].."/"..sortB[2].."/"..sortB[3].."/"..sortB[4])
            unit.SendSay(times.."회차 당첨번호 번호 : "..original_drawedNum)
            unit.SendCenterLabel(times.."회차 번호 적중 실패.. 다음기회에!")

        elseif count==1 then
            local item,itemName,itemCount = returnAward(count)
            unit.AddItem(item,itemCount)
            unit.SendSay("내가 구매한 번호 : "..sortB[1].."/"..sortB[2].."/"..sortB[3].."/"..sortB[4])
            unit.SendSay(times.."회차 당첨번호 번호 : "..original_drawedNum)
            unit.SendCenterLabel(times.."회차 번호 "..count.."개 적중!"..(5-count).."등입니다.\n 경품으로"..itemName.."을"..itemCount.."개 얻었습니다.")
            unit.Say("축하합니다! 로또"..(5-count).."등입니다.\n", 0xFF0000)
        elseif count==2 then
            local item,itemName,itemCount = returnAward(count)
            unit.AddItem(item,itemCount)
            unit.SendSay("내가 구매한 번호 : "..sortB[1].."/"..sortB[2].."/"..sortB[3].."/"..sortB[4])
            unit.SendSay(times.."회차 당첨번호 번호 : "..original_drawedNum)
            unit.SendCenterLabel(times.."회차 번호 "..count.."개 적중!"..(5-count).."등입니다.\n 경품으로"..itemName.."을"..itemCount.."개 얻었습니다.")
            unit.Say("축하합니다! 로또"..(5-count).."등입니다.\n", 0xFF0000)
                        
        elseif count==3 then
            local item,itemName,itemCount = returnAward(count)
            unit.AddItem(item,itemCount)
            unit.SendSay("내가 구매한 번호 : "..sortB[1].."/"..sortB[2].."/"..sortB[3].."/"..sortB[4])
            unit.SendSay(times.."회차 당첨번호 번호 : "..original_drawedNum)
            unit.SendCenterLabel(times.."회차 번호 "..count.."개 적중!"..(5-count).."등입니다.\n 경품으로"..itemName.."을"..itemCount.."개 얻었습니다.")

            unit.Say("축하합니다! 로또"..(5-count).."등입니다.\n", 0xFF0000)
            
                        
        elseif count==4 then
            local item,itemName,itemCount = returnAward(count)
            unit.AddItem(item,itemCount)
            unit.SendSay("내가 구매한 번호 : "..sortB[1].."/"..sortB[2].."/"..sortB[3].."/"..sortB[4])
            unit.SendSay(times.."회차 당첨번호 번호 : "..original_drawedNum)
            unit.SendCenterLabel(times.."회차 번호 "..count.."개 적중!"..(5-count).."등입니다.\n 경품으로"..itemName.."을"..itemCount.."개 얻었습니다.")

            Server.SendCenterLabel(unit.player.name.."님이 "..times.."회차 1등입니다.")
            unit.Say("축하합니다! 로또 1등입니다.\n", 0xFF0000)
            
        end
        unit.SetStringVar(600,'')
        unit.SetStringVar(601,'')
        unit.SetStringVar(602,'')
        unit.SetStringVar(603,'')

    elseif tonumber(drawTimes)-1 > tonumber(times) then
        unit.SendCenterLabel(times.."회차 추첨이 종료되었습니다. 현재 회차는"..drawTimes.."입니다.")
        return
    else 
        unit.SendCenterLabel(times.."회차 추첨 전입니다.")
        return
    end

end)

function getNum()
    local num = {}
    local i = 1
    local firstNum = math.random( 1,20 )
    table.insert(num,firstNum)

    while #num <5 do
        local Number = math.random( 1,20 )
        for k = i ,i do
            if not checkDouble(num,Number) then
                if num[i] ~= Number then
                    i = i+1
                    table.insert( num,Number )
                    --print(num[i])
                end 
            end
        end
    end
    table.sort(num)
    return num
end

function checkDouble(button_data,i)
    local date = false

    for _,q in pairs(button_data) do
        if q == i then
        date = true
        break
        end
    end

    return date
end

--추첨
function uploadDraw(type)

    print("로또 추첨 실행됨.")
    
    local nowTime = os.date("%H", os.time()+32400)
    local nowDate = os.date("%w",os.time()+32400)
    local nowMin = os.date("%M",os.time()+32400)
    
    local lottoNum ={}
    lottoNum = getNum()
    local times = tonumber(Server.GetWorldStringVar(100))
    local lottoNumText = lottoNum[1].."/"..lottoNum[2].."/"..lottoNum[3].."/"..lottoNum[4]
    local tic = 3

    

    if type == 1 then --이벤트 로또
        Server.SendCenterLabel(times.."이벤트 추첨이 시작되었습니다.")
    else
        
        if drawDate == nowDate and drawTime == nowTime and nowMin==drawMin then
            Server.SendCenterLabel((times).."회차 추첨을 시작합니다.")
        else
            Server.SendCenterLabel("정규 추첨시간이 아닙니다.")
            return 
        end
    end
    Server.SetWorldStringVar(100,times+1)
    Server.SetWorldStringVar(101,lottoNumText)
        
    Server.RunLater(function()
        Server.SendCenterLabel("첫 번째 번호는 ? ")
    end, tic*1)

    Server.RunLater(function()
        Server.SendCenterLabel("첫 번째 번호 : "..lottoNum[4])
    end, tic*2)

    Server.RunLater(function()
        Server.SendCenterLabel("두 번째 번호는 ? ")
    end, tic*3)

    Server.RunLater(function()
        Server.SendCenterLabel("두 번째 번호 : "..lottoNum[2])
    end, tic*4)

    Server.RunLater(function()
        Server.SendCenterLabel("세 번째 번호는 ? ")
    end, tic*5)

    Server.RunLater(function()
        Server.SendCenterLabel("세 번째 번호 : "..lottoNum[1])
    end, tic*6)

    Server.RunLater(function()
        Server.SendCenterLabel("마지막 번호는 ? ")
    end, tic*7)

    Server.RunLater(function()
        Server.SendCenterLabel("마지막 번호 : "..lottoNum[3])
    end, tic*8)

    Server.RunLater(function()
        Server.SendCenterLabel(times.."회차 당첨 번호 : "..lottoNumText)
    end, tic*9)

    Server.RunLater(function()
        Server.SendCenterLabel(times.."회차 당첨 번호 :  "..lottoNumText)
        --unit.SendSay(times.."회차 당첨 번호 :  "..lottoNumText)
    end, tic*10)

    Server.RunLater(function()
        Server.SendCenterLabel(times.."회차 구매자들은 당첨 번호를 확인해주세요.")
    end, tic*11)

end


function returnAward(num)
    if num ==4 then
        return FirstAwardWinnerItemNum,FirstAwardWinnerItemName,FirstAwardWinnerItemCount
    elseif num ==3 then
        return SecondAwardWinnerItemNum,SecondAwardWinnerItemName,SecondAwardWinnerItemCount
    elseif num==2 then
        return ThirdAwardWinnerItemNum,ThirdAwardWinnerItemName,ThirdAwardWinnerItemCount
    elseif num==1 then
        return ForthAwardWinnerItemNum,ForthAwardWinnerItemName,ForthAwardWinnerItemCount
    end

end