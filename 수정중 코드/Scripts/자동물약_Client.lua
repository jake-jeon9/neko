--[[
	제작 : 사랑요
	마음대로 사용하시고 마음껏 수정 가능하지만
	수정 후에 발생하는 버그에 대해서는 사용자에게 책임이 있습니다.
	저작권 표시 x
	
	☑ 사용법
	서버에서 사용하려면 
	unit.FireEvent('자동물약', unit.GetStringVar(개인스트링변수번호)) 를 입력해주세요.
	
	클라에서 사용하려면 
	Client.FireEvent('자물') 을 입력해주세요.
	
	
	서버.lua에서도 개인스트링변수 한개 바꿔주세요
]]

local Potion = {}
--꼭 바꾸어주어야 하는 부분
Potion.potion_HP = {45, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 621, 622, 623, 624, 625, 626, 627, 628} --체력물약 dataID 대입
Potion.potion_MP = {45} --마나물약 dataID 대입

--바꿔도 되고 안바꿔도 되는 부분
Potion.name_HP = '체력' --체력 이름
Potion.name_MP = '마나' --마나 이름
Potion.color_HP = Color(204, 51, 51) --체력바 색
Potion.color_MP = Color(0, 51, 255) --마나바 색
Potion.su = {5, 95} --체력과 마나가 5% 이상, 95% 이하로 한계수치 설정
Potion.only_HP = false --true일 때 체력만 나타남, false일 때 체력 마나 둘다 사용가능

--=============아래는 건들필요없음=============

Potion.coolTime_HP = {}
Potion.coolTime_MP = {}
Potion.mode = false

