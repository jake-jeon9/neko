

function ApplyGoToFriend()
    if FamilyN_msk then
        FamilyN_msk.Destroy()
    end

    FamilyN_msk = Panel(Rect(0,0,cw,ch))
    FamilyN_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-200,ch/2-125,400,250))
    FamilyN_txt = Text("친구갈래 쓸 유저를 입력하세요",Rect(0,0,400,150))
    FamilyN_txt.textAlign = 4
    FamilyN_input = InputField(Rect(125,150-45,150,30))
    FamilyN_input.placeholder = '닉네임을 입력해주세요.'
    FamilyN_btn1 = Button("시도",Rect(200-65,200,60,50))
    FamilyN_btn1.textSize = 15
	FamilyN_btn1.SetOpacity(0)
    FamilyN_btn1.onClick.Add(function()
        if FamilyN_input.text == "" then
            Client.ShowAlert("유저명을 입력하세요.")
        else
            Client.FireEvent("친구갈래", FamilyN_input.text)
			FamilyN_msk.Destroy()
        end
    end)
	FamilyN_btn2 = Button("취소",Rect(200+5,200,60,50))
	FamilyN_btn2.textSize = 15
	FamilyN_btn2.SetOpacity(0)
    FamilyN_btn2.onClick.Add(function()
		FamilyN_msk.Destroy()
	end)
    FamilyN_msk.showOnTop = true
    FamilyN_msk.AddChild(FamilyN_pnl)
    FamilyN_pnl.AddChild(FamilyN_txt)
    FamilyN_pnl.AddChild(FamilyN_input)
    FamilyN_pnl.AddChild(FamilyN_btn1)
	FamilyN_pnl.AddChild(FamilyN_btn2)
end


function ApplyComeFriend()
    if FamilyN_msk then
        FamilyN_msk.Destroy()
    end
    
    FamilyN_msk = Panel(Rect(0,0,cw,ch))
    FamilyN_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-200,ch/2-125,400,250))
    FamilyN_txt = Text("친구이리 쓸 유저를 입력하세요",Rect(0,0,400,150))
    FamilyN_txt.textAlign = 4
    FamilyN_input = InputField(Rect(125,150-45,150,30))
    FamilyN_input.placeholder = '닉네임을 입력해주세요.'
    FamilyN_btn1 = Button("시도",Rect(200-65,200,60,50))
    FamilyN_btn1.textSize = 15
	FamilyN_btn1.SetOpacity(0)
    FamilyN_btn1.onClick.Add(function()
        if FamilyN_input.text == "" then
            Client.ShowAlert("유저명을 입력하세요.")
        else
            Client.FireEvent("친구이리", FamilyN_input.text)
			FamilyN_msk.Destroy()
        end
    end)
	FamilyN_btn2 = Button("취소",Rect(200+5,200,60,50))
	FamilyN_btn2.textSize = 15
	FamilyN_btn2.SetOpacity(0)
    FamilyN_btn2.onClick.Add(function()
		FamilyN_msk.Destroy()
	end)
    FamilyN_msk.showOnTop = true
    FamilyN_msk.AddChild(FamilyN_pnl)
    FamilyN_pnl.AddChild(FamilyN_txt)
    FamilyN_pnl.AddChild(FamilyN_input)
    FamilyN_pnl.AddChild(FamilyN_btn1)
	FamilyN_pnl.AddChild(FamilyN_btn2)
end


function ApplywhereFriend(name)
    if FamilyN_msk then
        FamilyN_msk.Destroy()
    end
    
    FamilyN_msk = Panel(Rect(0,0,cw,ch))
    FamilyN_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-200,ch/2-125,400,250))
    FamilyN_txt = Text("위치를 알고싶은 유저를 입력하세요",Rect(0,0,400,150))
    FamilyN_txt.textAlign = 4
    FamilyN_input = InputField(Rect(125,150-45,150,30))
    FamilyN_input.placeholder = '닉네임을 입력해주세요.'
    FamilyN_btn1 = Button("시도",Rect(200-65,200,60,50))
    FamilyN_btn1.textSize = 15
	FamilyN_btn1.SetOpacity(0)
    FamilyN_btn1.onClick.Add(function()
        if FamilyN_input.text == "" then
            Client.ShowAlert("유저명을 입력하세요.")
        else
            Client.FireEvent("친구어디", FamilyN_input.text)
			FamilyN_msk.Destroy()
        end
    end)
	FamilyN_btn2 = Button("취소",Rect(200+5,200,60,50))
	FamilyN_btn2.textSize = 15
	FamilyN_btn2.SetOpacity(0)
    FamilyN_btn2.onClick.Add(function()
		FamilyN_msk.Destroy()
	end)
    FamilyN_msk.showOnTop = true
    FamilyN_msk.AddChild(FamilyN_pnl)
    FamilyN_pnl.AddChild(FamilyN_txt)
    FamilyN_pnl.AddChild(FamilyN_input)
    FamilyN_pnl.AddChild(FamilyN_btn1)
	FamilyN_pnl.AddChild(FamilyN_btn2)
end


Client.GetTopic("친구이리").Add(function (target,taker)
    if FamilyN_msk then
        FamilyN_msk.Destroy()
    end
    
    FamilyN_msk = Panel(Rect(0,0,cw,ch))
    FamilyN_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-200,ch/2-125,400,250))
    FamilyN_txt = Text(taker.." 유저가 당신을 소환하려합니다.\n 동의하십니까?",Rect(0,0,400,150))
    FamilyN_txt.textAlign = 4
    FamilyN_btn1 = Button("동의",Rect(200-65,200,60,50))
    FamilyN_btn1.textSize = 15
	FamilyN_btn1.SetOpacity(0)
    FamilyN_btn1.onClick.Add(function()
        Client.FireEvent("친구이리동의",target,taker)
		FamilyN_msk.Destroy()
    end)
	FamilyN_btn2 = Button("거절",Rect(200+5,200,60,50))
	FamilyN_btn2.textSize = 15
	FamilyN_btn2.SetOpacity(0)
    FamilyN_btn2.onClick.Add(function()
		Client.FireEvent("친구이리거절",target,taker)
        FamilyN_msk.Destroy()
	end)
    FamilyN_msk.showOnTop = true
    FamilyN_msk.AddChild(FamilyN_pnl)
    FamilyN_pnl.AddChild(FamilyN_txt)
    FamilyN_pnl.AddChild(FamilyN_btn1)
	FamilyN_pnl.AddChild(FamilyN_btn2)

end)

function ApplyGotoGOMOK()
    Client.FireEvent("나고목갈래")
end

function ApplyGotoLOTTO()
    Client.FireEvent("나로또갈래")
end

function ApplyGotoFISING()
    Client.FireEvent("나낚시갈래")
end

function ApplyGotoCITYHALL()
    Client.FireEvent("나시청갈래")
end

function ApplyGotoWEDDING1()
    Client.FireEvent("나웨딩갈래1")
end

function ApplyGotoWEDDING2()
    Client.FireEvent("나웨딩갈래2")
end


function ApplyGotoGHOST()
    Client.FireEvent("나유령갈래")
end

function ApplyGotoHAPPYOX()
    Client.FireEvent("나해피오엑스갈래")
end

function ApplyGotoEVEROX()
    Client.FireEvent("나에버오엑스갈래")
end

function ApplyGotoWITCH()
    Client.FireEvent("나마녀갈래")
end

function ApplyGotoKOPIA()
    Client.FireEvent("나꼬피아갈래")
end
