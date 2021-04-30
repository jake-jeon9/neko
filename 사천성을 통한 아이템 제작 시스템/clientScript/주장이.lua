

local sw = 350
local sh = 428
 itemW = 49.3
 itemH = 49.2
 local Progress = 0
 numberOfCorrect = 0
 local timer =70
itemsNumber = {}
itemsCount = {}
firstmark = true
isFInish = false
function jujang (ids,counts,imageIds)

    if lotto_mask then
        lotto_mask.Destroy()
    end
    
    numberOfCorrect= 0
    classic_RGB = 150
    classic_COLOR = Color(classic_RGB, classic_RGB, classic_RGB, 0)

    lotto_mask = Panel(Rect((cw*0.35)-100,15,sw,sh))
    lotto_pnl = Image("Pictures/formLast.png",Rect(0,0,sw,sh))

    buttonJuJang = {}
    lotto_mask.showOnTop = true
    buttonInit = Button("   ",Rect(sw/2-90,sh-30,50,30))
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
    local ItemsID = Utility.JSONParse(ids)
    local ItemsCount = Utility.JSONParse(counts)
    local ItemsImageId = Utility.JSONParse(imageIds)
    isFInish = false

    buttonInit.onClick.Add(function()
        firstMarkMask.Destroy()
    for i=1 , timer do
        Client.RunLater(function()
    
        local text = 0 
        if numberOfCorrect > 0 then
            text = numberOfCorrect/12 *100
        end
    
        progressText.text = string.format( "%d %s진행 중",text,"%")
        timerText.text = string.format( "%d 초 남음",timer - i)
    
        if numberOfCorrect == 12 then
            if not isFInish then
                isFInish = true
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
            end
            return
        end

        if i == timer then
            if not isFInish then
                isFInish = true
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
    buttonCancel= Button("   ",Rect(sw/2+40,sh-30,50,30))
    buttonCancel.textSize = 15
    buttonCancel.color = Color(125,125,125)
    buttonCancel.textColor = Color(0, 0, 0)
	buttonCancel.SetOpacity(1)
    buttonCancel.showOnTop = true
    buttonCancel.onClick.Add(function()
		lotto_mask.Destroy()
        numberOfCorrect = 0
        packingItems = nil
        packingItemsCount = nil
        packingItemImageID = nil
        packingItems = {}
        packingItemsCount = {}
        packingItemImageID = {}
        firstmark = true
        Client.fireEvent("주장이실패",Utility.JSONSerialize(ItemsID),Utility.JSONSerialize(ItemsCount))
        --Client.InitScript()
	end)

    lotto_mask.AddChild(lotto_pnl)
       
    local ItemButtons = {}
    local Item_image = {}
    local ItemCount  = {}

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

    itemImage1 = {}
    itemImage2 = {}
    
    markImage = {}
    for i=1,25 do
        markImage[i] = Image("Pictures/QuestionMark.png",Rect(0,0,itemW,itemH))       
    end

    local count = 1
    local dataA = {}
    local dataB = {}

    local firstOn = false
    local secondOn = false
     firstNum = 0
     secondNum = 0
    local Ntable = {}

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
                local instansTable = {}
--[[
                print("---------"..count.."-----------")
                print("x1 :"..x1)
                print("y1 :"..y1)
                print("num1 :"..num1)
                print("x2 :"..x2)
                print("y2 :"..y2)
                print("num2 :"..num2)
                ]]
                --이미지 삽입 x1/y1
                itemImage1[count] = Image("Pictures/item"..tostring(count)..".png",Rect(52-x1+((x1-1)*itemW),sh/3-36+(itemH*(y1-1)),itemW,itemH))
                buttonJuJang[num1] = Button(tostring(count),Rect(0,0,itemW,itemH))
                --dataA[count] = num1
                
                --이미지 삽입 x2/y2
                itemImage2[count] = Image("Pictures/item"..tostring(count)..".png",Rect(52-x2+((x2-1)*itemW),sh/3-36+(itemH*(y2-1)),itemW,itemH))
                buttonJuJang[num2] = Button(tostring(count),Rect(0,0,itemW,itemH))
                

                count = count+1
                --dataB[count] = num2
                table.insert( instansTable,num1 )
                table.insert( instansTable,num2 )

                for num,i in pairs(instansTable) do
                    
                    buttonJuJang[i].textColor = Color(0,0,0)
                    buttonJuJang[i].setOpacity(0)
                    buttonJuJang[i].showOnTop = true
                    buttonJuJang[i].onClick.add(function ()
                        
                        if not firstOn then
                            firstOn = true
                            firstNum = i
                            
                            --buttonJuJang[firstNum].RemoveChild(markImage[firstNum])
                            markImage[firstNum].SetImage("Characters/투명.png")
                            --print("첫번쨰 오픈"..firstNum)
                            return
                        elseif not secondOn then
                            if firstNum ==i then
                            return
                            end
                            secondOn = true
                            secondNum = i
                            
                            --buttonJuJang[secondNum].RemoveChild(markImage[secondNum])
                            markImage[secondNum].SetImage("Characters/투명.png")
                            --print("두번쨰 오픈"..secondNum)
                        end
                        
                        if firstOn and secondOn then
                            --local buttonN1 = dataA[firstNum]
                            --local buttonN2 = dataB[secondNum]
                            if buttonJuJang[firstNum].text == buttonJuJang[secondNum].text then
                                --print("번호가 똑같아서 없애기")
                                numberOfCorrect = numberOfCorrect +1

                                --버튼 없애기
                                buttonJuJang[secondNum].Destroy()
                                buttonJuJang[firstNum].Destroy()
                                markImage[firstNum].Destroy()
                                markImage[secondNum].Destroy()
                                --buttonJuJang[firstNum].text=''
                                --buttonJuJang[secondNum].text = ''
                                firstOn = false
                                secondOn = false
                                firstNum = 0
                                secondNum = 0
                                
                            else
                                --print("번호가 달라서 초기화해야함")

                                Client.RunLater(function()
                                    --markImage[secondNum] = Image(,Rect(0,0,itemW,itemH))       
                                    --markImage[firstNum] =  Image("Pictures/QuestionMark.png",Rect(0,0,itemW,itemH))       
                                    markImage[secondNum].SetImage("Pictures/QuestionMark.png")
                                    markImage[firstNum].SetImage("Pictures/QuestionMark.png")
                                    --buttonJuJang[firstNum].Destroy()
                                    --buttonJuJang[secondNum].Destroy()
                                    firstOn = false
                                    secondOn = false
                                    firstNum = 0
                                    secondNum = 0
                                    end,1)
                                
                            end
                            --선택초기화
                        
                        end
                    end)
                    --print("버튼함수만들어짐")
                    lotto_pnl.AddChild(itemImage1[count-1])
                    lotto_pnl.AddChild(itemImage2[count-1])
                    itemImage1[count-1].AddChild(buttonJuJang[num1])
                    itemImage2[count-1].AddChild(buttonJuJang[num2])
                    buttonJuJang[num1].AddChild(markImage[num1])
                    buttonJuJang[num2].AddChild(markImage[num2])
                end
                
            else
                table.remove(Ntable,#Ntable) -- A1 삭제 
            end
        end
    end
    
    
end

Client.GetTopic("MakingJob").Add(function(Q, W, E)
	local dataID = Utility.JSONParse(Q)
	local ID = Utility.JSONParse(W)
	local count = Utility.JSONParse(E)
	selctor(dataID, ID, count)

    --jujangMaking()
end)

INSERTEDITEM =0

function selctor(Q, W, E)
	if fullPanelM ~= nil then return end
	RGB = 111
	classic_RGB = 150
	COLOR = Color(RGB, RGB, RGB, 255)
	blue_COLOR = Color(160, 220, 235, 255)
	classic_COLOR = Color(classic_RGB, classic_RGB, classic_RGB, 255)
	red_color = Color(255, 167, 167, 255)
	local Garo = 360
	local Sero = 350

	fullPanelM = ScrollPanel()
	fullPanelM.content = fullPanelM
	fullPanelM.rect = Rect(cw/2-Garo/2-50, ch/2-Sero/2, Garo, Sero)
	fullPanelM.color = Color(87, 87, 87, 255)
	
	local Close_button = Button('✖', Rect(fullPanelM.width-36, 0, 36, 36))
	Close_button.color = Color(87, 87, 87, 255)
	Close_button.textAlign = 4
	Close_button.textSize = 23
	Close_button.onClick.Add(function()
			fullPanelM.Destroy()
			fullPanelM = nil
            INSERTEDITEM = 0
            if itemwindow ~= nil then
                itemwindow.Destroy()
                itemwindow = nil
            end
            packingItems = nil
            packingItemsCount = nil
            packingItemImageID = nil
            packingItems = {}
            packingItemsCount = {}
            packingItemImageID = {}

	end)


	local Full_panel_text = Text("  조합아이템창", Rect(0, -7, 250, 50))
	Full_panel_text.textSize = 22
	
	local Assi_panel = Panel()
	Assi_panel.rect = Rect(0, 0, Garo-30, Sero-110)
	Assi_panel.color = Color(63, 63, 63, 255)
	
	local scroll_panel = ScrollPanel()
	scroll_panel.rect = Rect(5, 81, Garo-10, Sero-130)
	scroll_panel.color = classic_COLOR

	scroll_panel.AddChild(Assi_panel)
	scroll_panel.content = Assi_panel
	scroll_panel.horizontal = false
	scroll_panel.showVerticalScrollbar = true
	
	fullPanelM.AddChild(scroll_panel)
	fullPanelM.AddChild(Full_panel_text)
	fullPanelM.AddChild(Close_button)
	fullPanelM.showOnTop = true
	

	local menu_button = {}
	for i=1, 1 do
		menu_button[i] = Button('', Rect((57.5)*(i-1)+10, 37, 52.5, 40))
		fullPanelM.AddChild(menu_button[i])
		menu_button[i].color = classic_COLOR
		menu_button[i].textAlign = 4
		menu_button[i].textSize = 16
	end
	menu_button[1].color = blue_COLOR
	
	Tip_button = Button('TIP', Rect((57.5)*5+10, 37, 52.5, 40))
	fullPanelM.AddChild(Tip_button)
	Tip_button.color = classic_COLOR
	Tip_button.textAlign = 4
	Tip_button.textSize = 16
	Tip_button.onClick.Add(function()
		Client.ShowAlert("아이템 조합이 올바르지 않거나 시간 초과시 아까비깡이 나옵니다. 현재 제작가능한 침대 아이템류이며, 60%확률입니다. ")
        --(아이템 조합이 올바르지 않거나 시간 초과시 아까비깡이 나옵니다. 확률은 '/주장이아이템리스트' 를 입력하여 확인해주세요. ")
	end)
	
	local key_button = {}
    
        key_button[1] = Button('', Rect(58*(1-1)+5, Sero-45, 52.5, 40))
        key_button[2] = Button('', Rect(58*(2-1)+5, Sero-45, 100, 40))
        key_button[3] = Button('', Rect(58*(5)+5, Sero-45, 52.5, 40))    
    
	for i=1, 3 do
		fullPanelM.AddChild(key_button[i])
		key_button[i].color = classic_COLOR
		key_button[i].textAlign = 4
		key_button[i].textSize = 12
	end


	for i=1, 3 do
		key_button[i].onClick.Add(function()
			key_button[i].color = blue_COLOR
			for j=1, 3 do
				if i ~= j then
					key_button[j].color = classic_COLOR
				end
			end	
		end)
	end
	
	local Item_button = {}
	local streng_text = {}
	local count_text = {}
	local Item_image = {}
	local ItemEq_text = {}

	Assi_panel.height =  5+math.ceil(#Q/6)*55.2
	for i, p in pairs(Q) do
		Item_button[i] = Button('', Rect(5+55*(((i%6==0 and 6) or i%6)-1), 5+55*(math.ceil(i/6)-1), 50, 50))
		Item_button[i].color = COLOR
		Item_image[i] = Image('', Rect(0, 0, Item_button[i].width, Item_button[i].height))
		Item_image[i].SetImageID(Client.GetItem(p).imageID)

        Item_button[i].onClick.Add(function()
			if Item_button[i].color.r == RGB then
				Item_button[i].color = blue_COLOR
				Item_image[i].SetOpacity(100)
			elseif Item_button[i].color.r == 255 then --장착중인 아이템
				
			else
				Item_button[i].color = COLOR
				Item_image[i].SetOpacity(255)
			end
        end)
            
		count_text[i] = Text(E[i], Rect(0, 37, 50, 15))
		count_text[i].textAlign = 2
		count_text[i].textSize = 11
		Item_button[i].AddChild(Item_image[i])
		Assi_panel.AddChild(Item_button[i])
		Item_image[i].AddChild(count_text[i])
	end
	--Select_Button(Q, W, R, T, Item_button, Item_image)
	
	menu_button[1].text = '재료'
	menu_button[1].onClick.Add(function()
		local jk = 0
		for i, p in pairs(Q) do
			if E[i] then
				jk = jk + 1
				Item_button[i].x = 5+55*(((jk%6==0 and 6) or jk%6)-1)
				Item_button[i].y = 5+55*(math.ceil(jk/6)-1)
				Item_button[i].visible = true
			end
		end
		Assi_panel.height =  5+math.ceil(jk/6)*55.2
	end)
	

	local Input_text = nil

	key_button[1].text = '초기화'
	key_button[1].onClick.Add(function()
		for i, p in pairs(Q) do
			Item_button[i].color = COLOR
			Item_image[i].SetOpacity(255)
            --[[
			if Eq[i] or not Client.GetItem(p).canSell then
				Item_button[i].color = red_color
			end
            ]]
		end
		Input_text = nil
		key_button[2].Destroy()
        key_button[2] = Button('', Rect(58*(2-1)+5, Sero-45, 100, 40))
		fullPanelM.AddChild(key_button[2])
		key_button[2].color = classic_COLOR
		key_button[2].textAlign = 4
		key_button[2].textSize = 14
		key_button[2].text = '수량입력(클릭)'
		key_button[2].onClick.Add(function()
			if Input_text then return end
			key_button[2].text = ""
			Input_text = InputField(Rect(0, 0, key_button[2].width, key_button[2].height))
			Input_text.textSize = 15
			Input_text.textAlign = 4
			Input_text.color = Color(255, 255, 255, 255)
			Input_text.placeholder = "<size=14><color=#FFFFFF>숫자입력\n하세요</color></size>"
			key_button[2].AddChild(Input_text)
		end)
	end)


	key_button[2].text = '수량입력'
	key_button[2].onClick.Add(function()
		if Input_text then return end
		key_button[2].text = ""
		Input_text = InputField(Rect(0, 0, key_button[2].width, key_button[2].height))
		Input_text.textSize = 15
		Input_text.textAlign = 4
		Input_text.color = Color(255, 255, 255, 255)
		Input_text.placeholder = "<size=14><color=#FFFFFF>숫자입력\n하세요</color></size>"
		key_button[2].AddChild(Input_text)
	end)
	

	
	key_button[3].text = '등록'
	key_button[3].onClick.Add(function()
		local txt = ''
		if Input_text ~= nil then
			txt = string.sub(Input_text.text, string.find(Input_text.text, '%d+')) --문자열을 제외하고 숫자만 가져옴
		else
			Client.ShowAlert('숫자를 입력해주세요.')
			return
		end
		if Input_text.text ~= txt or Input_text.text == '' or tonumber(txt) == nil then 
		--본래 적은 문자와 txt를 비교해서 다르거나, 빈칸이거나, 문자열이라 tonumber가 안되면 nil값을 반환해서 종료
			Client.ShowAlert('숫자만 입력해주세요.')
			Input_text.text = txt
			return
		end


		Client.ShowYesNoAlert("선택한 아이템을 등록하시겠습니까?", function(a)
			if a == 1 then
				local real_item = {}
				local save_count = {}
                local real_dataID = 0
                local itemImageNumber = 0
				for i, p in pairs(Q) do
					if Item_button[i].color.r == blue_COLOR.r and Item_button[i].visible then
						if tonumber(count_text[i].text) <  tonumber(txt) then
							Client.ShowAlert('실제 가진 수량보다 입력한 수량이 더 많습니다.')
							return
						end
					end
				end
				for i, p in pairs(Q) do
					if Item_button[i].color.r == blue_COLOR.r and Item_button[i].visible then
                        real_dataID = p
                        itemImageNumber = Client.GetItem(p).imageID
						table.insert(real_item, W[i])
						table.insert(save_count, E[i])
						count_text[i].text = tonumber(count_text[i].text)-tonumber(txt)
						E[i] = tonumber(count_text[i].text)
						if E[i] <= 0 then
							E[i] = false
							Item_button[i].visible = false
						end
					end
				end

                if #real_item > 1 then
                    Client.ShowAlert('한 종류의 아이템만 사용가능합니다.')
                    return
                
				elseif #real_item == 1 then
                    INSERTEDITEM = INSERTEDITEM +1
                    Select_Button(real_dataID,tonumber(txt),itemImageNumber,INSERTEDITEM)

                    for i, p in pairs(Q) do
                        Item_button[i].color = COLOR
                        Item_image[i].SetOpacity(255)
                        --[[
                        if Eq[i] or not Client.GetItem(p).canSell then
                            Item_button[i].color = red_color
                        end
                        ]]
                    end

				else
					Client.ShowAlert('선택하신 아이템이 없습니다.')
				end
			end
		end)
	end)

    
end

function startJUJANG()
    --print("클라시작")
    Client.FireEvent("startJujang")
end

miniwindowW = 170
miniwindowH = 115

function Select_Button(itemDataId,count, Item_imageNum,tarketNUM)
	if itemwindow ~= nil then
        --itemwindow.Destroy()
    end
    if tarketNUM ==1 then
        itemwindow =  Panel() 
        itemwindow.rect = Rect(Client.width/2+360/2+10-50,160,miniwindowW,miniwindowH)
        itemwindow.color = Color(63, 63, 63, 255)
        itemButtons = {}
        Item_image = {}
        itemsCount = {}
    
        local buttonStart = Button('시도',Rect(miniwindowW/2-20,miniwindowH-30,40,25))
        local buttonCancel = Button('✖',Rect(miniwindowW-25,0,20,20))
        buttonCancel.color = Color(63, 63, 63, 
        255)
        buttonStart.onClick.Add(function ()
            --jujang(Utility.JSONSerialize(packingItems), Utility.JSONSerialize(packingItemsCount),Utility.JSONSerialize(packingItemImageID))
            Client.fireEvent("주장이성공",Utility.JSONSerialize(packingItems),Utility.JSONSerialize(packingItemsCount))
            itemwindow.Destroy()
            itemwindow = nil
            if fullPanelM ~= nil then
            fullPanelM.Destroy()
            fullPanelM = nil
            INSERTEDITEM = 0
            packingItems = nil
            packingItemsCount = nil
            packingItemImageID = nil
            packingItems = {}
            packingItemsCount = {}
            packingItemImageID = {}
            end
    
        end)
    
        buttonCancel.onClick.Add(function ()
            INSERTEDITEM = 0
            itemwindow.Destroy()
            itemwindow = nil
            if fullPanelM ~= nil then
            fullPanelM.Destroy()
            fullPanelM = nil
            end
            packingItems = nil
            packingItemsCount = nil
            packingItemImageID = nil
            packingItems = {}
            packingItemsCount = {}
            packingItemImageID = {}
    
        end)

        itemwindow.AddChild(buttonStart)
        itemwindow.AddChild(buttonCancel)

        for i=1 , 3 do               
            itemButtons[i] = Button('미등록', Rect(5+(55*(i-1)),25,50,50))
            itemButtons[i].color = classic_COLOR
            itemwindow.AddChild(itemButtons[i])
        end
    end

    local number = tarketNUM

    Item_image[number] = Image('', Rect(0, 0, itemButtons[number].width, itemButtons[number].height))
    Item_image[number].SetImageID(Item_imageNum)
    itemButtons[number].text = ''
    itemsCount[number] = Text(count, Rect(0, 37, 50, 15))
    itemsCount[number].textAlign = 2
    itemsCount[number].textSize = 11
    itemButtons[number].AddChild(Item_image[number])
    Item_image[number].AddChild(itemsCount[number])


    table.insert(packingItems,itemDataId)
    table.insert(packingItemsCount,count)
    table.insert(packingItemImageID,Item_imageNum)
    --[[
    print("---------------?")
    print(number.."itemDataId : "..itemDataId)
    print(number.."count : "..count)
    print(number.."Item_imageNum : "..Item_imageNum)
    print(string.format( "%d아이템 ID : %d ,  수량 : %d , iamgeID : %d",itemDataId,count,Item_imageNum ))
]]
end
--startJUJANG()

packingItems = {}
packingItemsCount = {}
packingItemImageID = {}