function Potion:Show()
	local p = self
	local T = Potion.T
	
	if p.Panel then return end
	local cw, ch = Client.width, Client.height
	local Garo, Sero = 256, p.only_HP and 77 or 120
	
	p.Panel = Panel(Rect(cw/2-Garo/2, ch/2-Sero/2, Garo, Sero))
	p.Panel.color = Color(0, 0, 0, 170)
	
	p.Panel2 = Panel(Rect(1, 1, Garo-2, Sero-2))
	p.Panel2.color = Color(111, 111, 111, 100)
	p.Panel.AddChild(p.Panel2)
	
	p.Panel3 = Panel(Rect(0, 0, Garo-2, 24))
	p.Panel3.color = Color(178, 178, 178)
	p.Panel2.AddChild(p.Panel3)
	
	p.main_text = Text(' <color=#00004F>자동물약 설정</color>', Rect(0, 0, p.Panel3.width, p.Panel3.height))
	p.main_text.textSize = 14
	p.Panel3.AddChild(p.main_text)
	
	p.close_but = Button('✖', Rect(Garo-25, 0, 24, 24))
	p.close_but.textSize = 16
	p.close_but.color = Color(78,78,78)
	p.Panel3.AddChild(p.close_but)
	
	p.close_but.onClick.Add(function()
		p.Panel.Destroy()
		p.Panel = nil
	end)
	
	local transparent = Color(0, 0, 0, 0)
	local pw_len = p.Panel2.width
	p.Panel4 = Panel(Rect(0, 24, pw_len, p.Panel2.height-24))
	p.Panel4.color = transparent
	p.Panel2.AddChild(p.Panel4)
	
	--============================
	
	local ph_len = p.only_HP and p.Panel4.height or p.Panel4.height/2
	p.top_pal = Panel(Rect(0, 0, pw_len, ph_len))
	p.top_pal.color = transparent
	p.Panel4.AddChild(p.top_pal)
	
	p.Text1 = Text('  '..Potion.name_HP, Rect(0, 0, pw_len, ph_len))
	p.Text1.textSize = 13
	p.Text1.textAlign = 3
	p.top_pal.AddChild(p.Text1)
	
	p.top_imgbut = Button('', Rect(39, ph_len/5, 32, 32))
	p.top_imgbut.color = Color(255, 255, 255, 130)
	p.top_pal.AddChild(p.top_imgbut)
	p.top_img = Image('', Rect(0, 0, 32, 32))
	p.top_img.SetImageID(Client.GetItem(p.potion_HP[T[5]]).imageID)
	p.top_imgbut.AddChild(p.top_img)
	
	p.top_but = Button('', Rect(76, ph_len/4, 100, ph_len/2))
	p.top_but.color = Color(155, 155, 155)
	p.top_pal.AddChild(p.top_but)
	
	p.top_gauge = Panel(Rect(0, 0, T[3], p.top_but.height))
	p.top_gauge.color = p.color_HP
	p.top_but.AddChild(p.top_gauge)
	
	p.top_persent = Text(T[3]..'%', Rect(180, 0, 40, ph_len))
	p.top_persent.textAlign = 3
	p.top_pal.AddChild(p.top_persent)
	
	p.top_but1 = Button('', Rect(222, ph_len/4, 22, 22))
	p.top_but1.color = transparent
	p.top_pal.AddChild(p.top_but1)
	
	p.top_pal1 = Panel(Rect(0, 0, 22, 22))
	p.top_pal1.color = Color(24, 24, 24)
	p.top_but1.AddChild(p.top_pal1)
	
	p.top_pal2 = Panel(Rect(3, 3, 16, 16))
	p.top_pal2.color = Color(178, 178, 178)
	p.top_pal1.AddChild(p.top_pal2)
	
	p.top_txt1 = Text(T[1] and '<color=#000000>✓</color>' or '', Rect(0, 0, 22, 22))--✔
	p.top_txt1.textSize = 15
	p.top_txt1.textAlign = 4
	p.top_but1.AddChild(p.top_txt1)
	
	p.top_imgbut.onClick.Add(function()
		p.top_imgbut.enabled = false
		if T[5]==#Potion.potion_HP then
			T[5] = 1
		else
			T[5] = T[5]+1
		end
		Client.RunLater(function()
			p.top_imgbut.enabled = true
		end, 0.5)
		Client.FireEvent('자동물약체력선택', T[5])
		p.top_img.SetImageID(Client.GetItem(p.potion_HP[T[5]]).imageID)
	end)
	
	p.top_but1.onClick.Add(function()
		p.top_but1.enabled = false
		Client.RunLater(function()
			p.top_but1.enabled = true
		end, 0.5)
		if T[1] then
			p.top_txt1.text = ''
		else
			p.top_txt1.text = '<color=#000000>✓</color>'
		end
		T[1] = not T[1]
		Client.FireEvent('자동물약체력', T[1])
	end)
	
	p.top_but.onClick.Add(function()
		local mouse = Input.mousePositionToScreen
		local Width = cw/2-Garo/2+1+p.top_but.x
		local su = math.floor(mouse.x-Width)
		if not (su>=p.su[1] and su<=p.su[2]) then
			Client.ShowAlert(p.su[1]..'% 이상, '..p.su[2]..'% 이하로 수치 설정이 가능합니다.')
			return
		end
		T[3] = su

		p.top_but.enabled = false
		Client.RunLater(function()
			p.top_but.enabled = true
		end, 0.5)
		p.top_gauge.width = su
		p.top_persent.text = su..'%'
		Client.FireEvent('자동물약체력퍼센트', su)
	end)
	
	--[[=========================]]
	--[[=========================]]
	--[[=========================]]
	--[[=========================]]
	--[[=========================]]
	--[[=========================]]
	--[[=========================]]
	--[[=========================]]
	--[[=========================]]
	--[[=========================]]
	
	if not p.only_HP then
		p.bot_pal = Panel(Rect(0, ph_len, pw_len, ph_len))
		p.bot_pal.color = transparent
		p.Panel4.AddChild(p.bot_pal)
		
		p.Text2 = Text('  '..Potion.name_MP, Rect(0, 0, pw_len, ph_len))
		p.Text2.textSize = 13
		p.Text2.textAlign = 3
		p.bot_pal.AddChild(p.Text2)
		
		p.bot_imgbut = Button('', Rect(39, ph_len/5, 32, 32))
		p.bot_imgbut.color = Color(255, 255, 255, 130)
		p.bot_pal.AddChild(p.bot_imgbut)
		p.bot_img = Image('', Rect(0, 0, 32, 32))
		p.bot_img.SetImageID(Client.GetItem(p.potion_MP[T[6]]).imageID)
		p.bot_imgbut.AddChild(p.bot_img)
		
		p.bot_but = Button('', Rect(76, ph_len/4, 100, ph_len/2))
		p.bot_but.color = Color(155, 155, 155)
		p.bot_pal.AddChild(p.bot_but)
		
		p.bot_gauge = Panel(Rect(0, 0, T[4], p.bot_but.height))
		p.bot_gauge.color = p.color_MP
		p.bot_but.AddChild(p.bot_gauge)
		
		p.bot_persent = Text(T[4]..'%', Rect(180, 0, 40, ph_len))
		p.bot_persent.textAlign = 3
		p.bot_pal.AddChild(p.bot_persent)
		
		p.bot_but1 = Button('', Rect(222, ph_len/4, 22, 22))
		p.bot_but1.color = transparent
		p.bot_pal.AddChild(p.bot_but1)
		
		p.bot_pal1 = Panel(Rect(0, 0, 22, 22))
		p.bot_pal1.color = Color(24, 24, 24)
		p.bot_but1.AddChild(p.bot_pal1)
		
		p.bot_pal2 = Panel(Rect(3, 3, 16, 16))
		p.bot_pal2.color = Color(178, 178, 178)
		p.bot_pal1.AddChild(p.bot_pal2)
		
		p.bot_txt1 = Text(T[2] and '<color=#000000>✓</color>' or '', Rect(0, 0, 22, 22))
		p.bot_txt1.textSize = 15
		p.bot_txt1.textAlign = 4
		p.bot_but1.AddChild(p.bot_txt1)
		
		p.bot_imgbut.onClick.Add(function()
			p.bot_imgbut.enabled = false
			if T[6]==#Potion.potion_MP then
				T[6] = 1
			else
				T[6] = T[6]+1
			end
			Client.RunLater(function()
				p.bot_imgbut.enabled = true
			end, 0.5)
			Client.FireEvent('자동물약마나선택', T[6])
			p.bot_img.SetImageID(Client.GetItem(p.potion_MP[T[6]]).imageID)
		end)
		
		p.bot_but1.onClick.Add(function()
			p.bot_but1.enabled = false
			Client.RunLater(function()
				p.bot_but1.enabled = true
			end, 0.5)
			if T[2] then
				p.bot_txt1.text = ''
			else
				p.bot_txt1.text = '<color=#000000>✓</color>'
			end
			T[2] = not T[2]
			Client.FireEvent('자동물약마나', T[2])
		end)
		
		p.bot_but.onClick.Add(function()
			local mouse = Input.mousePositionToScreen
			local Width = cw/2-Garo/2+1+p.bot_but.x
			local su = math.floor(mouse.x-Width)
			if not (su>=p.su[1] and su<=p.su[2]) then
				Client.ShowAlert(p.su[1]..'% 이상, '..p.su[2]..'% 이하로 수치 설정이 가능합니다.')
				return
			end
			--local mouse2 = Input.mousePosition

			p.bot_but.enabled = false
			Client.RunLater(function()
				p.bot_but.enabled = true
			end, 0.5)
			p.bot_gauge.width = su
			p.bot_persent.text = su..'%'
			Client.FireEvent('자동물약마나퍼센트', su)
		end)
	end
