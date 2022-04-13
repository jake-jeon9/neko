lvtogradeT = {}
for i=0, 10 do
	lvtogradeT[i] = "Pictures/img_grade"..i..".png"
end

ScreenUI.expBarVisible  = true
ScreenUI.levelVisible = false

HUD = Image("Pictures/HUD.png", Rect(0, Client.height-48, 1200, 48))
BAR_EXP = Image("Pictures/BAR_EXP.png", Rect(178, Client.height-16, 531, 10))
EXPtxt = Text("",Rect(0, Client.height-25, Client.width, 25))
EXPtxt.textAlign = 5
EXPtxt.textSize = 12

LVGrade = Image(lvtogradeT[1],Rect(2.5,Client.height-26.5,25,22))

LVTextOut1 = Text()
LVTextOut1.rect = Rect(29, Client.height-31-2, 122, 31)
LVTextOut1.textSize = 17
LVTextOut1.textAlign = 3
LVTextOut1.color = Color(0,0,0,255)

LVTextOut2 = Text()
LVTextOut2.rect = Rect(29, Client.height-29-2, 122, 31)
LVTextOut2.textSize = 17
LVTextOut2.textAlign = 3
LVTextOut2.color = Color(0,0,0,255)

LVTextOut3 = Text()
LVTextOut3.rect = Rect(31, Client.height-29-2, 122, 31)
LVTextOut3.textSize = 17
LVTextOut3.textAlign = 3
LVTextOut3.color = Color(0,0,0,255)

LVTextOut4 = Text()
LVTextOut4.rect = Rect(31, Client.height-31-2, 122, 31)
LVTextOut4.textSize = 17
LVTextOut4.textAlign = 3
LVTextOut4.color = Color(0,0,0,255)

LVText = Text()
LVText.rect = Rect(30, Client.height-30-2, 122, 30)
LVText.textSize = 17
LVText.textAlign = 3

function refreshUI()
	local lv = Client.myPlayerUnit.level
	if lv <= 5 then
	    LVGrade.SetImage(lvtogradeT[0])
	    LVText.text = "LV."..Client.myPlayerUnit.level
	    LVTextOut1.text = "<color=#000000>LV."..Client.myPlayerUnit.level.."</color>"
	    LVTextOut2.text = "<color=#000000>LV."..Client.myPlayerUnit.level.."</color>"
	    LVTextOut3.text = "<color=#000000>LV."..Client.myPlayerUnit.level.."</color>"
	    LVTextOut4.text = "<color=#000000>LV."..Client.myPlayerUnit.level.."</color>"
	elseif lv <= 10 then
		LVGrade.SetImage(lvtogradeT[1])
		LVText.text = "새내기 시민"
		LVTextOut1.text = "새내기 시민"
		LVTextOut2.text = "새내기 시민"
		LVTextOut3.text = "새내기 시민"
		LVTextOut4.text = "새내기 시민"
	elseif lv <= 20 then
		LVGrade.SetImage(lvtogradeT[2])
		LVText.text = "일반 시민"
		LVTextOut1.text = "일반 시민"
		LVTextOut2.text = "일반 시민"
		LVTextOut3.text = "일반 시민"
		LVTextOut4.text = "일반 시민"
	elseif lv <= 30 then
		LVGrade.SetImage(lvtogradeT[3])
		LVText.text = "열정 시민"
		LVTextOut1.text = "열정 시민"
		LVTextOut2.text = "열정 시민"
		LVTextOut3.text = "열정 시민"
		LVTextOut4.text = "열정 시민"
	elseif lv <= 40 then
		LVGrade.SetImage(lvtogradeT[4])
		LVText.text = "모범 시민"
		LVTextOut1.text = "모범 시민"
		LVTextOut2.text = "모범 시민"
		LVTextOut3.text = "모범 시민"
		LVTextOut4.text = "모범 시민"
	elseif lv <= 50 then
		LVGrade.SetImage(lvtogradeT[5])
		LVText.text = "우수 시민"
		LVTextOut1.text = "우수 시민"
		LVTextOut2.text = "우수 시민"
		LVTextOut3.text = "우수 시민"
		LVTextOut4.text = "우수 시민"
	elseif lv <= 60 then
		LVGrade.SetImage(lvtogradeT[6])
		LVText.text = "으뜸 시민"
		LVTextOut1.text = "으뜸 시민"
		LVTextOut2.text = "으뜸 시민"
		LVTextOut3.text = "으뜸 시민"
		LVTextOut4.text = "으뜸 시민"
	elseif lv <= 70 then
		LVGrade.SetImage(lvtogradeT[7])
		LVText.text = "운사선인"
		LVTextOut1.text = "운사선인"
		LVTextOut2.text = "운사선인"
		LVTextOut3.text = "운사선인"
		LVTextOut4.text = "운사선인"
	elseif lv <= 80 then
		LVGrade.SetImage(lvtogradeT[8])
		LVText.text = "우사선인"
		LVTextOut1.text = "우사선인"
		LVTextOut2.text = "우사선인"
		LVTextOut3.text = "우사선인"
		LVTextOut4.text = "우사선인"
	elseif lv <= 90 then
		LVGrade.SetImage(lvtogradeT[9])
		LVText.text = "풍백선인"
		LVTextOut1.text = "풍백선인"
		LVTextOut2.text = "풍백선인"
		LVTextOut3.text = "풍백선인"
		LVTextOut4.text = "풍백선인"
	elseif lv <= 99 then
		LVGrade.SetImage(lvtogradeT[10])
		LVText.text = "누리신"
		LVTextOut1.text = "누리신"
		LVTextOut2.text = "누리신"
		LVTextOut3.text = "누리신"
		LVTextOut4.text = "누리신"
	end
	EXPtxt.text = Client.myPlayerUnit.exp.."/"..Client.myPlayerUnit.maxEXP.."  "
	BAR_EXP.DOScale(Point(Client.myPlayerUnit.exp/Client.myPlayerUnit.maxEXP, 1), 0.5)
end

Client.onTick.Add(refreshUI,1)