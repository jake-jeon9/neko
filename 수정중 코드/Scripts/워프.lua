
local map = {name = {}, explain = {}, image = {}}
map.name[1] = "시청"
map.explain[1] = "혼인,이혼 하러가자"
map.image[1] = "Pictures/시청갈래.png"

map.name[2] = "결혼식장"
map.explain[2] = "쏠로 탈출!"
map.image[2] = "Pictures/일루갈래.png"

map.name[3] = "낚시터"
map.explain[3] = "낚시터"
map.image[3] = "Pictures/일루갈래.png"

map.name[4] = "루팡시티"
map.explain[4] = "루팡시티"
map.image[4] = "Pictures/일루갈래.png"

map.name[5] = "쇼팽시티"
map.explain[5] = "쇼팽시티"
map.image[5] = "Pictures/일루갈래.png"

map.name[6] = "앨리스시티"
map.explain[6] = "앨리스시티"
map.image[6] = "Pictures/일루갈래.png"

map.name[7] = "고목나무"
map.explain[7] = "여름숲"
map.image[7] = "Pictures/일루갈래.png"

map.name[8] = "줄리엣시티"
map.explain[8] = "줄리엣시티"
map.image[8] = "Pictures/일루갈래.png"

map.name[9] = "남원"
map.explain[9] = "남원"
map.image[9] = "Pictures/일루갈래.png"


function warp_open()
	local mask = Panel(Rect(0, 0, Client.width, Client.height))
	mask.color = Color(0, 0, 0)
	mask.SetOpacity(145)
	mask.showOnTop = true

	local panel = Image("Pictures/warp_scroll_panel.png", Rect(Client.width/2-183, Client.height/2-225, 366, 450))

	local scroll = ScrollPanel(Rect(11, 51, 344, 386))
	scroll.SetOpacity(0)

	local board = Panel(Rect(0, 0, 344, (#map.name*95)+((#map.name-1)*6)))

	local list = {panel = {}, buttonImage = {}, button = {}, nameText = {}, explain = {}, image = {}}
	for i=1, #map.name do
		list.panel[i] = Image("Pictures/warp_panel.png", Rect(0, ((i-1)*95)+((i-1)*6), 344, 95))
		board.AddChild(list.panel[i])

		list.nameText[i] = Text(map.name[i], Rect(92, 11, 167, 18))
		list.nameText[i].color = Color(0, 0, 0)
		list.explain[i] = Text(map.explain[i], Rect(91, 34, 150, 47))
		list.explain[i].textSize = 12
		list.explain[i].color = Color(0, 0, 0)
		list.image[i] = Image(map.image[i], Rect(12, 13, 69, 69))
		list.buttonImage[i] = Image("Pictures/warpButton.png", Rect(242, 44, 94, 43))
		list.button[i] = Button("", Rect(242, 44, 94, 43))
		list.button[i].SetOpacity(0)
		list.button[i].onClick.Add(function()
			list.buttonImage[i].SetImage("Pictures/warpButton_press.png")
			Client.RunLater(function()
				list.buttonImage[i].SetImage("Pictures/warpButton.png")
				Client.FireEvent("Y_warpPost", i)
				mask.Destroy()
			end,0.1)
		end)
		list.panel[i].AddChild(list.nameText[i])
		list.panel[i].AddChild(list.explain[i])
		list.panel[i].AddChild(list.image[i])
		list.panel[i].AddChild(list.buttonImage[i])
		list.panel[i].AddChild(list.button[i])
	end

	scroll.content = board
	scroll.horizontal = false
	scroll.AddChild(board)

	local closeButton = Button("", Rect(366-23-6, 6, 23, 23))
	closeButton.AddChild(Image("Pictures/CloseButton.png", Rect(0, 0, 23, 23)))
	closeButton.SetOpacity(0)
	closeButton.onClick.Add(function()
		mask.Destroy()
	end)

	panel.AddChild(closeButton)
	panel.AddChild(scroll)
	mask.AddChild(panel)
end
