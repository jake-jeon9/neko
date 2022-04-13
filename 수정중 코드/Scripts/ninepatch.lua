function ninepatch(x, y, name, explain, bool, func)
	local mask = Panel(Rect(0, 0, Client.width, Client.height))
	mask.SetOpacity(145)
	mask.showOnTop = true
	local leftUp = Image("Pictures/leftUp.png", Rect(0, 0, 10, 10))
	local rightUp = Image("Pictures/rightUp.png", Rect(x+10, 0, 10, 10))
	local leftDown = Image("Pictures/leftDown.png", Rect(0, y+10, 10, 10))
	local rightDown = Image("Pictures/rightDown.png", Rect(x+10, y+10, 10, 10))
	local left = Image("Pictures/left.png", Rect(0, 10, 10, y))
	local right = Image("Pictures/right.png", Rect(x+10, 10, 10, y))
	local up = Image("Pictures/up.png", Rect(10, 0, x, 10))
	local down = Image("Pictures/down.png", Rect(10, y+10, x, 10))
	local middle = Image("Pictures/middle.png", Rect(10, 10, x, y))
	local title = Text("", Rect(10, 8, x/2, 20))
	local content = Text("", Rect(10, 20, x, y-30))
	content.textAlign = 4
	title.textSize = 16
	title.text = name
	content.text = explain

	local panel = Panel(Rect(Client.width/2-(x/2)-10, Client.height/2-(y/2)-10, x+20, y+20))
	panel.SetOpacity(0)

	local closeButton = Button("", Rect(x-5, 5, 20, 20))
	closeButton.SetOpacity(0)
	closeButton.AddChild(Image("Pictures/CloseButton.png", Rect(0, 0, 20, 20)))
	closeButton.onClick.Add(function()
		mask.Destroy()
	end)

	panel.AddChild(leftUp)
	panel.AddChild(rightUp)
	panel.AddChild(leftDown)
	panel.AddChild(rightDown)
	panel.AddChild(left)
	panel.AddChild(right)
	panel.AddChild(up)
	panel.AddChild(down)
	panel.AddChild(middle)
	panel.AddChild(closeButton)
	panel.AddChild(title)
	panel.AddChild(content)
	if button ~= nil then
		panel.AddChild(button)
	end
	mask.AddChild(panel)
end

variable = "<color=#FFFF00>아바타는 또다른 나입니다.\n따뜻한 사랑과 관심으로 아바타를 대해주세요!</color>"
print(variable)
