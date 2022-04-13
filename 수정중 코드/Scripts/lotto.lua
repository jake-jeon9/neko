cw = Client.width
ch = Client.height

sw = 300
sh = 400



function startLotto()
    Client.FireEvent("로또선택")
end

Client.GetTopic("로또시작").Add(function(times,today,drawdate,price)
    if lotto_mask then
        lotto_mask.Destroy()
    end

    classic_RGB = 150
    classic_COLOR = Color(classic_RGB, classic_RGB, classic_RGB, 0)

    lotto_mask = Panel(Rect(cw*0.3,0,sw,sh))
    lotto_pnl = Image("Pictures/lotto2.png",Rect(0,0,sw,sh))

    lotto_times = Text(times,Rect(sw/2-10-3,sh/4-10+2,30,30))
    lotto_times.textSize  = 15
    lotto_times.color = Color(0,0,0)

    lotto_totday = Text(today,Rect(90,sh/4+10+10,300,30))
    lotto_totday.textSize  = 11
    lotto_totday.color = Color(255,0,0)

    lotto_draw = Text(drawdate,Rect(90,sh/4+30+3,300,30))
    lotto_draw.textSize  = 11
    lotto_draw.color = Color(0,0,255)

    lotto_price = Text(price,Rect(0,sh/2-10+80+3,250,30))
    lotto_price.textSize  = 16
    lotto_price.textAlign = 5
    lotto_price.color = Color(12,12,12)

    local button_data = {}
    local button = {}
    buttonInit = Button("구매",Rect(sw/2-20,sh-40,30,20))
    buttonInit.color = Color(125,125,125)
    buttonInit.textColor = Color(0, 0, 0)
    buttonInit.textSize = 15
	buttonInit.SetOpacity(0)
    buttonInit.showOnTop = true

    buttonInit.onClick.Add(function()
        local count = getTableSize(button_data)
        if count <4 then
            Client.FireEvent("숫자부족")
        elseif count >4 then
            Client.FireEvent("선택초과")
            lotto_mask.Destroy()

        else
            Client.FireEvent("로또구매",Utility.JSONSerialize(button_data),times,today,drawdate)
            lotto_mask.Destroy()
        end
    end)

    buttonAutoBuy = Button("자동구매",Rect(50,sh-40,80,20))
    buttonAutoBuy.color = Color(125,125,125)
    buttonAutoBuy.textColor = Color(0, 0, 0)
    buttonAutoBuy.textSize = 15
	buttonAutoBuy.SetOpacity(0)
    buttonAutoBuy.showOnTop = true

    buttonAutoBuy.onClick.Add(function()
        Client.FireEvent("로또자동구매",times,today,drawdate)
        lotto_mask.Destroy()
    end)

    buttonCancel= Button("취소",Rect(sw/2+20,sh-40,30,20))
    buttonCancel.textSize = 15
    buttonCancel.color = Color(125,125,125)
    buttonCancel.textColor = Color(0, 0, 0)
	buttonCancel.SetOpacity(1)
    buttonCancel.showOnTop = true
    buttonCancel.onClick.Add(function()
		lotto_mask.Destroy()
	end)

    lotto_mask.AddChild(lotto_pnl)
    lotto_pnl.AddChild(buttonAutoBuy)
    lotto_pnl.AddChild(buttonInit)
    lotto_pnl.AddChild(buttonCancel)
    lotto_pnl.AddChild(lotto_times)
    lotto_pnl.AddChild(lotto_totday)
    lotto_pnl.AddChild(lotto_draw)
    lotto_pnl.AddChild(lotto_price)

    for i=1 ,20 do    
        ball_img = nil
        if i < 6 then
            button[i] = Button(i,Rect(46-i+((i-1)*50),sh/2-10,25,20))
        elseif i< 11 then
            local k = i-5
            button[i] = Button(i,Rect(46-k+((k-1)*50),sh/2-10+20,25,20))
        elseif i< 16 then
            local k = i-10
            button[i] = Button(i,Rect(46-k+((k-1)*50),sh/2-10+20+20,25,20))
            
        else
            local k = i-15
            button[i] = Button(i,Rect(46-k+((k-1)*50),sh/2-10+20+20+20,25,20))
        end

        button[i].textColor = Color(0,0,0)
        button[i].setOpacity(0)
        button[i].showOnTop = true
        button[i].text = i
        lotto_pnl.AddChild(button[i])
        button[i].onClick.add(function ()
            button[i].textColor = Color(255,0,0)
            button[i].color = Color(125,125,125)
            if not checkDouble(button_data,i) then
                table.insert(button_data,i)
            end
        end)
    end
end)

