--[[
	제작 : 수니몬
	게임에 지장이 없는 선에서 마음대로 사용하시고 마음껏 수정하세요.
]]
--========================================================================================================================================================================================
--여기서부터는 수정이 필요한 부분
local but_name = {'염료', '일반염색', '캐쉬염색', '특템염색', '기능추가', '정제', '상점'}
local choice_menu = {
[but_name[1]]	= {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714}, --염색약 dataID를 대입하세요.
[but_name[2]]	= {450, 451, 452, 453, 454, 455, 459, 460, 461, 462, 463, 464}, --일반옷 dataID를 대입하세요.
[but_name[3]]	= {456, 457, 465, 466}, --캐쉬옷 dataID를 대입하세요.
[but_name[4]]	= {69}, --특템 dataID를 대입하세요.
[but_name[5]]	= {}, --기능 dataID를 대입하세요.
[but_name[6]]   = {719, 720, 721, 723, 724, 725, 727, 728, 729}, --정제
[but_name[7]]   = {716, 717}} --상점
local Delicate = {
['701'] = {114}, --빨강
['702'] = {705, 709}, --분홍
['703'] = {701, 705}, --주황
['704'] = {701, 703}, --갈색
['705'] = {115}, --노랑
['706'] = {708, 705}, --초록
['707'] = {708, 706}, --하늘
['708'] = {116}, --파랑
['709'] = {701, 708}, --보라
['710'] = {701, 705, 708}, --검정
['714'] = {710}, --하얀
['450'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 716, 323},
['451'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 711, 712, 713, 717, 323},
['452'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 716, 321},
['453'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 711, 712, 713, 717, 321},
['454'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 716, 322},
['455'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 711, 712, 713, 717, 322},
['459'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 716, 333},
['460'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 711, 712, 713, 717, 333},
['461'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 716, 331},
['462'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 711, 712, 713, 717, 331},
['463'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 716, 332},
['464'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 711, 712, 713, 717, 332},
['456'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 711, 712, 713, 717, 325},
['457'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 711, 712, 713, 717, 324},
['465'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 711, 712, 713, 717, 335},
['466'] = {701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 711, 712, 713, 717, 334},
['719'] = {144}, --석분
['720'] = {142}, --철괴
['721'] = {143}, --금괴
['723'] = {113}, --씨앗유
['724'] = {112}, --말린버섯
['725'] = {111}, --열매즙
['727'] = {146}, --실
['728'] = {148}, --솜
['729'] = {147}, --실크
['716'] = {79},
['717'] = {79},
['69'] = {48, 701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 714, 711, 712, 713, 717},
}
local Delicate_count = {
['701'] = {1}, --빨강
['702'] = {1, 1}, --분홍
['703'] = {1, 1}, --주황
['704'] = {1, 1}, --갈색
['705'] = {1}, --노랑
['706'] = {1, 1}, --초록
['707'] = {1, 1}, --하늘
['708'] = {1}, --파랑
['709'] = {1, 1}, --보라
['710'] = {1, 1, 1}, --검정
['714'] = {1}, --하얀
['450'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['451'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['452'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['453'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['454'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['455'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['459'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['460'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['461'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['462'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['463'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['464'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['456'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['457'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['465'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['466'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
['719'] = {1}, --석분
['720'] = {1}, --철괴
['721'] = {1}, --금괴
['723'] = {1}, --씨앗유
['724'] = {1}, --말린버섯
['725'] = {1}, --열매즙
['727'] = {1}, --실
['728'] = {1}, --솜
['729'] = {1}, --실크
['716'] = {300},
['717'] = {700},
['69'] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

}
--Delicate 와 Delicate_count 의 짝이 꼭 맞아야함.
--제작 시 필요한 아이템 종류는 약 30종까지 가능함.
--아래부터는 수정할 필요가 없습니다.
--========================================================================================================================================================================================
Client.RunLater(function()
	Client.FireEvent('Love', Utility.JSONSerialize(but_name), Utility.JSONSerialize(choice_menu), Utility.JSONSerialize(Delicate), Utility.JSONSerialize(Delicate_count))
end, 0.5)
function make_Window()
	if Make_Panel then return end
	local cw = Client.width
	local ch = Client.height
	local Garo = 650
	local Sero = 380
	local blue = Color(160, 220, 235, 255)
	local n_blue = Color(160, 220, 235, 140)
	local Rev_blue = Color(95, 35, 20, 255)
	
	Make_Panel = ScrollPanel(Rect(cw/2-Garo/2, ch/2-Sero/2, Garo, Sero))
	Make_Panel.content = Make_Panel
	Make_Panel.color = Color(0, 0, 0, 255)
	Make_Panel.showOnTop = true
	
	local Make_Panel2 = Panel(Rect(1, 1, Make_Panel.width-2, Make_Panel.height-2))
	Make_Panel2.color = Color(66, 66, 66, 255)
	Make_Panel.AddChild(Make_Panel2)
	
	local CloseButton = Button('✖', Rect(Garo-42, 0, 42, 42))
	CloseButton.textSize = 26
	CloseButton.textAlign = 4
	CloseButton.color = Color(87, 87, 87, 255)
	Make_Panel2.AddChild(CloseButton)
	CloseButton.onClick.Add(function()
		Make_Panel.Destroy()
		Make_Panel = nil
		if g_op and g_op[1][g_opge] then
			g_op[1][g_opge].Destroy()
		end
	end)
	
	local Make_but = {}
	for i=1, 1 do
		Make_but[i] = Button((i==1 and '세탁소') or (i==2 and '분해'), Rect(5+85*(i-1), 5, 80, 42))
		Make_but[i].color = Color(89, 89, 89, 255)
		Make_but[i].textSize = 22
		Make_but[i].textAlign = 4
		Make_Panel2.AddChild(Make_but[i])
	end
	Make_but[1].color = blue
	local main_panel = Panel(Rect(90, 65, 553, 268))
	main_panel.color = Color(0, 48, 8, 255)
	Make_Panel2.AddChild(main_panel)
	local inP = Panel(Rect(main_panel.width-258, 5, 253, 258))
	inP.color = Color(44, 44, 44, 255)
	main_panel.AddChild(inP)
	local inL = Panel(Rect(0, 0, 285, inP.height))
	inL.color = Color(44, 44, 44, 255)
	local scroll_panel = ScrollPanel()
	scroll_panel.rect = Rect(5, 5, 285, 258)
	scroll_panel.horizontal = false
	scroll_panel.showVerticalScrollbar = false
	scroll_panel.content = inL
	main_panel.AddChild(scroll_panel)
	
	local Choice_Panel = Panel(Rect(5, 65, 80, 308))
	Choice_Panel.color = Color(77, 77, 77, 255)
	Make_Panel2.AddChild(Choice_Panel)
	
	local hi_size = 50
	local hp = Panel(Rect(inP.width/2-hi_size/2, inP.height-hi_size/1.2, hi_size, hi_size/1.5))
	hp.color = Color(0, 0, 0, 255)
	local hi = Button('제 작', Rect(1, 1, hp.width-2, hp.height-2))
	hp.AddChild(hi)
	hi.textSize = 16
	hi.color = Color(153, 153, 103, 255)
	inP.AddChild(hp)
	hp.visible = false
	
	local Choice_but = {}
	local happy_but = {}
	local happy_panel = {}
	local icon_panel = {}
	local happy_image = {}
	local happy_text = {}
	local oyo = {}
	local D_pal = {}
	local D_icon = {}
	local D_count = {}
	local dumy = {}
	local dumy2 = {}
	local bagic = Color(77, 77, 77, 255)
	local bagic2 = Color(111, 111, 111, 255)
	for i=1, #but_name do
		Choice_but[i] = Button(but_name[i], Rect(5, 5+37*(i-1), 70, 32))
		Choice_but[i].color = bagic2
		Choice_but[i].textSize = 16
		Choice_but[i].textAlign = 4
		Choice_Panel.AddChild(Choice_but[i])
		Choice_but[i].onClick.Add(function()
			if g_op and g_op[1][g_opge] then
				g_op[1][g_opge].Destroy()
			end
			for j, q in pairs(D_pal) do
				q.Destroy()
			end
			hp.visible = false
			inL.height = 5+#choice_menu[but_name[i]]*45
			if Choice_but[i].color.r == blue.r then
				return --같은 버튼을 눌렀을 때 쓸데없는 부하 방지
			end
			for j, q in pairs(Choice_but) do
				Choice_but[j].color = bagic2
				Choice_but[j].text = but_name[j]
			end
			for k, n in pairs(happy_but) do
				n.Destroy()
			end
			Choice_but[i].color = blue
			Choice_but[i].text = '<color=#5F2314>'..Choice_but[i].text..'</color>'
			for j, b in pairs(choice_menu[but_name[i]]) do
				local B = tostring(b)
				happy_but[j] = Button('', Rect(5, 5+45*(j-1), inL.width-10, 40))
				happy_but[j].color = Color(0, 0, 0, 0)
				happy_panel[j] = Panel(Rect(0, 0, happy_but[j].width, happy_but[j].height))
				happy_panel[j].color = bagic
				happy_but[j].AddChild(happy_panel[j])
				inL.AddChild(happy_but[j])
				icon_panel[j] = Panel(Rect(1, 1, happy_panel[j].height-2, happy_panel[j].height-2))
				icon_panel[j].color = Color(55, 55, 55, 255)
				happy_panel[j].AddChild(icon_panel[j])
				happy_image[j] = Image('', Rect(0, 0, icon_panel[j].width, icon_panel[j].height))
				happy_image[j].SetImageID(Client.GetItem(b).imageID)
				icon_panel[j].AddChild(happy_image[j])
				happy_text[j] = Text(Client.GetItem(b).name, Rect(icon_panel[j].width+7, 0, happy_panel[j].width-icon_panel[j].width-10, happy_panel[j].height))
				happy_text[j].textSize = 16
				happy_text[j].textAlign = 3
				happy_panel[j].AddChild(happy_text[j])
				oyo[j] = Button('✎', Rect(happy_panel[j].width-happy_panel[j].height, 0, happy_panel[j].height, happy_panel[j].height))
				oyo[j].color = icon_panel[j].color
				oyo[j].textSize = 22
				happy_panel[j].AddChild(oyo[j])
				happy_but[j].onClick.Add(function()
					if happy_panel[j].color.r == n_blue.r then
						return --같은 버튼을 눌렀을 때 쓸데없는 부하 방지
					end
					hp.visible = true
					for c, m in pairs(happy_panel) do
						m.color = bagic
					end
					happy_panel[j].color = n_blue
					for z, x in pairs(D_pal) do
						x.Destroy()
					end
					if Delicate[B] == nil then return end
					
					for l, n in pairs(Delicate[B]) do
						D_pal[l] = Button('', Rect(5+41*(((l%6==0 and 6) or l%6)-1), 5+41*math.ceil(l/6-1), 37, 37))
						D_pal[l].color = Color(22, 22, 22, 255)
						inP.AddChild(D_pal[l])
						D_icon[l] = Image('', Rect(0, 0, D_pal[l].width, D_pal[l].height))
						D_icon[l].SetImageID(Client.GetItem(n).imageID)
						D_pal[l].AddChild(D_icon[l])
						D_count[l] = Text('', Rect(0, 0, D_icon[l].width, D_icon[l].height))
						D_count[l].text = (Delicate_count[B][l] == nil and '<color=#FE2E2E>잘못됨</color>') or Delicate_count[B][l]
						D_count[l].textSize = 11
						D_count[l].textAlign = 8
						D_icon[l].AddChild(D_count[l])
						D_pal[l].onClick.Add(function()
							if dumy[l] then return end
							local mouse = Input.mousePosition
							dumy[l] = Panel(Rect(mouse.x, mouse.y, 120, 25))
							dumy[l].color = Color(22, 22, 22, 180)
							dumy[l].showOnTop = true
							dumy2[l] = Text(Client.GetItem(n).name, Rect(5, 0, dumy[l].width-5, dumy[l].height))
							dumy[l].AddChild(dumy2[l])
							Client.RunLater(function()
								dumy[l].Destroy()
								dumy[l] = nil
							end, 1.5)
						end)
					end
				end)
				g_op, g_opge = {{}, {}, {}}, 0
				oyo[j].onClick.Add(function()
					if g_op[1][g_opge] then
						g_op[1][g_opge].Destroy()
					end
					g_opge = j
					g_op[1][j] = Button('', Rect(300, 50, 235, 400))
					g_op[1][j].color = Color(0, 0, 0, 0)
					g_op[1][j].SetOrderIndex(happy_panel[j].GetOrderIndex()+1)
					g_op[1][j].showOnTop = true
					g_op[2][j] = Panel(Rect(0, 0, g_op[1][j].width, g_op[1][j].height))
					g_op[2][j].color = Color(0, 0, 0, 200)
					g_op[3][j] = Text('', Rect(10, 20, g_op[1][j].width-10, g_op[1][j].height-20))
					g_op[3][j].textAlign = 0
					g_op[3][j].text = 
					"<size='18'>"..Client.GetItem(b).name.."</size>\n\n"..Client.GetItem(b).desc
					g_op[2][j].AddChild(g_op[3][j])
					g_op[1][j].AddChild(g_op[2][j])
					g_op[1][j].onClick.Add(function()
						g_op[1][j].Destroy()
						g_op[1][j] = nil
					end)
				end)
			end
		end)
	end
	hi.onClick.Add(function()
		if oq then --쓸데없는 부하 방지
			return 
		end
		local ABC = {0, 0}
		for j, b in pairs(Choice_but) do
			if b.color.r == blue.r then
				ABC[1] = j
				break
			end
		end
		for i, v in pairs(happy_panel) do
			if v.color.r == n_blue.r then
				ABC[2] = i
				break
			end
		end
		Client.FireEvent('Love2', ABC[1], ABC[2])
	end)
	
	Client.GetTopic('Love3').Add(function(Table, Table2, txt)
		if oq then 
			--oq[1].x = 280
			--oq[1].y = 80
			return 
		end
		local T = Utility.JSONParse(Table)
		local T2 = Utility.JSONParse(Table2)
		oq = {[5] = {}, [6] = {}, [7] = {}, [8] = {}}
		oq[1] = Panel(Rect(280, 80, 250, 350))
		--oq[1].content = oq[1]
		oq[1].color = Color(0, 0, 0, 255)
		oq[1].showOnTop = true
		oq[2] = ScrollPanel(Rect(1, 1, oq[1].width-2, oq[1].height-2))
		oq[2].color = Color(54, 54, 54, 255)
		oq[1].AddChild(oq[2])
		oq[4] = Panel(Rect(1, 1, oq[1].width-2, oq[1].height-2))
		oq[4].color = Color(78, 78, 78, 255)
		oq[2].AddChild(oq[4])
		oq[2].horizontal = false
		oq[2].showVerticalScrollbar = false
		oq[2].content = oq[4]
		oq[3] = Button('✖', Rect(oq[2].width-24, 0, 24, 24))
		oq[3].textSize = 17
		oq[3].textAlign = 4
		oq[3].color = Color(43, 43, 43, 255)
		oq[2].AddChild(oq[3])
		oq[3].onClick.Add(function()
			oq[1].Destroy()
			oq = nil
		end)
		if #T > 14 then
			oq[4].height = oq[4].height+(#T-14)*20+5
		end
		for i, v in pairs(T) do
			oq[5][i] = Panel(Rect(5+120*(((i%2==0 and 2) or i%2)-1), 25+40*math.ceil(i/2-1), 32, 32))
			oq[5][i].color = Color(55, 55, 55, 255)
			oq[4].AddChild(oq[5][i])
			oq[6][i] = Image('', Rect(0, 0, oq[5][i].width, oq[5][i].height))
			oq[6][i].SetImageID(Client.GetItem(T2[i]).imageID)
			oq[5][i].AddChild(oq[6][i])
			oq[7][i] = Panel(Rect(oq[5][i].x+oq[5][i].width+2, oq[5][i].y, 83, 32))
			oq[7][i].color = Color(55, 55, 55, 255)
			oq[4].AddChild(oq[7][i])
			oq[8][i] = Text('', Rect(3, 1, oq[7][i].width-6, oq[7][i].height-2))
			oq[8][i].textSize = 10
			oq[7][i].AddChild(oq[8][i])
			if v >= Delicate_count[txt][i] then
				v = '<color=#58FAF4>'..v..'</color>'
			else
				v = '<color=#F78181>'..v..'</color>'
			end
			oq[8][i].text = Client.GetItem(T2[i]).name.."\n<size='12'>"..v..' / '..Delicate_count[txt][i]..'</size>'
		end
		oq[10] = Panel(Rect(oq[4].width/2-24, oq[4].height-30, 38, 27))
		oq[10].color = Color(0, 0, 0, 255)
		oq[9] = Button('제 작', Rect(1, 1, 36, 25))
		oq[10].AddChild(oq[9])
		oq[4].AddChild(oq[10])
		oq[9].textSize = 14
		oq[9].color = Color(153, 153, 103, 255)
		
		oq[9].onClick.Add(function()
			Client.FireEvent('Love4', txt)
			oq[1].Destroy()
			oq = nil
		end)
	end)
end