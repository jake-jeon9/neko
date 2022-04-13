
cw = Client.width
ch = Client.height

function Marry_open()
    if Marry_msk then
        Marry_msk.Destroy()
    end
    Marry_msk = Panel(Rect(0,0,cw,ch))
    Marry_pnl = Image("Pictures/혼인신고.png",Rect(cw/2-200,ch/2-125,400,250))
    Marry_input = InputField(Rect(125,110,150,30))
    Marry_btn1 = Button("결혼신청",Rect(200-65,200,60,50))
    Marry_btn1.textSize = 15
	Marry_btn1.SetOpacity(0)
    Marry_btn1.onClick.Add(function()
        if Marry_input.text == "" then
            Client.ShowAlert("배우자의 이름을 입력하세요.")
        else
            Client.FireEvent("결혼신청", Marry_input.text)
			Marry_msk.Destroy()
        end
    end)
	Marry_btn2 = Button("취소",Rect(200+5,200,60,50))
	Marry_btn2.textSize = 15
	Marry_btn2.SetOpacity(0)
    Marry_btn2.onClick.Add(function()
		Marry_msk.Destroy()
	end)
    Marry_msk.showOnTop = true
    Marry_msk.AddChild(Marry_pnl)
    Marry_pnl.AddChild(Marry_input)
    Marry_pnl.AddChild(Marry_btn1)
	Marry_pnl.AddChild(Marry_btn2)
end
Client.GetTopic("결혼").Add(Marry_open)

Client.GetTopic("결혼신청대기").Add(function(nm)
    if MarryW_msk then
        MarryW_msk.Destroy()
    end
    MarryW_msk = Panel(Rect(0,0,cw,ch))
    MarryW_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-150,ch/2-100,300,180))
    MarryW_txt = Text(nm.."님의 결혼을 수락하시겠습니까?",Rect(0,0,300,150))
    MarryW_txt.textAlign = 4
    MarryW_btn1 = Button("수락",Rect(85,150,60,30))
    MarryW_btn1.onClick.Add(function()
        Client.FireEvent("결혼수락", nm)
        MarryW_msk.Destroy()
    end)
    MarryW_btn2 = Button("거절",Rect(155,150,60,30))
    MarryW_btn2.onClick.Add(function()
        Client.FireEvent("결혼거절",nm)
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

Client.GetTopic("결혼닫기").Add(function()
	Marry_msk.Destroy()
end)


--이혼 시작

function Devorce_open()
    if Marry_msk then
        Marry_msk.Destroy()
    end
    Marry_msk = Panel(Rect(0,0,cw,ch))
    Marry_pnl = Image("Pictures/혼인신고.png",Rect(cw/2-200,ch/2-125,400,250))
    Marry_input = InputField(Rect(125,110,150,30))
    Marry_btn1 = Button("이혼신청",Rect(200-65,200,60,50))
    Marry_btn1.textSize = 15
	Marry_btn1.SetOpacity(0)
    Marry_btn1.onClick.Add(function()
        if Marry_input.text == "" then
            Client.ShowAlert("배우자의 이름을 입력하세요.")
        else
            Client.FireEvent("이혼신청", Marry_input.text)
			Marry_msk.Destroy()
        end
    end)
	Marry_btn2 = Button("취소",Rect(200+5,200,60,50))
	Marry_btn2.textSize = 15
	Marry_btn2.SetOpacity(0)
    Marry_btn2.onClick.Add(function()
		Marry_msk.Destroy()
	end)
    Marry_msk.showOnTop = true
    Marry_msk.AddChild(Marry_pnl)
    Marry_pnl.AddChild(Marry_input)
    Marry_pnl.AddChild(Marry_btn1)
	Marry_pnl.AddChild(Marry_btn2)
end
Client.GetTopic("이혼").Add(Devorce_open)

Client.GetTopic("이혼신청대기").Add(function(nm)
    if MarryW_msk then
        MarryW_msk.Destroy()
    end
    MarryW_msk = Panel(Rect(0,0,cw,ch))
    MarryW_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-150,ch/2-100,300,180))
    MarryW_txt = Text(nm.."님의 이혼을 수락하시겠습니까?",Rect(0,0,300,150))
    MarryW_txt.textAlign = 4
    MarryW_btn1 = Button("수락",Rect(85,150,60,30))
    MarryW_btn1.onClick.Add(function()
        Client.FireEvent("이혼수락", nm)
        MarryW_msk.Destroy()
    end)
    MarryW_btn2 = Button("거절",Rect(155,150,60,30))
    MarryW_btn2.onClick.Add(function()
        Client.FireEvent("이혼거절",nm)
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

Client.GetTopic("이혼닫기").Add(function()
	Marry_msk.Destroy()
end)


--[[--]]
--[[--]]
--[[--]]
--[[--]]

--패밀리제도
function Make_family()
    if Family_msk then
        Family_msk.Destroy()
    end
    Family_msk = Panel(Rect(0,0,cw,ch))
    Family_pnl = Image("Pictures/가족신청.png",Rect(cw/2-200,ch/2-125,400,250))
    Family_input_name = InputField(Rect(125,110,150,30))
    Family_input_name.placeholder = "패밀리명을 입력해주세요."
    Family_input_tarket = InputField(Rect(125,150,150,30))
    Family_input_tarket.placeholder = "자녀명을 입력해주세요."
    Family_btn1 = Button("가족신청",Rect(200-65,200,60,50))
    Family_btn1.textSize = 15
	Family_btn1.SetOpacity(0)
    Family_btn1.onClick.Add(function()
        if Family_input_name.text == "" then
            Client.ShowAlert("패밀리 명을 입력하세요.")
        elseif Family_input_tarket.text == "" then
            Client.ShowAlert("자녀 이름을 입력하세요.")
        else
            Client.FireEvent("가족신청", Family_input_name.text,Family_input_tarket.text)
			Family_msk.Destroy()
        end
    end)
	Family_btn2 = Button("취소",Rect(200+5,200,60,50))
	Family_btn2.textSize = 15
	Family_btn2.SetOpacity(0)
    Family_btn2.onClick.Add(function()
		Family_msk.Destroy()
	end)
    Family_msk.showOnTop = true
    Family_msk.AddChild(Family_pnl)
    Family_pnl.AddChild(Family_input_name)
    Family_pnl.AddChild(Family_input_tarket)
    Family_pnl.AddChild(Family_btn1)
	Family_pnl.AddChild(Family_btn2)
end

Client.GetTopic("가족").Add(Make_family)

Client.GetTopic("가족신청대기").Add(function(myName,family_name,find_couple)
    if FamilyW_msk then
        FamilyW_msk.Destroy()
    end
    FamilyW_msk = Panel(Rect(0,0,cw,ch))
    FamilyW_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-150,ch/2-100,300,180))
    FamilyW_txt = Text(myName.."님께서 당신을 가족명["..family_name.."] 가족으로 \n 입양을 원합니다. 수락하시겠습니까?",Rect(0,0,300,150))
    FamilyW_txt.textAlign = 4
    FamilyW_btn1 = Button("수락",Rect(85,150,60,30))
    FamilyW_btn1.onClick.Add(function()
        Client.FireEvent("가족수락", myName,family_name,find_couple)
        FamilyW_msk.Destroy()
    end)
    FamilyW_btn2 = Button("거절",Rect(155,150,60,30))
    FamilyW_btn2.onClick.Add(function()
        Client.FireEvent("가족거절",find_couple,myName)
        FamilyW_msk.Destroy()
    end)
	FamilyW_btn1.SetOpacity(0)
	FamilyW_btn2.SetOpacity(0)

    FamilyW_msk.showOnTop = true
    FamilyW_msk.AddChild(FamilyW_pnl)
    FamilyW_pnl.AddChild(FamilyW_txt)
    FamilyW_pnl.AddChild(FamilyW_btn1)
    FamilyW_pnl.AddChild(FamilyW_btn2)
