list_shop = {name = {},adIt = {},adCo = {},neIt = {},neCo = {}, panel = {}, text = {}, btn = {},icon = {}}
local mainItem = 79 -- 화폐로 사용할 데이터베이스 ID를 넣어주세요. 예) 데이터베이스의 3번인 보석을 화폐로 하고싶으면 3을 적습니다.
local shopName = "앶이 살롱" -- 상점이름을 정해주세요.
-- 아이템 리스트
list_shop_1 = {name = {},adIt = {},adCo = {},neIt = {},neCo = {}, panel = {}, text = {}, btn = {},icon = {}}
list_shop_1.name[1] = "" 		-- 판매아이템이름 값이 없으면 데이터베이스에 있는 이름을 가져옵니다.
list_shop_1.adIt[1] = 320   		-- 구매 완료시 지급될 아이템 데이터베이스 ID
list_shop_1.adCo[1] = 1   		-- 구매 완료시 지급될 아이템 갯수
list_shop_1.neIt[1] = mainItem  -- 구매에 필요한 아이템(화폐) 데이터베이스 ID
list_shop_1.neCo[1] = 2300 		-- 구매에 필요한 아이템(화폐) 갯수
-- 아이템 추가시  []안에 숫자를 필수로 넣어야하며 숫자에 따라 순서대로 배치됩니다.
-- 한가지 아이템에 총 5가지의 정보를 입력해야 합니다.
-- name[여기에 숫자 필수] = "" 		-- 판매아이템이름 값이 없으면 데이터베이스에 있는 이름을 가져옵니다.
-- adIt[여기에 숫자 필수] = 2   		-- 구매 완료시 지급될 아이템 데이터베이스 ID
-- adCo[여기에 숫자 필수] = 10   		-- 구매 완료시 지급될 아이템 갯수
-- neIt[여기에 숫자 필수] = mainItem  -- 구매에 필요한 아이템(화폐) 데이터베이스 ID
-- neCo[여기에 숫자 필수] = 100 		-- 구매에 필요한 아이템(화폐) 갯수

list_shop_1.name[2] = "" 
list_shop_1.adIt[2] = 330
list_shop_1.adCo[2] = 1
list_shop_1.neIt[2] = mainItem
list_shop_1.neCo[2] = 2300

list_shop_1.name[3] = "" 
list_shop_1.adIt[3] = 324
list_shop_1.adCo[3] = 1
list_shop_1.neIt[3] = mainItem
list_shop_1.neCo[3] = 1500

list_shop_1.name[4] = "" 
list_shop_1.adIt[4] = 325
list_shop_1.adCo[4] = 1
list_shop_1.neIt[4] = mainItem
list_shop_1.neCo[4] = 1500

list_shop_1.name[5] = "" 
list_shop_1.adIt[5] = 334
list_shop_1.adCo[5] = 1
list_shop_1.neIt[5] = mainItem
list_shop_1.neCo[5] = 1500

list_shop_1.name[6] = "" 
list_shop_1.adIt[6] = 335
list_shop_1.adCo[6] = 1
list_shop_1.neIt[6] = mainItem
list_shop_1.neCo[6] = 1500

list_shop_1.name[7] = "" 
list_shop_1.adIt[7] = 271
list_shop_1.adCo[7] = 1
list_shop_1.neIt[7] = mainItem
list_shop_1.neCo[7] = 2300

-------------------------------------------------------
panel_shop = Panel()
panel_shop.rect = Rect(0, 0, Client.width, Client.height)
panel_shop.color = Color(198, 125, 23, 200)
panel_shop.showOnTop = true
panel_shop.visible = false

panel_shop_name = Text(shopName, Rect(20, 10, 250, 30))
panel_shop_name.color = Color(255, 255, 255, 255)
panel_shop_name.textSize = 20

panel_shop_name_count = Text("", Rect(270, 10, 300, 30))
panel_shop_name_count.color = Color(255, 255, 255, 255)
panel_shop_name_count.textSize = 15

panel_shop_exit = Button("X", Rect(Client.width-40, 10,30,30))
panel_shop_exit.color = Color(255, 50, 50, 255)
panel_shop_exit.onClick.Add(function() 
	panel_shop.visible = false
end) 
panel_shop_btn = Panel()
panel_shop_btn.rect = Rect(20, 50, Client.width, 50)
panel_shop_btn.color = Color(0, 0, 0, 0)
panel_shop_btn.showOnTop = true

-- 상점 아이템 리스트
scroll_shop_list = ScrollPanel(Rect(20, 120, 250, Client.height-200))
scroll_shop_list.color = Color(200, 200, 200, 0)
scroll_shop_list.horizontal = false

local board_shop_list