function getTableSize(t)
    local count = 0
    for _, __ in pairs(t) do
        count = count + 1
    end
    return count
end

function checkDouble(button_data,i)
    local date = false

    for _,q in pairs(button_data) do
        if q == i then
        date = true
        --print("중복발견 : "..i)
        break
        end
    end

    return date
end

function repurchase()
    Client.FireEvent("로또초기화")
end


Client.GetTopic("초기화묻기").Add(function(myTurn,myNum)
    if MarryW_msk then
        MarryW_msk.Destroy()
    end
    MarryW_msk = Panel(Rect(0,0,cw,ch))
    MarryW_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-150,ch/2-100,300,180))
    MarryW_txt = Text(myTurn.."회차 로또를 초기화하시겠습니까?\n내가 구매한 번호"..myNum,Rect(0,0,300,150))
    MarryW_txt.textAlign = 4
    MarryW_btn1 = Button("확인",Rect(85,150,60,30))
    MarryW_btn1.onClick.Add(function()
        Client.FireEvent("로또초기화하기")
        MarryW_msk.Destroy()
    end)
    MarryW_btn2 = Button("취소",Rect(155,150,60,30))
    MarryW_btn2.onClick.Add(function()
        MarryW_msk.Destroy()
    end)
	MarryW_btn1.SetOpacity(0)
	MarryW_btn2.SetOpacity(0)

    MarryW_msk.showOnTop = true
    MarryW_msk.AddChild(MarryW_pnl)
    MarryW_pnl.AddChild(MarryW_txt)
    MarryW_pnl.AddChild(MarryW_btn1)
    MarryW_pnl.AddChild(MarryW_btn2)
end)


function checkMyLotto()
    Client.FireEvent("내로또조회")
end

Client.GetTopic("로또구매").Add(function(times,mynum,today,drawdate)
    
end)

Client.GetTopic("로또확인").Add(function(times,mynum,today,drawdate)
    if lotto_mask then
        lotto_mask.Destroy()
    end
   
    local sortB = Utility.JSONParse(mynum)
    local textNum = sortB[1].."/"..sortB[2].."/"..sortB[3].."/"..sortB[4]
    
    classic_RGB = 150
    classic_COLOR = Color(classic_RGB, classic_RGB, classic_RGB, 0)

    lotto_mask = Panel(Rect(cw*0.3,0,sw,sh))
    --lotto_pnl = Image("Pictures/lotto.png",Rect(cw*0.3,ch/10,sw,sh))
    lotto_pnl = Image("Pictures/lotto.png",Rect(0,0,sw,sh))

    lotto_times = Text(times,Rect(sw/2-10-3,sh/4-10+2,30,30))
    lotto_times.textSize  = 15
    lotto_times.color = Color(0,0,0)

    lotto_totday = Text(today,Rect(90,sh/4+10+10,300,30))
    lotto_totday.textSize  = 11
    lotto_totday.color = Color(255,0,0)

    lotto_draw = Text(drawdate,Rect(90,sh/4+30+3,300,30))
    lotto_draw.textSize  = 11
    lotto_draw.color = Color(0,0,255)

    lotto_myNum = Text(textNum,Rect(0,sh/2+10,300,40))
    lotto_myNum.textSize  = 30
    lotto_myNum.textAlign = 4
    lotto_myNum.color = Color(0,0,0)

    buttonInit = Button("당첨확인",Rect(sw/2-100,sh-40,100,20))
    buttonInit.color = Color(125,125,125)
    buttonInit.textColor = Color(0, 0, 0)
    buttonInit.textSize = 15
	buttonInit.SetOpacity(0)
    buttonInit.showOnTop = true
    --buttonInit.textColor = COLOR(0,0,0,0)

    buttonInit.onClick.Add(function()
            Client.FireEvent("당첨확인",times,mynum)
            lotto_mask.Destroy()
    end)

    buttonCancel= Button("취소",Rect(sw/2+20,sh-40,30,20))
    buttonCancel.textSize = 15
    buttonCancel.color = Color(125,125,125)
    buttonCancel.textColor = Color(0, 0, 0)
	buttonCancel.SetOpacity(1)
    buttonCancel.showOnTop = true
    buttonCancel.onClick.Add(function()
		lotto_mask.Destroy()
	end)

    lotto_mask.AddChild(lotto_pnl)
    lotto_pnl.AddChild(buttonInit)
    lotto_pnl.AddChild(buttonCancel)
    lotto_pnl.AddChild(lotto_times)
    lotto_pnl.AddChild(lotto_totday)
    lotto_pnl.AddChild(lotto_draw)
    lotto_pnl.AddChild(lotto_myNum)

end)