end)



--자녀추가
Client.GetTopic("가족추가실행").Add(start)

function start()
    Client.FireEvent("내가족명")
end

Client.GetTopic("가족추가").Add(function(family_name)
    if family_name == nil then
        return
    end
    if FamilyN_msk then
        FamilyN_msk.Destroy()
    end

    FamilyN_msk = Panel(Rect(0,0,cw,ch))
    FamilyN_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-200,ch/2-125,400,250))
    FamilyN_txt = Text(family_name.."의 가족이될 유저 닉네임을 입력해주세요.",Rect(0,0,400,150))
    FamilyN_txt.textAlign = 4
    FamilyN_input = InputField(Rect(125,150-45,150,30))
    FamilyN_input.placeholder = '닉네임을 입력해주세요.'
    FamilyN_btn1 = Button("가족신청",Rect(200-65,200,60,50))
    FamilyN_btn1.textSize = 15
	FamilyN_btn1.SetOpacity(0)
    FamilyN_btn1.onClick.Add(function()
        if FamilyN_input.text == "" then
            Client.ShowAlert("자녀명을 입력하세요.")
        else
            Client.FireEvent("가족추가신청", FamilyN_input.text,family_name)
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
end)

Client.GetTopic("자녀입양대기").Add(function(myName,family_name,find_couple,child1,newChild,child2)
    if FamilyW_msk then
        FamilyW_msk.Destroy()
    end
    FamilyW_msk = Panel(Rect(0,0,cw,ch))
    FamilyW_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-150,ch/2-100,300,180))
    FamilyW_txt = Text(myName.."님께서 당신을 가족명["..family_name.."] 가족으로 \n 입양을 원합니다. 수락하시겠습니까?",Rect(0,0,300,150))
    FamilyW_txt.textAlign = 4
    FamilyW_btn1 = Button("수락",Rect(85,150,60,30))
    FamilyW_btn1.onClick.Add(function()
        Client.FireEvent("입양수락", myName,family_name,find_couple,child1,child2)
        FamilyW_msk.Destroy()
    end)
    FamilyW_btn2 = Button("거절",Rect(155,150,60,30))
    FamilyW_btn2.onClick.Add(function()
        Client.FireEvent("가족거절",find_couple,myName)
        FamilyW_msk.Destroy()
    end)
	FamilyW_btn1.SetOpacity(0)
	FamilyW_btn2.SetOpacity(0)

    FamilyW_msk.showOnTop = true
    FamilyW_msk.AddChild(FamilyW_pnl)
    FamilyW_pnl.AddChild(FamilyW_txt)
    FamilyW_pnl.AddChild(FamilyW_btn1)
    FamilyW_pnl.AddChild(FamilyW_btn2)
