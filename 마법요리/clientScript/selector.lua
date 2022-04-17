--[[                                           ]]
--[[ program :          selector      for jumal]]
--[[version :                             v 1.0]]
--[[developer :                        jakejeon]]
--[[Copyright2022. all rights reserved.        ]]
--[[                                           ]]

Client.GetTopic("MakingJob").Add(function(Q, W, E,TYPE)
	local dataID = Utility.JSONParse(Q)
	local ID = Utility.JSONParse(W)
	local count = Utility.JSONParse(E)
	selctor(dataID, ID, count,TYPE)
    --jujangMaking()
end)


--선택된 아이템 창 
function Select_Button(itemDataId,count, Item_imageNum,tarketNUM,TYPE)
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
            if TYPE == "jujang" then
                jujang(Utility.JSONSerialize(packingItems), Utility.JSONSerialize(packingItemsCount),Utility.JSONSerialize(packingItemImageID))
            elseif TYPE == "magiccooking" then
                magiccooking(Utility.JSONSerialize(packingItems), Utility.JSONSerialize(packingItemsCount),Utility.JSONSerialize(packingItemImageID))
            end
            --Client.fireEvent("주장이성공",Utility.JSONSerialize(packingItems),Utility.JSONSerialize(packingItemsCount))
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
    print("---------------")
    print(number.."itemDataId : "..itemDataId)
    print(number.."count : "..count)
    print(number.."Item_imageNum : "..Item_imageNum)
    print(string.format( "%d아이템 ID : %d ,  수량 : %d , iamgeID : %d",itemDataId,count,Item_imageNum ))
]]
end


-- 아이템 선택창
function selctor(Q, W, E,TYPE)
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
                    Select_Button(real_dataID,tonumber(txt),itemImageNumber,INSERTEDITEM,TYPE)

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