function Item_List(var)
	if board_shop_list ~= nil then
		board_shop_list.Destroy()
	end
	list_shop = list_shop_1

	board_shop_list = Panel(Rect(0, 0, 344, (#list_shop.name*50)+((#list_shop.name-1)*10)))
	for i=1, #list_shop.name do

		list_shop.panel[i] = Panel()
		list_shop.panel[i].rect = Rect(0, ((i-1)*50)+((i-1)*10), 250, 50)

		list_shop.icon[i] = Image("", Rect(0, 0, 50, 50))


		local adIt = list_shop.adIt[i]
		local adCo = list_shop.adCo[i]
		local item1 = list_shop.neIt[i]
		local count1 = list_shop.neCo[i]

		list_shop.btn[i] = Button(" "..list_shop.name[i], Rect(50,0,250,50))
		list_shop.btn[i].color = Color(0, 48, 8, 255)
		list_shop.btn[i].textAlign = 3
		list_shop.btn[i].textSize = 11
		list_shop.btn[i].onClick.Add(function() 

			shop_var_in_upgrade = i
			Client.FireEvent("GET_SHOP_INFO",i,list_shop.adIt[i],list_shop.adCo[i],list_shop.neIt[i],list_shop.neCo[i])
			
		end) 
		list_shop.panel[i].AddChild(list_shop.btn[i])
		list_shop.panel[i].AddChild(list_shop.icon[i])
		board_shop_list.AddChild(list_shop.panel[i])
		Client.FireEvent("GET_ITEM_INFO",i,adIt)
	end

	scroll_shop_list.content = board_shop_list
	scroll_shop_list.AddChild(board_shop_list)

	
	Client.FireEvent("GET_SHOP_INFO",1,list_shop.adIt[1],list_shop.adCo[1],list_shop.neIt[1],list_shop.neCo[1])
	Client.FireEvent("GET_ITEM_COUNT",mainItem)
	shop_var_in_upgrade = 1

	
end

-- 상점 아이템 설명
shop_var_in_upgrade = 0

scroll_shop_panel = ScrollPanel(Rect(300, 120, Client.width - 320, Client.height-200))
scroll_shop_panel.color = Color(200, 200, 200, 0)
scroll_shop_panel.horizontal = false

panel_shop_info = Panel(Rect(0, 0, Client.width - 320, Client.height))
panel_shop_info.color = Color(0, 48, 8, 200)

panel_shop_info_img= Image("", Rect(10, 10, 30, 30))
panel_shop_info_img.visible = false

panel_shop_info_name = Text("", Rect(50, 10, Client.width - 370, 30))
panel_shop_info_name.color = Color(255, 255, 255, 255)
panel_shop_info_name.textSize = 20
panel_shop_info_name.textAlign = 0


panel_shop_info_content_1 = Text("", Rect(10, 40, 300, 60))
panel_shop_info_content_1.color = Color(255, 255, 255, 255)
panel_shop_info_content_1.textSize = 17

panel_shop_info_content_2 = Text("",Rect(10, 120, 300, 500))
panel_shop_info_content_2.color = Color(255, 255, 255, 255)
panel_shop_info_content_2.textSize = 15
panel_shop_info_content_2.textAlign = 0


panel_shop_info_btn = Button("구매", Rect(Client.width - 100, Client.height-60, 80, 40))
panel_shop_info_btn.color = Color(75, 75, 255, 255)
panel_shop_info_btn.textSize = 15
panel_shop_info_btn.onClick.Add(function() 
	if shop_var_in_upgrade ~= 0 then
		if list_shop.adIt[shop_var_in_upgrade] ~= nil then
			local adIt = list_shop.adIt[shop_var_in_upgrade]
			if adIt ~= 1 then
				local adCo = list_shop.adCo[shop_var_in_upgrade]
				local item1 = list_shop.neIt[shop_var_in_upgrade]
				local count1 = list_shop.neCo[shop_var_in_upgrade]
				Client.FireEvent("GET_SHOP_BUY",shop_var_in_upgrade,adIt,adCo,item1,count1)
			end
		end
	end
end)

panel_shop_info.AddChild(panel_shop_info_name)
panel_shop_info.AddChild(panel_shop_info_content_1)
panel_shop_info.AddChild(panel_shop_info_content_2)
panel_shop_info.AddChild(panel_shop_info_img)


scroll_shop_panel.content = panel_shop_info
scroll_shop_panel.AddChild(panel_shop_info)

panel_shop.AddChild(panel_shop_btn)
panel_shop.AddChild(scroll_shop_panel)
panel_shop.AddChild(panel_shop_exit)
panel_shop.AddChild(scroll_shop_list)
panel_shop.AddChild(panel_shop_name)
panel_shop.AddChild(panel_shop_name_count)
panel_shop.AddChild(panel_shop_info_btn)

Client.GetTopic("SET_CLIEN_SHOP_ITEMLIST").Add(function(i,name,image)
	-- 아이템 리스트 세팅
	list_shop.icon[i].SetImageID(image)
	list_shop.btn[i].text = name
	
end)

Client.GetTopic("SET_CLIEN_SHOP_INFO").Add(function(i,name,image,desc,needItem,needCount,adCo,typeStr)
	-- 아이템 정보 세팅
	panel_shop_info_img.SetImageID(image)
	panel_shop_info_name.text = name.." "..adCo.."개"
	panel_shop_info_content_2.text = desc
	if needItem == 1 then
		panel_shop_info_content_1.text = ""
	else
		panel_shop_info_content_1.text = typeStr.."\n"..needItem.." "..needCount.."원"
	end
	panel_shop_info_img.visible = true
	
end)
function Item_Info_Clr()
	panel_shop_info_img.visible = false
	panel_shop_info_name.image = "Icons/Item_0091.png"
	panel_shop_info_content_2.text = ""
	panel_shop_info_content_1.text = ""
end

Client.GetTopic("SET_NEED_ITEM_COUNT").Add(function(name,count)
	panel_shop_name_count.text = "보유 "..name.." "..count.."원"
end)

--기능 처리
Item_List(2)


