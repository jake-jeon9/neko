
cw = Client.width
ch = Client.height


Client.GetTopic("너탈래").Add(function(nm,targetName)
    if MarryW_msk then
        MarryW_msk.Destroy()
    end
    MarryW_msk = Panel(Rect(0,0,cw,ch))
    MarryW_pnl = Image("Pictures/수락거절_네코텍스트로.png",Rect(cw/2-150,ch/2-100,300,180))
    MarryW_txt = Text(nm.."님의 차량에 탑승하시겠습니까?\n 하차는 /나내려 를 입력해주세요.",Rect(0,0,300,150))
    MarryW_txt.textAlign = 4
    MarryW_btn1 = Button("수락",Rect(85,150,60,30))
    MarryW_btn1.onClick.Add(function()
        Client.FireEvent("너타승인",nm)
        MarryW_msk.Destroy()
    end)
    MarryW_btn2 = Button("거절",Rect(155,150,60,30))
    MarryW_btn2.onClick.Add(function()
        MarryW_msk.Destroy()
        Client.FireEvent("너타거절",nm)

    end)
	MarryW_btn1.SetOpacity(0)
	MarryW_btn2.SetOpacity(0)

    MarryW_msk.showOnTop = true
    MarryW_msk.AddChild(MarryW_pnl)
    MarryW_pnl.AddChild(MarryW_txt)
    MarryW_pnl.AddChild(MarryW_btn1)
    MarryW_pnl.AddChild(MarryW_btn2)
end)


Client.GetTopic("출발").Add(function(nm,num)
    
    local units = Client.field.units
    Camera.target = Client.myPlayerUnit
    --print("진입.."..num.."..이름 :"..nm)
    for i,v in pairs(units) do
        if v.name == nm then
            --print(num.."화면조정 시작")
            Camera.target = v
        end
    end
    DpadController.visible = false

end)


Client.GetTopic("이동중").Add(function(x,y)
    me = Client.myPlayerUnit
    cam = Camera.position
    cam.x = x
    cam.y=y
    me.MoveToPosition(cam.x,cam.y)
end)


Client.GetTopic("나내려").Add(function()
    DpadController.visible = true
    Camera.target = Client.myPlayerUnit
    
end)

function moveToTarget1(x,y)

    local originTarget = Camera.target
    --Camera.target = target
    local myX = Camera.position.x
    local myY = Camera.position.y

    local distanceX = math.abs(myX) - math.abs(x)
    local distanceY = math.abs(myY) - math.abs(y)

    local toLeft = true
    local toDown = false

    if myX < x then
        toLeft = false
    end
    if myY > y then
        toDown = true
    end

    cam = Camera.position

    if toLeft then
        print("왼쪾진입")
        if cam.x <= x then
            print("X목적지")
            cam.x = x
        else
            cam.x = myX-distanceX/10
        end
    else
        print("오른진입")
        if cam.x >= x then
            print("X목적지")
            cam.x = x
        else
            cam.x = myX+distanceX/10
        end
    end

    if toDown then
        print("아래진입")
        if cam.y <= y then
            print("Y목적지")
            cam.y = y
        else
            cam.y = myY+distanceY/10
        end
    else
        if cam.y >= y then
            print("Y목적지")
            cam.y = y
        else
            print("위로진입")
            cam.y = myY-distanceY/10
        end
    end    

    if cam.x ==x and cam.y == y then
        Camera.position = cam
        print("함수X?"..Camera.position.x)
        print("함수Y?"..Camera.position.y)
        Camera.target = originTarget
    end
    
end