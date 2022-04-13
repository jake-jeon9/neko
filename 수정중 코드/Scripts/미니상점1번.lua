function minishop1()
-- ↑ function 오른쪽 전부 스크립트 이름입니다. 네코랜드에서 이벤트만들때 스크립트 들어가서 클라이언트 스크립트 체크하시고 스크립트 이름을 입력하면 이 스크립트가 뜹니다. ()같은거 있으면 ()까지 다 넣어주세요.

--주석이 많이 달려있습니다. 초록색으로 볼수 있도록 반드시 notepad++에서 실행해주세요. 제발 메모장 쓰지마세요

--이 스크립트의 상점번호는 1번입니다. 2번,3번등을 만들기 위해서는 minishop1이라는 단어를 전부 찾아서 숫자를 바꿔주세요. notepad++에는 찾기(S)에서 바꾸기...(R)을 이용해 선택된곳 부터 한번에 바꾸기가 가능합니다.열린파일에서 모두바꾸기는 하지마세요. 진짜 열려있는파일 한번에 바꿔버리니까.

local shop_name = "Sale Shop" -- UI왼쪽위에 뜨는 상점이름입니다. 반드시 따옴표 안에 이름을 입력해주세요.
local portrait =  "Pictures/sale.png" -- 상점주인의 초상화입니다. 따옴표 안에 이미지 경로를 입력해주세요. 조금이라도 틀리면 안됍니다.
local shop_info = "찾는 아이템이 있으려나?" -- 상점주인 한마디입니다. 반드시 따옴표 안에 내용을 입력해주세요.

local goods1 = 1 --상점에서 판매할 1번째 아이템의 데이터 베이스 번호를 입력해주세요.
local goods2 = 2 --상점에서 판매할 2번째 아이템의 데이터 베이스 번호를 입력해주세요.
local goods3 = 47 --상점에서 판매할 3번째 아이템의 데이터 베이스 번호를 입력해주세요.
local goods4 = 130 --상점에서 판매할 4번째 아이템의 데이터 베이스 번호를 입력해주세요.
local goods5 = 21 --상점에서 판매할 5번째 아이템의 데이터 베이스 번호를 입력해주세요.
local goods6 = 81 --상점에서 판매할 6번째 아이템의 데이터 베이스 번호를 입력해주세요.
local goods7 = 34 --상점에서 판매할 7번째 아이템의 데이터 베이스 번호를 입력해주세요.
local goods8 = 45 --상점에서 판매할 8번째 아이템의 데이터 베이스 번호를 입력해주세요.
local goods1_icon = "Icons/muchan.png" --따옴표 안에 상점에서 판매할 1번째 아이템의 이미지 경로를 입력해주세요.
local goods2_icon = "Icons/001.png" --따옴표 안에 상점에서 판매할 2번째 아이템의 이미지 경로를 입력해주세요.
local goods3_icon = "Icons/hahc_btz_car.png" --따옴표 안에 상점에서 판매할 3번째 아이템의 이미지 경로를 입력해주세요.
local goods4_icon = "Icons/11.png" --따옴표 안에 상점에서 판매할 4번째 아이템의 이미지 경로를 입력해주세요.
local goods5_icon = "Icons/E0000151.png" --따옴표 안에 상점에서 판매할 5번째 아이템의 이미지 경로를 입력해주세요.
local goods6_icon = "Icons/방송쿠폰.png" --따옴표 안에 상점에서 판매할 6번째 아이템의 이미지 경로를 입력해주세요.
local goods7_icon = "Icons/10.png" --따옴표 안에 상점에서 판매할 7번째 아이템의 이미지 경로를 입력해주세요.
local goods8_icon = "Icons/hahc_soon.png" --따옴표 안에 상점에서 판매할 8번째 아이템의 이미지 경로를 입력해주세요.

--새로운 이미지를 넣은뒤에는 반드시 리소스 관리자에서 리소스마다 새로고침 해주세요. 안그럼 적용이 안됩니다.

--뒷패널
 minishop1_board = Panel(Rect(-64,0,298,372))
 minishop1_board.pivotX = 0.5
 minishop1_board.pivotY = 0.5
 minishop1_board.anchor = 4
 minishop1_board.color = Color(198,125,23)
 minishop1_board.showOnTop = true

--창 타이틀바
 minishop1_title = Panel(Rect(0,0,274,24))
 minishop1_title.color = Color(198,125,23)
 minishop1_board.AddChild(minishop1_title)
