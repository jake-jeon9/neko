------------------------------------------------------------------------------------------------------------------------------------------
--*/절전 스크립트_Client/*--
--Made By. ㄱㅇㅇ
-- [+주의+] 해당 기능은 프레임 저하를 이용하여, 게임 진행 및 자동사냥등의 성능 저하를 초래할 수 있습니다.
cw = Client.width
ch = Client.height
Save = {}
------------------------------------------------------------------------------------------------------------------------------------------
Save.Opc = 240
-- 절전 모드 패널 투명도 조절값입니다. (수치: 0 ~ 255 / 255에 가까울 수록 어두워 집니다.)
------------------------------------------------------------------------------------------------------------------------------------------

Save.mode = false

Save.sw = Button("", Rect(cw-0,ch/0,0,0))
Save.sw.onClick.Add(function()
    Save:Set()
end)

Save.frame = Client.targetFrameRate

Save.p00 = Panel(Rect(0,0,cw,ch))
Save.p00.showOnTop = true
Save.p00.SetOpacity(Save.Opc)
Save.p00.visible = false

Save.t00 = Text("<size=25><color=grey>절전 모드 실행 중입니다</color></size>\n\n버튼을 눌러 절전 모드를 해제할 수 있습니다",Rect(0,0,cw,ch))
Save.t00.textAlign = 4
Save.t00.textSize = 12
Save.p00.AddChild(Save.t00)

Save.b00 = Button("",Rect(0,0,cw,ch))
Save.b00.SetOpacity(0)
Save.b00.onClick.Add(function()
    Save:Set()
end)
Save.p00.AddChild(Save.b00)

function Save:Set()
    self.mode = not self.mode
    self.p00.visible = not self.p00.visible
    self.sw.text = self.mode and "절전 ON" or "절전 OFF"
    print("<color=yellow>[!] 절전모드 ".. (self.mode and "실행" or "종료").."</color>")

    if self.mode then
        Client.targetFrameRate = self.frame - 40
    else
        Client.targetFrameRate = self.frame
    end
end