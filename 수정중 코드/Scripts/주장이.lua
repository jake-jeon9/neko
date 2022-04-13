
INSERTEDITEM =0
miniwindowW = 170
miniwindowH = 115
itemsNumber = {}
itemsCount = {}
packingItems = {}
packingItemsCount = {}
packingItemImageID = {}

function startJUJANG()
    --print("클라시작")
    Client.FireEvent("startJujang")
end


function jujang (ids,counts,imageIds)

    if lotto_mask then
        lotto_mask.Destroy()
    end
    
    local ItemsID = Utility.JSONParse(ids)
    local ItemsCount = Utility.JSONParse(counts)
    local ItemsImageId = Utility.JSONParse(imageIds)

    local cw = Client.width
    local ch = Client.height
    local sw = 350
    local sh = 428
    local Progress = 0
    local itemW = 49.3
    local itemH = 49.2
    local timer =70
    local numberOfCorrect = 0
    local ItemButtons = {}
    local Item_image = {}
    local ItemCount  = {}
    itemImage1 = {}         
    itemImage2 = {}
    markImage = {}
    local dataA = {}
    local dataB = {}
    local Ntable = {}
    buttonJuJang = {}
    local firstmark = true
    local firstOn = false
    local secondOn = false
    local isDone = false
    isCanceled = false
    local count = 1
    firstNum = 0
    secondNum = 0
    lastnum = 0
    numberOfCorrect= 0
    classic_RGB = 150
    classic_COLOR = Color(classic_RGB, classic_RGB, classic_RGB, 0)

    lotto_mask = Panel(Rect((cw*0.35)-100,15,sw,sh))
    lotto_pnl = Image("Pictures/formLast.png",Rect(0,0,sw,sh))

    lotto_mask.showOnTop = true
    buttonInit = Button("  ",Rect(sw/2-90,sh-30,50,30))
    buttonInit.color = Color(125,125,125)
    buttonInit.textColor = Color(0, 0, 0)
    buttonInit.textSize = 15
	buttonInit.SetOpacity(0)
    buttonInit.showOnTop = true

    if firstmark then
        firstMarkMask = Panel(Rect((cw*0.35)-100,15,sw,sh-40))
        firstMarkMask.showOnTop = true
        firstmark = false
    end
    
    --start 버튼
    buttonInit.onClick.Add(function()
        firstMarkMask.Destroy()
        for i=1 , timer do
            --타이머 종료 후 이벤트 호출
            Client.RunLater(function()
                if not isDone then
                    local text = 0 
                    if numberOfCorrect > 0 then
                        text = numberOfCorrect/12 *100
                    end
                    --시간 및 진행도 표시
                    progressText.text = string.format( "%d %s진행 중",text,"%")
                    timerText.text = string.format( "%d 초 남음",timer - i)
                    
                    --성공
                    if numberOfCorrect == 12 then
                        isDone = true
                        lotto_mask.Destroy()
                        Client.fireEvent("주장이성공",Utility.JSONSerialize(ItemsID),Utility.JSONSerialize(ItemsCount))
                        numberOfCorrect=0
                        packingItems = nil
                        packingItemsCount = nil
                        packingItemImageID = nil
                        packingItems = {}
                        packingItemsCount = {}
                        packingItemImageID = {}
                        firstmark = true
                        return
                    end
                    --실패
                    if i == timer or isCanceled then
                        isDone = true
                        lotto_mask.Destroy()
                        Client.fireEvent("주장이실패",Utility.JSONSerialize(ItemsID),Utility.JSONSerialize(ItemsCount))
                        numberOfCorrect = 0
                        packingItems = nil
                        packingItemsCount = nil
                        packingItemImageID = nil
                        packingItems = {}
                        packingItemsCount = {}
                        packingItemImageID = {}
                        firstmark = true
                        return
                    end
                end
            end, i)
        end
    end)

    progressText = Text("0 % 진행중",Rect(20,10,100,20))
    timerText = Text(string.format( "%d 초 남음",timer),Rect(20,30,100,20))
    timerText.color = Color(125,125,125)

    --취소버튼
    buttonCancel= Button("   ",Rect(sw/2+40,sh-30,50,30))
    buttonCancel.textSize = 15
    buttonCancel.color = Color(125,125,125)
    buttonCancel.textColor = Color(0, 0, 0)
	buttonCancel.SetOpacity(1)
    buttonCancel.showOnTop = true
    buttonCancel.onClick.Add(function()
        isDone = true
        lotto_mask.Destroy()
        Client.fireEvent("마욜실패",Utility.JSONSerialize(ItemsID),Utility.JSONSerialize(ItemsCount))
        numberOfCorrect = 0
        packingItems = nil
        packingItemsCount = nil
        packingItemImageID = nil
        packingItems = {}
        packingItemsCount = {}
        packingItemImageID = {}
        firstmark = true
	end)

    lotto_mask.AddChild(lotto_pnl)

    -- 선택한 아이템 패널에 표시
    for i,item in pairs(ItemsImageId) do    
        --print(i.." 전달된 아이템: "..item)          
        ItemButtons[i] = Button('', Rect(41+(55*(i-1)),51,45,45))
        ItemButtons[i].showOnTop = true
        ItemButtons[i].SetOpacity(0)
        lotto_pnl.AddChild(ItemButtons[i])

        Item_image[i] = Image('', Rect(0, 0, ItemButtons[i].width, ItemButtons[i].height))
        Item_image[i].SetImageID(item)

        ItemCount[i] = Text(ItemsCount[i], Rect(0, 30, 45, 15))
        ItemCount[i].textAlign = 2
        ItemCount[i].textSize = 11
        ItemButtons[i].AddChild(Item_image[i])
        Item_image[i].AddChild(ItemCount[i])
    end

    lotto_pnl.AddChild(progressText)
    lotto_pnl.AddChild(timerText)
    lotto_pnl.AddChild(buttonInit)
    lotto_pnl.AddChild(buttonCancel)

    -- 아이템 마킹
    for i=1,25 do
        markImage[i] = Image("Pictures/QuestionMark.png",Rect(0,0,itemW,itemH))       
    end



    -- 폭탄 설정 -- 
    local boomX = math.random( 1,5 )
    local boomY = math.random( 1,5 )
    local boomNum = boomX+((boomY-1)*5)
    table.insert(Ntable,boomNum)
    buttonJuJang[boomNum] = Button("boom",Rect(0,0,itemW,itemH))
    buttonJuJang[boomNum].textColor = Color(0,0,0)
    buttonJuJang[boomNum].setOpacity(0)
    buttonJuJang[boomNum].showOnTop = true
    
    buttonJuJang[boomNum].onClick.add(function ()
        markImage[boomNum].SetImage("Characters/투명.png")
        numberOfCorrect= 0 
        Client.RunLater(function()
            lotto_mask.Destroy()
            jujang(ids,counts,imageIds)
            end,1)
    end)
    boomImage = Image("Pictures/boom.png",Rect(52-boomX+((boomX-1)*itemW),sh/3-36+(itemH*(boomY-1)),itemW,itemH))
    lotto_pnl.AddChild(boomImage)
    boomImage.AddChild(buttonJuJang[boomNum])
    buttonJuJang[boomNum].AddChild(markImage[boomNum])
    markImage[boomNum].SetImage("Characters/투명.png")
    Client.RunLater(function() 
        markImage[boomNum].SetImage("Pictures/QuestionMark.png")

    end,1)

    
    --print("폭탄? "..boomNum)