--창 타이틀 텍스트
 minishop1_title_text = Text(shop_name, Rect(4, 0, 270, 24)) 
 minishop1_title_text.textSize = 18
 minishop1_title_text.color = Color(250,250,250)
 minishop1_title.AddChild(minishop1_title_text)

--닫기버튼
 minishop1_exit = Button("x",Rect(274,0 ,24,24))
 minishop1_exit.color = Color(198,125,23,255)
 minishop1_exit.textColor = Color(0,0,0,255)
 minishop1_exit.textAlign = 1
 minishop1_exit.textSize = 18
 minishop1_exit.onClick.Add(function()
		minishop1_board.Destroy()
end)
 minishop1_board.AddChild(minishop1_exit)
 
--상점주인 이미지
 minishop1_keeper = Image(portrait,Rect(4,28,128,128)) 
 minishop1_board.AddChild(minishop1_keeper)
--상점주인 이미지 옆의 사각형
 minishop1_info = Panel(Rect(134,28,160,128))
 minishop1_info.color = Color(0,48,8)
 minishop1_board.AddChild(minishop1_info)
 minishop1_info_text = Text(shop_info, Rect(0, 0, 160, 128))
 minishop1_info_text.textSize = 14
 minishop1_info_text.textAlign = 0
 minishop1_info_text.color = Color(250,250,250,255)
 minishop1_info.AddChild(minishop1_info_text)

--삼품목록 패널
 minishop1_goods_panel = Panel(Rect(0,0,270,800))
 minishop1_goods_panel.color = Color(198,125,23)
--삼품목록 패널 스크롤바
 minishop1_scrollbar = ScrollPanel(Rect(4,158,290,210))
 minishop1_scrollbar.content = minishop1_goods_panel
 minishop1_scrollbar.horizontal = false
 minishop1_scrollbar.vertical = true
 minishop1_scrollbar.showVerticalScrollbar = true
 minishop1_board.AddChild(minishop1_scrollbar)