end

Client.GetTopic('자동물약').Add(function(Table)
	if not Table then
		Client.ShowAlert('데이터 로딩이 덜되었으니 잠시 후 다시 시도해 주세요.')
	end
	Potion.T = Utility.JSONParse(Table)
	Potion:Show()
end)

Potion.cnt = 0
function Potion:Tick(t)
	if not (Potion.mode and self.T) then
		return
	end
	
	self.cnt = self.cnt + t
	
	if self.T[1] then
		if self.cnt < self.coolTime_HP[self.T[5]] then
			return
		end
		local me = Client.myPlayerUnit
		local HP = math.floor(me.hp/me.maxHP*100)
		if self.T[3] >= HP and not me.dead then
			self.cnt = 0
			if not me.UseItem(self.potion_HP[self.T[5]]) then
				self.T[1] = false
				Client.FireEvent('자동물약체력', self.T[1])
				if self.Panel then 
					self.top_txt1.text = ''
				end
			end
		end
	end
	
	if self.T[2] and not self.only_HP then
		if self.cnt < self.coolTime_MP[self.T[6]] then
			return
		end
		local me = Client.myPlayerUnit
		local MP = math.floor(me.mp/me.maxMP*100)
		if self.T[4] >= MP and not me.dead then
			self.cnt = 0
			if not me.UseItem(self.potion_MP[self.T[6]]) then
				self.T[2] = false
				Client.FireEvent('자동물약마나', self.T[2])
				if self.Panel then 
					self.bot_txt1.text = ''
				end
			end
		end
	end
end

Client.RunLater(function()
	for i, v in pairs(Potion.potion_HP) do
		Potion.coolTime_HP[i] = Client.GetItem(v).coolTime
	end
	for i, v in pairs(Potion.potion_MP) do
		Potion.coolTime_MP[i] = Client.GetItem(v).coolTime
	end
	Client.FireEvent('자동물약데이터가져와')
end, 0.5)

Client.GetTopic('데이터옜다').Add(function(Table)
	Potion.T = Utility.JSONParse(Table)
	Potion.mode = true
	Client.onTick.Add(function(t) Potion:Tick(t) end)
end)

Client.GetTopic('데이터업데이트').Add(function(Table)
	Potion.T = Utility.JSONParse(Table)
end)