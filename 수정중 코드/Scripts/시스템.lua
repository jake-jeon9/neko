local scrollWidth = 220
local scrollHeight = 50
local panelHeight = 25
local panelSize = 8

function logOpen()
	if sysScroll ~= nil then
		sysScroll.Destroy()
		sysBoard.Destroy()
	end

	sysScroll = ScrollPanel()
	sysScroll.rect = Rect(Client.width/2-(scrollWidth/2), Client.height-scrollHeight-60, scrollWidth, scrollHeight)
	sysScroll.color = Color(0, 0, 0)
	sysScroll.SetOpacity(95)

	sysBoard = Panel()
	sysBoard.rect = Rect(0, 0, scrollWidth, panelHeight*panelSize)
	sysBoard.SetOpacity(0)

	sysPanel = {}
	for i=1, panelSize do
		sysPanel[i] = Panel()
		sysPanel[i].rect = Rect(0, (i-1)*panelHeight, scrollWidth-20, panelHeight)
		sysPanel[i].SetOpacity(0)
		sysBoard.AddChild(sysPanel[i])
	end

	sysScroll.AddChild(sysBoard)
	sysScroll.content = sysBoard
	sysScroll.horizontal = false
	sysScroll.showVerticalScrollbar = false
end

logOpen()

function refreshLog()
	sysText = {}
	for i=1, panelSize do
		sysBoard.RemoveChild(sysPanel[i])
		sysPanel[i].Destroy()

		sysPanel[i] = Panel()
		sysPanel[i].rect = Rect(0, (i-1)*panelHeight, scrollWidth-20, panelHeight)
		sysPanel[i].SetOpacity(0)

		sysText[i] = Text()
		sysText[i].rect = Rect(5, 0, scrollWidth, panelHeight)
		sysText[i].text = scrollText[(panelSize+1)-i]

		sysPanel[i].AddChild(sysText[i])
		sysBoard.AddChild(sysPanel[i])
	end
end

scrollText = {}
for i=1, panelSize do
	scrollText[i] = ""
end

function inputText(text)
	for i=1, panelSize do
		if scrollText[(panelSize+1)-i] == "" then
			scrollText[(panelSize+1)-i] = text
			refreshLog()
			break
		else
			if (panelSize+1)-i == 1 and scrollText[(panelSize+1)-i] ~= "" then
				for i=1, panelSize do
					scrollText[(panelSize+1)-i] = scrollText[panelSize-i]
				end
				scrollText[1] = text
				refreshLog()
				break
			end
		end
	end
end

inputText("") -- 삭제 금지

Client.GetTopic("addLog").Add(function(text)
	inputText(text)
end)