--1번 상품패널
 minishop1_goods01 = Panel(Rect(0,0,270,64))
 minishop1_goods01.color = Color(0,48,8)
 minishop1_goods01_icon = Image(goods1_icon,Rect(20,5,50,50)) 
 minishop1_goods01.AddChild(minishop1_goods01_icon)
 minishop1_goods_panel.AddChild(minishop1_goods01)
 minishop1_goods01_title = Text(Client.GetItem(goods1).name, Rect(100, 0, 160, 20))
 minishop1_goods01_title.textSize = 16
 minishop1_goods01_title.color = Color(250,250,250)
 minishop1_goods01.AddChild(minishop1_goods01_title)
 minishop1_goods01_BP = Text("구매가격 : " ..Client.GetItem(goods1).buyerPrice, Rect(100, 24, 160, 16))
 minishop1_goods01_BP.textSize = 12
 minishop1_goods01_BP.color = Color(250,250,250)
 minishop1_goods01.AddChild(minishop1_goods01_BP)
 minishop1_goods01_SP = Text("판매가격 : " .. Client.GetItem(goods1).sellerPrice, Rect(100, 40, 160, 16))
 minishop1_goods01_SP.textSize = 12
 minishop1_goods01_SP.color = Color(250,250,250)
 minishop1_goods01.AddChild(minishop1_goods01_SP)
 minishop1_goods01_buy = Button("구입",Rect(220,5,32,24))
  minishop1_goods01_buy.color = Color(198,125,23,255)
  minishop1_goods01_buy.textColor = Color(0,0,0,255)
  minishop1_goods01_buy.textAlign = 4
  minishop1_goods01_buy.textSize = 15
  minishop1_goods01_buy.onClick.Add(function()
		Client.FireEvent('minishop_buy', goods1, Client.GetItem(goods1).buyerPrice)
  end)
 minishop1_goods01_sell = Button("판매",Rect(220,30 ,32,24))
  minishop1_goods01_sell.color = Color(198,125,23,255)
  minishop1_goods01_sell.textColor = Color(0,0,0,255)
  minishop1_goods01_sell.textAlign = 4
  minishop1_goods01_sell.textSize = 15
  minishop1_goods01_sell.onClick.Add(function()
		Client.FireEvent('minishop_sell', goods1, Client.GetItem(goods1).sellerPrice)
  end)
 minishop1_goods01.AddChild(minishop1_goods01_buy)
 minishop1_goods01.AddChild(minishop1_goods01_sell)
 
 --2번 상품패널
 minishop1_goods02 = Panel(Rect(0,66,270,64))
 minishop1_goods02.color = Color(0,48,8)
 minishop1_goods02_icon = Image(goods2_icon,Rect(20,5,50,50)) 
 minishop1_goods02.AddChild(minishop1_goods02_icon)
 minishop1_goods_panel.AddChild(minishop1_goods02)
 minishop1_goods02_title = Text(Client.GetItem(goods2).name, Rect(100, 0, 160, 20))
 minishop1_goods02_title.textSize = 16
 minishop1_goods02_title.color = Color(250,250,250)
 minishop1_goods02.AddChild(minishop1_goods02_title)
 minishop1_goods02_BP = Text("구매가격 : " ..Client.GetItem(goods2).buyerPrice, Rect(100, 24, 160, 16))
 minishop1_goods02_BP.textSize = 12
 minishop1_goods02_BP.color = Color(250,250,250)
 minishop1_goods02.AddChild(minishop1_goods02_BP)
 minishop1_goods02_SP = Text("판매가격 : " .. Client.GetItem(goods2).sellerPrice, Rect(100, 40, 160, 16))
 minishop1_goods02_SP.textSize = 12
 minishop1_goods02_SP.color = Color(250,250,250)
 minishop1_goods02.AddChild(minishop1_goods02_SP)
 minishop1_goods02_buy = Button("구입",Rect(220,5 ,32,24))
  minishop1_goods02_buy.color = Color(198,125,23,255)
  minishop1_goods02_buy.textColor = Color(0,0,0,255)
  minishop1_goods02_buy.textAlign = 4
  minishop1_goods02_buy.textSize = 15
  minishop1_goods02_buy.onClick.Add(function()
		Client.FireEvent('minishop_buy', goods2, Client.GetItem(goods2).buyerPrice)
  end)
 minishop1_goods02_sell = Button("판매",Rect(220,30 ,32,24))
  minishop1_goods02_sell.color = Color(198,125,23,255)
  minishop1_goods02_sell.textColor = Color(0,0,0,255)
  minishop1_goods02_sell.textAlign = 4
  minishop1_goods02_sell.textSize = 15
  minishop1_goods02_sell.onClick.Add(function()
		Client.FireEvent('minishop_sell', goods2, Client.GetItem(goods2).sellerPrice)
  end)
 minishop1_goods02.AddChild(minishop1_goods02_buy)
 minishop1_goods02.AddChild(minishop1_goods02_sell)
 
 --3번 상품패널
 minishop1_goods03 = Panel(Rect(0,132,270,64))
 minishop1_goods03.color = Color(0,48,8)
 minishop1_goods03_icon = Image(goods3_icon,Rect(20,5,50,50)) 
 minishop1_goods03.AddChild(minishop1_goods03_icon)
 minishop1_goods_panel.AddChild(minishop1_goods03)
 minishop1_goods03_title = Text(Client.GetItem(goods3).name, Rect(100, 0, 160, 20))
 minishop1_goods03_title.textSize = 16
 minishop1_goods03_title.color = Color(250,250,250)
 minishop1_goods03.AddChild(minishop1_goods03_title)
 minishop1_goods03_BP = Text("구매가격 : " ..Client.GetItem(goods3).buyerPrice, Rect(100, 24, 160, 16))
 minishop1_goods03_BP.textSize = 12
 minishop1_goods03_BP.color = Color(250,250,250)
 minishop1_goods03.AddChild(minishop1_goods03_BP)
 minishop1_goods03_SP = Text("판매가격 : " .. Client.GetItem(goods3).sellerPrice, Rect(100, 40, 160, 16))
 minishop1_goods03_SP.textSize = 12
 minishop1_goods03_SP.color = Color(250,250,250)
 minishop1_goods03.AddChild(minishop1_goods03_SP)
 minishop1_goods03_buy = Button("구입",Rect(220,5 ,32,24))
  minishop1_goods03_buy.color = Color(198,125,23,255)
  minishop1_goods03_buy.textColor = Color(0,0,0,255)
  minishop1_goods03_buy.textAlign = 4
  minishop1_goods03_buy.textSize = 15
  minishop1_goods03_buy.onClick.Add(function()
		Client.FireEvent('minishop_buy', goods3, Client.GetItem(goods3).buyerPrice)
  end)
 minishop1_goods03_sell = Button("판매",Rect(220,30 ,32,24))
  minishop1_goods03_sell.color = Color(198,125,23,255)
  minishop1_goods03_sell.textColor = Color(0,0,0,255)
  minishop1_goods03_sell.textAlign = 4
  minishop1_goods03_sell.textSize = 15
  minishop1_goods03_sell.onClick.Add(function()
		Client.FireEvent('minishop_sell', goods3, Client.GetItem(goods3).sellerPrice)
  end)
 minishop1_goods03.AddChild(minishop1_goods03_buy)
 minishop1_goods03.AddChild(minishop1_goods03_sell)
 
 --4번 상품패널
 minishop1_goods04 = Panel(Rect(0,198,270,64))
 minishop1_goods04.color = Color(0,48,8)
 minishop1_goods04_icon = Image(goods4_icon,Rect(20,5,50,50)) 
 minishop1_goods04.AddChild(minishop1_goods04_icon)
 minishop1_goods_panel.AddChild(minishop1_goods04)
 minishop1_goods04_title = Text(Client.GetItem(goods4).name, Rect(100, 0, 160, 20))
 minishop1_goods04_title.textSize = 16
 minishop1_goods04_title.color = Color(250,250,250)
 minishop1_goods04.AddChild(minishop1_goods04_title)
 minishop1_goods04_BP = Text("구매가격 : " ..Client.GetItem(goods4).buyerPrice, Rect(100, 24, 160, 16))
 minishop1_goods04_BP.textSize = 12
 minishop1_goods04_BP.color = Color(250,250,250)
 minishop1_goods04.AddChild(minishop1_goods04_BP)
 minishop1_goods04_SP = Text("판매가격 : " .. Client.GetItem(goods4).sellerPrice, Rect(100, 40, 160, 16))
 minishop1_goods04_SP.textSize = 12
 minishop1_goods04_SP.color = Color(250,250,250)
 minishop1_goods04.AddChild(minishop1_goods04_SP)
 minishop1_goods04_buy = Button("구입",Rect(220,5 ,32,24))
  minishop1_goods04_buy.color = Color(198,125,23,255)
  minishop1_goods04_buy.textColor = Color(0,0,0,255)
  minishop1_goods04_buy.textAlign = 4
  minishop1_goods04_buy.textSize = 15
  minishop1_goods04_buy.onClick.Add(function()
		Client.FireEvent('minishop_buy', goods4, Client.GetItem(goods4).buyerPrice)
  end)
 minishop1_goods04_sell = Button("판매",Rect(220,30 ,32,24))
  minishop1_goods04_sell.color = Color(198,125,23,255)
  minishop1_goods04_sell.textColor = Color(0,0,0,255)
  minishop1_goods04_sell.textAlign = 4
  minishop1_goods04_sell.textSize = 15
  minishop1_goods04_sell.onClick.Add(function()
		Client.FireEvent('minishop_sell', goods4, Client.GetItem(goods4).sellerPrice)
  end)
 minishop1_goods04.AddChild(minishop1_goods04_buy)
 minishop1_goods04.AddChild(minishop1_goods04_sell)
 
 --5번 상품패널
 minishop1_goods05 = Panel(Rect(0,264,270,64))
 minishop1_goods05.color = Color(0,48,8)
 minishop1_goods05_icon = Image(goods5_icon,Rect(20,5,50,50)) 
 minishop1_goods05.AddChild(minishop1_goods05_icon)
 minishop1_goods_panel.AddChild(minishop1_goods05)
 minishop1_goods05_title = Text(Client.GetItem(goods5).name, Rect(100, 0, 160, 20))
 minishop1_goods05_title.textSize = 16
 minishop1_goods05_title.color = Color(250,250,250)
 minishop1_goods05.AddChild(minishop1_goods05_title)
 minishop1_goods05_BP = Text("구매가격 : " ..Client.GetItem(goods5).buyerPrice, Rect(100, 24, 160, 16))
 minishop1_goods05_BP.textSize = 12
 minishop1_goods05_BP.color = Color(250,250,250)
 minishop1_goods05.AddChild(minishop1_goods05_BP)
 minishop1_goods05_SP = Text("판매가격 : " .. Client.GetItem(goods5).sellerPrice, Rect(100, 40, 160, 16))
 minishop1_goods05_SP.textSize = 12
 minishop1_goods05_SP.color = Color(250,250,250)
 minishop1_goods05.AddChild(minishop1_goods05_SP)
 minishop1_goods05_buy = Button("구입",Rect(220,5 ,32,24))
  minishop1_goods05_buy.color = Color(198,125,23,255)
  minishop1_goods05_buy.textColor = Color(0,0,0,255)
  minishop1_goods05_buy.textAlign = 4
  minishop1_goods05_buy.textSize = 15
  minishop1_goods05_buy.onClick.Add(function()
		Client.FireEvent('minishop_buy', goods5, Client.GetItem(goods5).buyerPrice)
  end)
 minishop1_goods05_sell = Button("판매",Rect(220,30 ,32,24))
  minishop1_goods05_sell.color = Color(198,125,23,255)
  minishop1_goods05_sell.textColor = Color(0,0,0,255)
  minishop1_goods05_sell.textAlign = 4
  minishop1_goods05_sell.textSize = 15
  minishop1_goods05_sell.onClick.Add(function()
		Client.FireEvent('minishop_sell', goods5, Client.GetItem(goods5).sellerPrice)
  end)
 minishop1_goods05.AddChild(minishop1_goods05_buy)
 minishop1_goods05.AddChild(minishop1_goods05_sell)
 
 --6번 상품패널
 minishop1_goods06 = Panel(Rect(0,330,270,64))
 minishop1_goods06.color = Color(0,48,8)
 minishop1_goods06_icon = Image(goods6_icon,Rect(20,5,50,50)) 
 minishop1_goods06.AddChild(minishop1_goods06_icon)
 minishop1_goods_panel.AddChild(minishop1_goods06)
 minishop1_goods06_title = Text(Client.GetItem(goods6).name, Rect(100, 0, 160, 20))
 minishop1_goods06_title.textSize = 16
 minishop1_goods06_title.color = Color(250,250,250)
 minishop1_goods06.AddChild(minishop1_goods06_title)
 minishop1_goods06_BP = Text("구매가격 : " ..Client.GetItem(goods6).buyerPrice, Rect(100, 24, 160, 16))
 minishop1_goods06_BP.textSize = 12
 minishop1_goods06_BP.color = Color(250,250,250)
 minishop1_goods06.AddChild(minishop1_goods06_BP)
 minishop1_goods06_SP = Text("판매가격 : " .. Client.GetItem(goods6).sellerPrice, Rect(100, 40, 160, 16))
 minishop1_goods06_SP.textSize = 12
 minishop1_goods06_SP.color = Color(250,250,250)
 minishop1_goods06.AddChild(minishop1_goods06_SP)
 minishop1_goods06_buy = Button("구입",Rect(220,5 ,32,24))
  minishop1_goods06_buy.color = Color(198,125,23,255)
  minishop1_goods06_buy.textColor = Color(0,0,0,255)
  minishop1_goods06_buy.textAlign = 4
  minishop1_goods06_buy.textSize = 15
  minishop1_goods06_buy.onClick.Add(function()
		Client.FireEvent('minishop_buy', goods6, Client.GetItem(goods6).buyerPrice)
  end)
 minishop1_goods06_sell = Button("판매",Rect(220,30 ,32,24))
  minishop1_goods06_sell.color = Color(198,125,23,255)
  minishop1_goods06_sell.textColor = Color(0,0,0,255)
  minishop1_goods06_sell.textAlign = 4
  minishop1_goods06_sell.textSize = 15
  minishop1_goods06_sell.onClick.Add(function()
		Client.FireEvent('minishop_sell', goods6, Client.GetItem(goods6).sellerPrice)
  end)
 minishop1_goods06.AddChild(minishop1_goods06_buy)
 minishop1_goods06.AddChild(minishop1_goods06_sell)
 
 --7번 상품패널
 minishop1_goods07 = Panel(Rect(0,396,270,64))
 minishop1_goods07.color = Color(0,48,8)
 minishop1_goods07_icon = Image(goods7_icon,Rect(20,5,50,50)) 
 minishop1_goods07.AddChild(minishop1_goods07_icon)
 minishop1_goods_panel.AddChild(minishop1_goods07)
 minishop1_goods07_title = Text(Client.GetItem(goods7).name, Rect(100, 0, 160, 20))
 minishop1_goods07_title.textSize = 16
 minishop1_goods07_title.color = Color(250,250,250)
 minishop1_goods07.AddChild(minishop1_goods07_title)
 minishop1_goods07_BP = Text("구매가격 : " ..Client.GetItem(goods7).buyerPrice, Rect(100, 24, 160, 16))
 minishop1_goods07_BP.textSize = 12
 minishop1_goods07_BP.color = Color(250,250,250)
 minishop1_goods07.AddChild(minishop1_goods07_BP)
 minishop1_goods07_SP = Text("판매가격 : " .. Client.GetItem(goods7).sellerPrice, Rect(100, 40, 160, 16))
 minishop1_goods07_SP.textSize = 12
 minishop1_goods07_SP.color = Color(250,250,250)
 minishop1_goods07.AddChild(minishop1_goods07_SP)
 minishop1_goods07_buy = Button("구입",Rect(220,5 ,32,24))
  minishop1_goods07_buy.color = Color(198,125,23,255)
  minishop1_goods07_buy.textColor = Color(0,0,0,255)
  minishop1_goods07_buy.textAlign = 4
  minishop1_goods07_buy.textSize = 15
  minishop1_goods07_buy.onClick.Add(function()
		Client.FireEvent('minishop_buy', goods7, Client.GetItem(goods7).buyerPrice)
  end)
 minishop1_goods07_sell = Button("판매",Rect(220,30 ,32,24))
  minishop1_goods07_sell.color = Color(198,125,23,255)
  minishop1_goods07_sell.textColor = Color(0,0,0,255)
  minishop1_goods07_sell.textAlign = 4
  minishop1_goods07_sell.textSize = 15
  minishop1_goods07_sell.onClick.Add(function()
		Client.FireEvent('minishop_sell', goods7, Client.GetItem(goods7).sellerPrice)
  end)
 minishop1_goods07.AddChild(minishop1_goods07_buy)
 minishop1_goods07.AddChild(minishop1_goods07_sell)
 
 --8번 상품패널
 minishop1_goods08 = Panel(Rect(0,462,270,64))
 minishop1_goods08.color = Color(0,48,8)
 minishop1_goods08_icon = Image(goods8_icon,Rect(20,5,50,50)) 
 minishop1_goods08.AddChild(minishop1_goods08_icon)
 minishop1_goods_panel.AddChild(minishop1_goods08)
 minishop1_goods08_title = Text(Client.GetItem(goods8).name, Rect(100, 0, 160, 20))
 minishop1_goods08_title.textSize = 16
 minishop1_goods08_title.color = Color(250,250,250)
 minishop1_goods08.AddChild(minishop1_goods08_title)
 minishop1_goods08_BP = Text("구매가격 : " ..Client.GetItem(goods8).buyerPrice, Rect(100, 24, 160, 16))
 minishop1_goods08_BP.textSize = 12
 minishop1_goods08_BP.color = Color(250,250,250)
 minishop1_goods08.AddChild(minishop1_goods08_BP)
 minishop1_goods08_SP = Text("판매가격 : " .. Client.GetItem(goods8).sellerPrice, Rect(100, 40, 160, 16))
 minishop1_goods08_SP.textSize = 12
 minishop1_goods08_SP.color = Color(250,250,250)
 minishop1_goods08.AddChild(minishop1_goods08_SP)
 minishop1_goods08_buy = Button("구입",Rect(220,5 ,32,24))
  minishop1_goods08_buy.color = Color(198,125,23,255)
  minishop1_goods08_buy.textColor = Color(0,0,0,255)
  minishop1_goods08_buy.textAlign = 4
  minishop1_goods08_buy.textSize = 15
  minishop1_goods08_buy.onClick.Add(function()
		Client.FireEvent('minishop_buy', goods8, Client.GetItem(goods8).buyerPrice)
  end)
 minishop1_goods08_sell = Button("판매",Rect(220,30 ,32,24))
  minishop1_goods08_sell.color = Color(198,125,23,255)
  minishop1_goods08_sell.textColor = Color(0,0,0,255)
  minishop1_goods08_sell.textAlign = 4
  minishop1_goods08_sell.textSize = 15
  minishop1_goods08_sell.onClick.Add(function()
		Client.FireEvent('minishop_sell', goods8, Client.GetItem(goods8).sellerPrice)
  end)
 minishop1_goods08.AddChild(minishop1_goods08_buy)
 minishop1_goods08.AddChild(minishop1_goods08_sell)
 
 
 --끝입니다
end