----------------------------------------
    local instansTable = {}
    local xtable = {}
    local ytable = {}
    --일반 그림설정--
    while #Ntable <= 24 do
        local x1 = math.random(1,5)
        local y1 = math.random(1,5)
        local num1 = x1+((y1-1)*5)
        
        local x2 = math.random(1,5)
        local y2 = math.random(1,5)
        local num2 = x2+((y2-1)*5)
       
        if not checkDouble(Ntable,num1) then
            table.insert(Ntable,num1) -- A1 이미지
            
            if not checkDouble(Ntable,num2) then
                table.insert(Ntable,num2) -- A2 이미지
                --[[
                print("---------"..count.."-----------")
                print("x1 :"..x1)
                print("y1 :"..y1)
                print("num1 :"..num1)
                print("x2 :"..x2)
                print("y2 :"..y2)
                print("num2 :"..num2)
                ]] 
                --이미지 및 버튼 쌍으로 생성
                --이미지 삽입 x1/y1
                itemImage1[count] = Image("Pictures/item"..tostring(count)..".png",Rect(52-x1+((x1-1)*itemW),sh/3-36+(itemH*(y1-1)),itemW,itemH))
                buttonJuJang[num1] = Button(tostring(count),Rect(0,0,itemW,itemH))
                
                --이미지 삽입 x2/y2
                itemImage2[count] = Image("Pictures/item"..tostring(count)..".png",Rect(52-x2+((x2-1)*itemW),sh/3-36+(itemH*(y2-1)),itemW,itemH))
                buttonJuJang[num2] = Button(tostring(count),Rect(0,0,itemW,itemH))

                buttonJuJang[num1].textColor = Color(0,0,0)
                buttonJuJang[num1].setOpacity(0)
                buttonJuJang[num1].showOnTop = true   
                buttonJuJang[num2].textColor = Color(0,0,0)
                buttonJuJang[num2].setOpacity(0)
                buttonJuJang[num2].showOnTop = true   

                --패널에 추가            
                lotto_pnl.AddChild(itemImage1[count])
                lotto_pnl.AddChild(itemImage2[count])
                itemImage1[count].AddChild(buttonJuJang[num1])
                itemImage2[count].AddChild(buttonJuJang[num2])

                --테이블에 데이터 입력
                table.insert( instansTable,num1 )
                table.insert( instansTable,num2 )
                count = count+1
            else
                table.remove(Ntable,#Ntable) -- A1 삭제 
            end
        end
    end

    for i =1, 25 do
        if i ~= boomNum then
            buttonJuJang[i].AddChild(markImage[i])
            buttonJuJang[i].onClick.add(function()
                --카드 오픈
                if not firstOn then
                    firstOn = true
                    firstNum = buttonJuJang[i].text
                    markImage[i].SetImage("Characters/투명.png")
                    lastnum = i
                    --print("첫번쨰 오픈"..firstNum)
                    return
                --두번째 카드
                elseif not secondOn then
                    --클릭한 카드가 똑같은 거면 패스
                    if firstNum == i then
                    return
                    end
                    secondOn = true
                    secondNum = buttonJuJang[i].text
                    markImage[i].SetImage("Characters/투명.png")

                    --print("두번쨰 오픈"..secondNum)
                end
                
                --검증
                if firstOn and secondOn then
                    if firstNum == secondNum then
                        numberOfCorrect = numberOfCorrect +1
    
                        --버튼 없애기
                        buttonJuJang[lastnum].Destroy()
                        buttonJuJang[i].Destroy()
                        markImage[lastnum].Destroy()
                        markImage[i].Destroy()
    
                        --초기화
                        firstOn = false
                        secondOn = false
                        firstNum = 0
                        secondNum = 0
                        lastnum=0
                        
                    else
                        Client.RunLater(function()
                            markImage[lastnum].SetImage("Pictures/QuestionMark.png")
                            markImage[i].SetImage("Pictures/QuestionMark.png")
                            --초기화
                            firstOn = false
                            secondOn = false
                            firstNum = 0
                            secondNum = 0
                            lastnum=0
                            end,1)
                        
                    end
                    --선택초기화
                end
    
                --buttonJuJang[i].AddChild(markImage[i])
            end)
        end
    end
    --버튼 기능 생성
    
    for num,i in pairs(instansTable) do
        -- buttonJuJang[i].textColor = Color(0,0,0)
        -- buttonJuJang[i].setOpacity(0)
        -- buttonJuJang[i].showOnTop = true        
       
    end
    
    
end



--startJUJANG()

