function startMAGICCOOKING()
    --print("클라시작")
    Client.FireEvent("startMagicCooking")
end

local cw = Client.width
local ch = Client.height

function magiccooking (ids,counts,imageIds)

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
    lotto_pnl = Image("Pictures/bgmagiccooking.png",Rect(0,0,sw,sh))
    lotto_pnl.showOnTop = true
    --lotto_mask.showOnTop = true

    --취소버튼
    buttonCancel= Button("취소",Rect(sw/2+40,sh-30,50,30))
    buttonCancel.SetOpacity(0)
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
    btCancelImage = Image("Pictures/bt_cancel.png",Rect(200,200,50,30))
    btStartImage = Image("Pictures/bt_start.png",Rect(250,250,50,30))
    btStartImage = Image("Pictures/bt_pump1.png",Rect(300,300,50,30))
    btStartImage = Image("Pictures/bt_water1.png",Rect(350,350,50,30))

    --buttonCancel.AddChild(btCancelImage)
    --lotto_pnl.AddChild(buttonCancel)

    lotto_mask.AddChild(lotto_pnl)
end

function set()

    if firstmark then
        firstMarkMask = Panel(Rect((cw*0.35)-100,15,sw,sh-40))
        firstMarkMask.showOnTop = true
        firstmark = false
    end

    buttonInit = Button("  ",Rect(sw/2-90,sh-30,50,30))
    buttonInit.color = Color(125,125,125)
    buttonInit.textColor = Color(0, 0, 0)
    buttonInit.textSize = 15
	buttonInit.SetOpacity(0)
    buttonInit.showOnTop = true
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
                        Client.fireEvent("마욜성공",Utility.JSONSerialize(ItemsID),Utility.JSONSerialize(ItemsCount))
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
                        Client.fireEvent("마욜실패",Utility.JSONSerialize(ItemsID),Utility.JSONSerialize(ItemsCount))
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

end