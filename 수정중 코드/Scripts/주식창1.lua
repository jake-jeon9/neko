
function stock_shop()
    Client.FireEvent('go5')
	if stock_msk then
		stock_msk.Destroy()
	end
	stock_msk = Panel(Rect(0,0,Client.width,Client.height))
    stock_panel = Panel()
	stock_panel.color = Color(198,125,23)

    stock_panel.rect = Rect(Client.width/2-300, 60, 605, 260)
    stock_title = Text("<color=#FFFFFF>주말 코인</color>", Rect(stock_panel.width/2 - 175, -10, 350, 50))
	stock_title.textAlign = 7
	stock_title.textSize = 24

    stock_panel.AddChild(stock_title)
	stock_p1 = Panel(Rect(10,50,135,95))
	stock_p1.color = Color(0,48,8)
	stock_p2 = Panel(Rect(160,50,135,95))
	stock_p2.color = Color(0,48,8)
	stock_p3 = Panel(Rect(310,50,135,95))
	stock_p3.color = Color(0,48,8)
	stock_p4 = Panel(Rect(460,50,135,95))
	stock_p4.color = Color(0,48,8)
	stock_p5 = Panel(Rect(10,155,135,95))
	stock_p5.color = Color(0,48,8)
	stock_p6 = Panel(Rect(160,155,135,95))
	stock_p6.color = Color(0,48,8)
	stock_p7 = Panel(Rect(310,155,135,95))
	stock_p7.color = Color(0,48,8)
	stock_p8 = Panel(Rect(460,155,135,95))
	stock_p8.color = Color(0,48,8)

	
    img_1 = Image("Icons/돼지코인.png", Rect(stock_p1.width/2 - 50, 30, 30, 30))
    img_2 = Image("Icons/와플코인.png", Rect(stock_p2.width/2 - 50, 30, 30, 30))
    img_3 = Image("Icons/아이다코인.png", Rect(stock_p3.width/2 - 50, 30, 30, 30))
    img_4 = Image("Icons/세제코인.png", Rect(stock_p4.width/2 - 50, 30, 30, 30))
	img_5 = Image("Icons/꼴까닥코인.png", Rect(stock_p5.width/2 - 50, 30, 30, 30))
	img_6 = Image("Icons/모르고코인.png", Rect(stock_p6.width/2 - 50, 30, 30, 30))
	img_7 = Image("Icons/우유코인.png", Rect(stock_p7.width/2 - 50, 30, 30, 30))
	img_8 = Image("Icons/네코인.png", Rect(stock_p8.width/2 - 50, 30, 30, 30))

    text_stock1 = Text("<color=#FEE2A6>[돼지]</color>", Rect(stock_p1.width/2 - 75, -10, 150, 60))
    text_stock2 = Text("<color=#FEE2A6>[와플]</color>", Rect(stock_p2.width/2 - 75, -10, 150, 60))
    text_stock3 = Text("<color=#FEE2A6>[아이다]</color>", Rect(stock_p3.width/2 - 75, -10, 150, 60))
    text_stock4 = Text("<color=#FEE2A6>[세제]</color>", Rect(stock_p4.width/2 - 75, -10, 150, 60))
	text_stock5 = Text("<color=#FEE2A6>[꼴까닥]</color>", Rect(stock_p5.width/2 - 75, -10, 150, 60))
	text_stock6 = Text("<color=#FEE2A6>[모르고]</color>", Rect(stock_p6.width/2 - 75, -10, 150, 60))
	text_stock7 = Text("<color=#FEE2A6>[우유]</color>", Rect(stock_p7.width/2 - 75, -10, 150, 60))
	text_stock8 = Text("<color=#FEE2A6>[네]</color>", Rect(stock_p8.width/2 - 75, -10, 150, 60))
	text_stock1.textAlign = 4
	text_stock2.textAlign = 4
	text_stock3.textAlign = 4
	text_stock4.textAlign = 4
	text_stock5.textAlign = 4
	text_stock6.textAlign = 4
	text_stock7.textAlign = 4
	text_stock8.textAlign = 4

    text_price_stock1 = Text("1000", Rect(10, 30, 85, 30))
    text_price_stock2 = Text("1000", Rect(10, 30, 85, 30))
    text_price_stock3 = Text("1000", Rect(10, 30, 85, 30))
    text_price_stock4 = Text("1000", Rect(10, 30, 85, 30))
	text_price_stock5 = Text("1000", Rect(10, 30, 85, 30))
	text_price_stock6 = Text("1000", Rect(10, 30, 85, 30))
	text_price_stock7 = Text("1000", Rect(10, 30, 85, 30))
	text_price_stock8 = Text("1000", Rect(10, 30, 85, 30))
	
	text_price_stock1.textAlign = 5
	text_price_stock2.textAlign = 5
	text_price_stock3.textAlign = 5
	text_price_stock4.textAlign = 5
	text_price_stock5.textAlign = 5
	text_price_stock6.textAlign = 5
	text_price_stock7.textAlign = 5
	text_price_stock8.textAlign = 5
    
    price1 = Text("<color=#FFFF00> BN</color>", Rect(95, 30, 50, 30))
    price2 = Text("<color=#FFFF00> BN</color>", Rect(95, 30, 50, 30))
    price3 = Text("<color=#FFFF00> BN</color>", Rect(95, 30, 50, 30))
    price4 = Text("<color=#FFFF00> BN</color>", Rect(95, 30, 50, 30))
	price5 = Text("<color=#FFFF00> BN</color>", Rect(95, 30, 50, 30))
	price6 = Text("<color=#FFFF00> BN</color>", Rect(95, 30, 50, 30))
	price7 = Text("<color=#FFFF00> BN</color>", Rect(95, 30, 50, 30))
	price8 = Text("<color=#FFFF00> BN</color>", Rect(95, 30, 50, 30))

  
    


    btn_buy1 = Button("<color=#ff0000>매수</color>", Rect(stock_p1.width/2 - 50, 70, 30, 20))
	btn_buy1.color = Color(198,125,23)
    btn_sell1 = Button("<color=#01deff>매도</color>", Rect(stock_p1.width/2 + 20, 70, 30, 20))
	btn_sell1.color = Color(198,125,23)

    btn_buy2 = Button("<color=#ff0000>매수</color>", Rect(stock_p1.width/2 - 50, 70, 30, 20))
	btn_buy2.color = Color(198,125,23)
    btn_sell2 = Button("<color=#01deff>매도</color>", Rect(stock_p1.width/2 + 20, 70, 30, 20))
	btn_sell2.color = Color(198,125,23)

    btn_buy3 = Button("<color=#ff0000>매수</color>", Rect(stock_p1.width/2 - 50, 70, 30, 20))
	btn_buy3.color = Color(198,125,23)
    btn_sell3 = Button("<color=#01deff>매도</color>", Rect(stock_p1.width/2 + 20, 70, 30, 20))
	btn_sell3.color = Color(198,125,23)

    btn_buy4 = Button("<color=#ff0000>매수</color>", Rect(stock_p1.width/2 - 50, 70, 30, 20))
	btn_buy4.color = Color(198,125,23)
    btn_sell4 = Button("<color=#01deff>매도</color>", Rect(stock_p1.width/2 + 20, 70, 30, 20))
	btn_sell4.color = Color(198,125,23)
	
	btn_buy5 = Button("<color=#ff0000>매수</color>", Rect(stock_p1.width/2 - 50, 70, 30, 20))
	btn_buy5.color = Color(198,125,23)
    btn_sell5 = Button("<color=#01deff>매도</color>", Rect(stock_p1.width/2 + 20, 70, 30, 20))
	btn_sell5.color = Color(198,125,23)
	
	btn_buy6 = Button("<color=#ff0000>매수</color>", Rect(stock_p1.width/2 - 50, 70, 30, 20))
	btn_buy6.color = Color(198,125,23)
    btn_sell6 = Button("<color=#01deff>매도</color>", Rect(stock_p1.width/2 + 20, 70, 30, 20))
	btn_sell6.color = Color(198,125,23)
	
	btn_buy7 = Button("<color=#ff0000>매수</color>", Rect(stock_p1.width/2 - 50, 70, 30, 20))
	btn_buy7.color = Color(198,125,23)
    btn_sell7 = Button("<color=#01deff>매도</color>", Rect(stock_p1.width/2 + 20, 70, 30, 20))
	btn_sell7.color = Color(198,125,23)
	
	btn_buy8 = Button("<color=#ff0000>매수</color>", Rect(stock_p1.width/2 - 50, 70, 30, 20))
	btn_buy8.color = Color(198,125,23)
    btn_sell8 = Button("<color=#01deff>매도</color>", Rect(stock_p1.width/2 + 20, 70, 30, 20))
	btn_sell8.color = Color(198,125,23)

    btn_can = Button("닫기", Rect(stock_panel.width/1 - 70, 10, 60, 20))
	btn_can.color = Color(0,48,8)
    
	stock_msk.AddChild(stock_panel)
    stock_panel.AddChild(btn_can)
	
	stock_panel.AddChild(stock_p1)
	stock_panel.AddChild(stock_p2)
	stock_panel.AddChild(stock_p3)
	stock_panel.AddChild(stock_p4)
	stock_panel.AddChild(stock_p5)
	stock_panel.AddChild(stock_p6)
	stock_panel.AddChild(stock_p7)
	stock_panel.AddChild(stock_p8)

    stock_p1.AddChild(price1)
    stock_p2.AddChild(price2)
    stock_p3.AddChild(price3)
    stock_p4.AddChild(price4)
	stock_p5.AddChild(price5)
	stock_p6.AddChild(price6)
	stock_p7.AddChild(price7)
	stock_p8.AddChild(price8)

    stock_p1.AddChild(text_price_stock1)
    stock_p2.AddChild(text_price_stock2)
    stock_p3.AddChild(text_price_stock3)
    stock_p4.AddChild(text_price_stock4)
	stock_p5.AddChild(text_price_stock5)
	stock_p6.AddChild(text_price_stock6)
	stock_p7.AddChild(text_price_stock7)
	stock_p8.AddChild(text_price_stock8)

    stock_p1.AddChild(btn_buy1)
    stock_p1.AddChild(btn_sell1)
    stock_p2.AddChild(btn_buy2)
    stock_p2.AddChild(btn_sell2)
    stock_p3.AddChild(btn_buy3)
    stock_p3.AddChild(btn_sell3)
    stock_p4.AddChild(btn_buy4)
    stock_p4.AddChild(btn_sell4)
	stock_p5.AddChild(btn_buy5)
    stock_p5.AddChild(btn_sell5)
	stock_p6.AddChild(btn_buy6)
    stock_p6.AddChild(btn_sell6)
	stock_p7.AddChild(btn_buy7)
    stock_p7.AddChild(btn_sell7)
	stock_p8.AddChild(btn_buy8)
    stock_p8.AddChild(btn_sell8)

    stock_p1.AddChild(text_stock1)
    stock_p2.AddChild(text_stock2)
    stock_p3.AddChild(text_stock3)
    stock_p4.AddChild(text_stock4)
	stock_p5.AddChild(text_stock5)
	stock_p6.AddChild(text_stock6)
	stock_p7.AddChild(text_stock7)
	stock_p8.AddChild(text_stock8)

    stock_p1.AddChild(img_1)
    stock_p2.AddChild(img_2)
    stock_p3.AddChild(img_3)
    stock_p4.AddChild(img_4)
	stock_p5.AddChild(img_5)
	stock_p6.AddChild(img_6)
	stock_p7.AddChild(img_7)
	stock_p8.AddChild(img_8)

    stock_panel.SetOpacity(200)
	stock_msk.showOnTop = true

    Client.GetTopic('stock').Add(pricing)

    btn_buy1.onClick.Add(function()
        Client.FireEvent('buy1')
    end)
    btn_buy2.onClick.Add(function()
        Client.FireEvent('buy2')
    end)
    btn_buy3.onClick.Add(function()
        Client.FireEvent('buy3')
    end)
    btn_buy4.onClick.Add(function()
        Client.FireEvent('buy4')
    end)
	btn_buy5.onClick.Add(function()
        Client.FireEvent('buy5')
    end)
	btn_buy6.onClick.Add(function()
        Client.FireEvent('buy6')
    end)
	btn_buy7.onClick.Add(function()
        Client.FireEvent('buy7')
    end)
	btn_buy8.onClick.Add(function()
        Client.FireEvent('buy8')
    end)

    btn_sell1.onClick.Add(function()
        Client.FireEvent('ck1')
    end)
    btn_sell2.onClick.Add(function()
        Client.FireEvent('ck2')
    end)
    btn_sell3.onClick.Add(function()
        Client.FireEvent('ck3')
    end)
    btn_sell4.onClick.Add(function()
        Client.FireEvent('ck4')
    end)
	btn_sell5.onClick.Add(function()
        Client.FireEvent('ck5')
    end)
	btn_sell6.onClick.Add(function()
        Client.FireEvent('ck6')
    end)
	btn_sell7.onClick.Add(function()
        Client.FireEvent('ck7')
    end)
	btn_sell8.onClick.Add(function()
        Client.FireEvent('ck8')
    end)

    btn_can.onClick.Add(function()
    if stock_msk then 
		stock_msk.Destroy() 
	end
    Client.FireEvent('bringback')
    end)


    
