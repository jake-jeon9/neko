--[[                                           ]]
--[[ program :          magic cooking for jumal]]
--[[version :                             v 1.0]]
--[[developer :                        jakejeon]]
--[[Copyright2022. all rights reserved.        ]]
--[[                                           ]]

function startMAGICCOOKING()
    Client.fireEvent("startMagicCooking")
end

local isPump = false
local isWater = false

function magiccooking (ids,counts,imageIds)
    --[[변수 선정]]
    MItemsID = Utility.JSONParse(ids)                       --아이템 아이디
    MItemsCount = Utility.JSONParse(counts)                --아이템 갯수
    MItemsImageId = Utility.JSONParse(imageIds)              --아이템 이미지 아이디

    local cw = Client.width                                -- 클라이언트 가로
    local ch = Client.height                               -- 클라이언트 세로
    local sw = 350                                         -- 게임화면 창 가로
    local sh = 428                                         -- 게임화면 창 세로
    temperature = 0                                        -- 온도
    
    MCscore = 0                                            -- 획득 점수
    MCTscore = 50                                          -- 합격 점수
    cookingtimer = 35                                      -- 게임 시간
    minTemp = 45                                           -- 최소온도
    maxTemp = 55                                           -- 최고온도

    isDone = false                                         -- 종료
    isStarted = false                                      -- 시작

    local ItemButtons = {}
    local Item_image = {}
    local ItemCount = {}

    local classic_COLOR = Color(150, 150, 150, 0) 

    main_pnl = Panel(Rect((cw*0.35)-100,15,sw,sh))

    -- 이미지 생성
    bg_pnl = Image("Pictures/bgmagiccooking.png",Rect(0,0,sw,sh))
    btCancelImage = Image("Pictures/bt_cancel.png",Rect(0,0,60,27))
    btStartImage = Image("Pictures/bt_start.png",Rect(0,0,60,27))
    btPump1Image = Image("Pictures/bt_pump1.png",Rect(0,0,60,60))
    btWater1Image = Image("Pictures/bt_water1.png",Rect(0,0,60,60))
    timerImage = Image("Pictures/timer.png",Rect(sw-70,30,20,20))
    tempImage = Image("Pictures/temperature1.png",Rect(sw-90,95,20,100))
    arrowImage= Image("Pictures/arrow.png",Rect(sw-75,185,15,15))
    gaugeImage= Image("Pictures/gauge.png",Rect(32,335,200,30))
    gaugeInnerImage= Image("Pictures/gauge1.png",Rect(8,0,0,30))

    --텍스트
    --현재시간
    txtTimer = Text(string.format( "%d초",cookingtimer),Rect(278,50,100,20))
    txtTimer.color = Color(255,255,255)
    txtTimer.OrderToFirst()
    
    --현재 온도
    txtCurrentTemperture = Text(string.format( "온도 : %d도",temperature),Rect(251,70,100,20))
    txtCurrentTemperture.color = Color(255,255,255)
    txtCurrentTemperture.textSize =15
    txtCurrentTemperture.OrderToFirst()
    --최소온도
    txtMinimumTemperture = Text(string.format( "최소 : %d",minTemp),Rect(288,105,100,15))
    txtMinimumTemperture.color = Color(91,83,201)
    txtMinimumTemperture.textSize =11
    txtMinimumTemperture.OrderToFirst()
    --최대온도
    txtMaximumTemperture = Text(string.format( "최대 : %d",maxTemp),Rect(288,90,100,15))
    txtMaximumTemperture.color = Color(168,40,64)
    txtMaximumTemperture.textSize =11
    txtMaximumTemperture.OrderToFirst()
    --점수
    txtScore = Text(string.format("현재 점수 : %d점 / 성공점수 : %d", MCscore, MCTscore),Rect(25,314,250,20))
    txtScore.textSize = 14
    txtScore.color = Color(255,255,255)
    txtScore.OrderToFirst()

    --전달받은 아이템 셋팅
    for i,item in pairs(MItemsImageId) do    
        --print(i.." 전달된 아이템: "..item)      
        local itemsize = 36
        if i == 1 then
            ItemButtons[i] = Button('', Rect(117,166,itemsize,itemsize))
        elseif i == 2 then
            ItemButtons[i] = Button('', Rect(84,209,itemsize,itemsize))
        elseif i == 3 then
            ItemButtons[i] = Button('', Rect(149,209,itemsize,itemsize))
        end
        
        ItemButtons[i].showOnTop = true
        ItemButtons[i].SetOpacity(0)

        Item_image[i] = Image('', Rect(0, 0, ItemButtons[i].width, ItemButtons[i].height))
        Item_image[i].SetImageID(item)

        ItemCount[i] = Text(MItemsCount[i], Rect(0, 24, itemsize, itemsize))
        ItemCount[i].textAlign = 2
        ItemCount[i].textSize = 12
        Item_image[i].AddChild(ItemCount[i])
        ItemButtons[i].AddChild(Item_image[i])
        bg_pnl.AddChild(ItemButtons[i])
    end

    --취소버튼
    buttonCancel = Button(" ",Rect(sw/2+20,sh-36,60,27))
    buttonCancel.SetOpacity(0)
    buttonCancel.showOnTop = true
    buttonCancel.onClick.Add(magicCancel)
    buttonCancel.AddChild(btCancelImage)

    --시작버튼
    buttonStart = Button(" ",Rect(sw/2-80,sh-36,60,27))
    buttonStart.SetOpacity(0)
    buttonStart.showOnTop = true
    buttonStart.onClick.Add(magicStart)
    buttonStart.AddChild(btStartImage)

    --펌프버튼
    buttonPump = Button(" ",Rect(sw-90,210,60,60,60,60))
    buttonPump.SetOpacity(0)
    buttonPump.showOnTop = true
    buttonPump.onClick.Add(doPump)
    buttonPump.AddChild(btPump1Image)
    --[[
    buttonPump.onMouseDown(function()
        print("눌림")
    end)
    buttonPump.onMouseUp(function ()
        print("떨어짐")
    end)
    ]]
    --물버튼
    buttonWater = Button(" ",Rect(sw-90,290,60,60))
    buttonWater.SetOpacity(0)
    buttonWater.showOnTop = true
    buttonWater.onClick.Add(doWater)
    buttonWater.AddChild(btWater1Image)
    --buttonWater.onMouseDown()
    --buttonWater.onMouseUp()
    
    --상속
    bg_pnl.AddChild(buttonCancel)
    bg_pnl.AddChild(buttonStart)
    bg_pnl.AddChild(buttonPump)
    bg_pnl.AddChild(buttonWater)
    bg_pnl.AddChild(tempImage)
    bg_pnl.AddChild(arrowImage)
    bg_pnl.AddChild(timerImage)
    bg_pnl.AddChild(gaugeImage)
    bg_pnl.AddChild(txtTimer)
    bg_pnl.AddChild(txtCurrentTemperture)
    bg_pnl.AddChild(txtMinimumTemperture)
    bg_pnl.AddChild(txtMaximumTemperture)
    gaugeImage.AddChild(gaugeInnerImage)
    bg_pnl.AddChild(txtScore)
    main_pnl.AddChild(bg_pnl)
    