end)


Client.GetTopic("가족신청닫기").Add(function()
	Marry_msk.Destroy()
end)


--자식 파양

Client.GetTopic("자녀파양실행").Add(startRemoveChild)

function startRemoveChild()
    Client.FireEvent("내가족명1")
end

Client.GetTopic("자식파양").Add(function(family_name)
    if family_name == nil then
        return
    end
    if FamilyN_msk then
        FamilyN_msk.Destroy()
    end

    FamilyN_msk = Panel(Rect(0,0,cw,ch))
    FamilyN_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-200,ch/2-125,400,250))
    FamilyN_txt = Text(family_name.."가족에서 파양할 자식 유저 닉네임을 입력해주세요.",Rect(0,0,400,150))
    FamilyN_txt.textAlign = 4
    FamilyN_input = InputField(Rect(125,150-45,150,30))
    FamilyN_input.placeholder = '닉네임을 입력해주세요.'
    FamilyN_btn1 = Button("파양신청",Rect(200-65,200,60,50))
    FamilyN_btn1.textSize = 15
	FamilyN_btn1.SetOpacity(0)
    FamilyN_btn1.onClick.Add(function()
        if FamilyN_input.text == "" then
            Client.ShowAlert("자녀명을 입력하세요.")
        else
            Client.FireEvent("자녀파양", FamilyN_input.text,family_name)
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
end)

Client.GetTopic("자식파양대기").Add(function(applyPerson,familyName,targetNum)
    if MarryW_msk then
        MarryW_msk.Destroy()
    end
    MarryW_msk = Panel(Rect(0,0,cw,ch))
    MarryW_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-150,ch/2-100,300,180))
    MarryW_txt = Text(applyPerson.."님이 당신을 ["..familyName.."]에서 파양을 신청하였습니다.",Rect(0,0,300,150))
    MarryW_txt.textAlign = 4
    MarryW_btn1 = Button("수락",Rect(85,150,60,30))
    MarryW_btn1.onClick.Add(function()
        Client.FireEvent("파양수락", targetNum,familyName)
        MarryW_msk.Destroy()
    end)
    MarryW_btn2 = Button("거절",Rect(155,150,60,30))
    MarryW_btn2.onClick.Add(function()
        Client.FireEvent("파양거절")
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


function startRemoveMerryData()
    Client.FireEvent("결혼정보")
end

Client.GetTopic("강제이혼").Add(function(partner)
    if MarryW_msk then
        MarryW_msk.Destroy()
    end
    MarryW_msk = Panel(Rect(0,0,cw,ch))
    MarryW_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-150,ch/2-100,300,180))
    MarryW_txt = Text(partner.."님과 강제이혼 하시겠습니까?\n 되돌릴수 없습니다. 신중하게 선택하세요",Rect(0,0,300,150))
    MarryW_txt.textAlign = 4
    MarryW_btn1 = Button("신청",Rect(85,150,60,30))
    MarryW_btn1.onClick.Add(function()
        Client.FireEvent("강제이혼진행",partner)
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


function removeFamilyData()
    if MarryW_msk then
        MarryW_msk.Destroy()
    end
    MarryW_msk = Panel(Rect(0,0,cw,ch))
    MarryW_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-150,ch/2-100,300,180))
    MarryW_txt = Text("가족정보를 모두 삭제하시겠습니까?\n 되돌릴수 없습니다. 신중하게 선택하세요",Rect(0,0,300,150))
    MarryW_txt.textAlign = 4
    MarryW_btn1 = Button("신청",Rect(85,150,60,30))
    MarryW_btn1.onClick.Add(function()
        Client.FireEvent("강제가족정보삭제진행")
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
end


function startRemoveFamilyData()
    Client.FireEvent("가족정보")
end

Client.GetTopic("가족해산").Add(function(family)
    if MarryW_msk then
        MarryW_msk.Destroy()
    end
    MarryW_msk = Panel(Rect(0,0,cw,ch))
    MarryW_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-150,ch/2-100,300,180))
    MarryW_txt = Text(family.."의 가족을 해산하시겠습니까? \n 되돌릴수 없습니다. 신중하게 선택하세요",Rect(0,0,300,150))
    MarryW_txt.textAlign = 4
    MarryW_btn1 = Button("신청",Rect(85,150,60,30))
    MarryW_btn1.onClick.Add(function()
        Client.FireEvent("가족해산진행",family)
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