--[[인풋라인]]
    input_text_info = Text("구매 원하시는 주식을 선택해주세요.",Rect(5,5,200,17))
    input_text_info.textSize = 12
    
    input_text_selected = Text("",Rect(5,25,50,25))
    input_text_selected.text = '[______]'
    input_text_selected.textSize = 12
    
    input_text_count = InputField(Rect(60,25,60,25))
    input_text_count.placeholder  = '수량입력'
    input_text_count.textSize = 10
    input_text_count.textAlign = 4
    local target = ""
    local count = ""
    input_text_Bt_buy = Button("매수",Rect(130,25,40,25))
    input_text_Bt_buy.textColor = Color(57, 3, 255, 255)
    
    input_text_Bt_buy.onClick.Add(function()
        target = input_text_selected.text
        count = input_text_count.text
        if input_text_count.text == '' or tonumber(count) == nil then 
            --본래 적은 문자와 txt를 비교해서 다르거나, 빈칸이거나, 문자열이라 tonumber가 안되면 nil값을 반환해서 종료
                Client.ShowAlert('숫자만 입력해주세요.')
                input_text_count.text = 0;
                return
        else
            Client.FireEvent("stock_buy", target,tonumber(count))
        end
    
    end)
    input_text_Bt_sell = Button("매도",Rect(175,25,40,25))
    input_text_Bt_sell.textColor = Color(245, 66, 66, 255)
    
    input_text_Bt_sell.onClick.Add(function()
        target = input_text_selected.text
        count = input_text_count.text
        if input_text_count.text == '' or tonumber(count) == nil then 
            --본래 적은 문자와 txt를 비교해서 다르거나, 빈칸이거나, 문자열이라 tonumber가 안되면 nil값을 반환해서 종료
                Client.ShowAlert('숫자만 입력해주세요.')
                input_text_count.placeholder = 0;
                return
        else
            Client.FireEvent("stock_sell", target,tonumber(count))
        end
    
    end)
    stock_panel.AddChild(input_text_info)
    stock_panel.AddChild(input_text_selected)
    stock_panel.AddChild(input_text_count)
    stock_panel.AddChild(input_text_Bt_buy)
    stock_panel.AddChild(input_text_Bt_sell)
    
    
    
    local choice = {}
    for i = 1 , 8 do
        choice[i] = Button("선택",Rect(stock_p1.width-20, 0, 20, 20))
        local text = ""
        choice[i].onClick.Add(function()
            
          
            for j=1,8 do
                if j== i then
                    choice[j].text = "V"        
                else
                    choice[j].text = " "
                end
            end

            if i == 1 then
                text = "[돼  지]"
            elseif i ==2 then
                text = "[와  플]"
            elseif i ==3 then
                text = "[아이다]"
            elseif i ==4 then
                text = "[세  제]"
            elseif i ==5 then
                text = "[꼴까닥]"
            elseif i ==6 then
                text = "[모르고]"
            elseif i ==7 then
                text = "[우  유]"
            else
                text = "[  네  ]"
            end
            input_text_selected.text = text
        end)
        
    end
    
    
    stock_p1.AddChild(choice[1])
    stock_p2.AddChild(choice[2])
    stock_p3.AddChild(choice[3])
    stock_p4.AddChild(choice[4])
    stock_p5.AddChild(choice[5])
    stock_p6.AddChild(choice[6])
    stock_p7.AddChild(choice[7])
    stock_p8.AddChild(choice[8])