end

function magicStart()
    isStarted = true
    --print("스타트 눌림")
    cooking()
end

function magicCancel()
    --print("캔슬 눌림")
    isDone = true
    if isStarted then
        Client.fireEvent("마법요리실패",Utility.JSONSerialize(MItemsID),Utility.JSONSerialize(MItemsCount))
    end
    main_pnl.Destroy()
end

function doPump()
    --print("펌프 눌림")
    if not isPump then 
        isPump = true
        btPump1Image.SetImage("Pictures/bt_pump2.png")
    end
    
    if  isStarted then
        hitting()
    end
    Client.RunLater(function()
        if isPump then 
            isPump = false
            btPump1Image.SetImage("Pictures/bt_pump1.png")
        end
    end,0.3)

end

function doWater()
    --print("워터 눌림")
    if not isWater then
        btWater1Image.SetImage("Pictures/bt_water2.png")
        isWater = true
    end
    
    if  isStarted then
        cooling()
    end
    Client.RunLater(function()
        if isWater then
            isWater = false
            btWater1Image.SetImage("Pictures/bt_water1.png")
        end
    end,0.3)


end

function cooking()
    --print("쿠킹 시작")
    -- print(buttonPump.id)
    for i=1, cookingtimer, 0.5 do
        Client.RunLater(function()
            if (not isDone) and (isStarted) then
                --print("버튼눌림?"..tostring(Button.onMouseDown(buttonPump)))
                -- print("포문"..i)
                -- print(string.format("isStarted : %s, isDone : %s, min : %d, max : %d, currend : %d",tostring(isStarted),tostring(isDone),minTemp,maxTemp,temperature))
                if (temperature>=minTemp) and (maxTemp>=temperature) then
                    --print("진입")
                    MCscore  = MCscore + 1
                end
                
                if i % 1 == 0 then
                    local degree = 90*i
                    if degree > 360 then
                        degree = degree - 360
                    end
                    timerImage.DORotate(degree,i)

                    local randomB = math.random(1,10)
                    if randomB <= 5 then
                        hitting()
                    elseif randomB >= 7 then
                        cooling()
                    else
                    end
                    cookingtimer = cookingtimer-1
                    txtTimer.text = tostring(cookingtimer).."초"
                end

                txtScore.text = string.format("현재 점수 : %d점 / 성공점수 : %d", MCscore, MCTscore)
                gaugeInnerImage.width = (186/MCTscore) * MCscore
                if gaugeInnerImage.width >= 186 then
                    gaugeInnerImage.width = 186
                end
                --if Input.GetMouseButtonDown(buttonPump.id) then print("터치 됨") end

                if 0 == cookingtimer then
                    isDone = true
                    print("게임종료, 최종 점수 : "..MCscore)

                    if MCscore >= MCTscore then
                        --print("성공")
                        Client.fireEvent("마법요리성공",Utility.JSONSerialize(MItemsID),Utility.JSONSerialize(MItemsCount))
                    else
                        --print("실패")
                        Client.fireEvent("마법요리실패",Utility.JSONSerialize(MItemsID),Utility.JSONSerialize(MItemsCount))
                    end
                    
                    main_pnl.Destroy()
                end
            end
        end, i)
    end
    
end

function hitting()
    local randomN = math.random( 1,5)
    local randomB = math.random( 1,3)
    if randomB == 1 then
        randomN = 0
    end
    --print(string.format("현재온도 : %d, 추가 %d",temperature,randomN))
    temperature = temperature+randomN;
    
    if temperature > 100 then
        temperature = 100
    end

    local y =  arrowImage.y - randomN
    if y < 87 then
        y = 87
    end
    
    --arrowImage.DOMove(Point(350-75, y), 0.5)
    arrowImage.y = y
    txtCurrentTemperture.text = "현재온도 :"..temperature
end

function cooling()
    local randomN = math.random( 1,5)
    local randomB = math.random( 1,3)

    if randomB == 1 then
        randomN = 0
    end

    --print(string.format("현재온도 : %d, 감소 %d",temperature,randomN))
    temperature =temperature-randomN;
    if temperature < 1 then
        temperature = 0
    end

    local y =  arrowImage.y + randomN
    if y > 185 then
        y = 185
    end
    
    --arrowImage.DOMove(Point(350-75, y), 0.5)
    arrowImage.y = y
    txtCurrentTemperture.text = "현재온도 :"..temperature
    
end