end

function pricing(text)
    if (tonumber(string.sub(text,1,1)) == 1) then
        text_price_stock1.text = string.sub(text,3,string.len(text))
    elseif(tonumber(string.sub(text,1,1)) == 2) then
        text_price_stock2.text = string.sub(text,3,string.len(text))
    elseif(tonumber(string.sub(text,1,1)) == 3) then
        text_price_stock3.text = string.sub(text,3,string.len(text))
    elseif(tonumber(string.sub(text,1,1)) == 4) then
        text_price_stock4.text = string.sub(text,3,string.len(text))
	elseif(tonumber(string.sub(text,1,1)) == 5) then
        text_price_stock5.text = string.sub(text,3,string.len(text))
	elseif(tonumber(string.sub(text,1,1)) == 6) then
        text_price_stock6.text = string.sub(text,3,string.len(text))
	elseif(tonumber(string.sub(text,1,1)) == 7) then
        text_price_stock7.text = string.sub(text,3,string.len(text))
	elseif(tonumber(string.sub(text,1,1)) == 8) then
        text_price_stock8.text = string.sub(text,3,string.len(text))
    end
  end

function setting()
    Client.FireEvent('set_price')
end

function pro_setting()
    Client.FireEvent('auto')
end

function sell1()
    Client.FireEvent('stk1')
end
function sell2()
    Client.FireEvent('stk2')
end
function sell3()
    Client.FireEvent('stk3')
end
function sell4()
    Client.FireEvent('stk4')
end
function sell5()
    Client.FireEvent('stk5')
end
function sell6()
    Client.FireEvent('stk6')
end
function sell7()
    Client.FireEvent('stk7')
end
function sell8()
    Client.FireEvent('stk8')
end