
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
---::  운영관리에 최적화된 명령어 세트!    ::::::::::::::::::::::  본 명령어 세트는 "Windmill" 또는 "윈드밀"에게 저작권이	:::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  있으며, 무단 배포, 재 판매가 불가능합니다.	 		    :::
-- :::::::::::::  명령어 기능   ::::::::::::::::::::::::::::::::: 															:::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  본 스크립트는 20명명 이하의 플레이어에게 정상 적용을 확인:::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  하였으며, 한 맵에 과다한 플레이어가 있는 경우 문제가		:::
-- :: 적용 대상 ::::::::::::  지원 기능  ::::::::::::::::::::::::  발생할 수 있는 점 양해 부탁 드립니다.					:::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  (P.S 저사양으로 확인 불가였어요 ㅠㅠ)					:::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  본 스크립트는 지속 업데이트/ 관리가 진해될 예정입니다.   :::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- :::::::::::::  																								    :::::::::::::
-- :::::::::::::  							아래의 스크립트는 건드실 필요가 없습니다.	    						:::::::::::::
-- :::::::::::::  																								    :::::::::::::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

   function Commod_Notice(Notice_Text,Type)
	  local Pannel_Y = 10
	if Type == 1 then
		Pannel_Y = 20
	end
	  local TEXT_Align = 1
	  local Notice_Panel = Panel()
      Notice_Panel.SetOpacity(0)                             		
      Notice_Panel.rect = Rect(0,Client.width*(Pannel_Y*0.01),Client.width,40)
	  Notice_Panel.masked = true
      local Print_Panel = Panel()                             		
      Print_Panel.SetOpacity(100)                             		
      Print_Panel.rect = Rect(0,-40,Client.width,40)               	
      local Print_Txt = Text("",Rect(0,10,Client.width,40))     	
      Print_Txt.text = Notice_Text
      Print_Txt.textAlign = TEXT_Align                              
      Print_Panel.AddChild(Print_Txt)                           	
      Print_Panel.DOMove(Point(0,Print_Panel.y+40),0.5)             
	  	  Notice_Panel.AddChild(Print_Panel)		  
      Client.RunLater(function() Print_Panel.DOMove(Point(0,Print_Panel.y-40),0.5) end,2)
      Client.RunLater(function() Notice_Panel.Destroy() end,2.5)
   end

   function Commod_ENotice_Show(Evnt_Text,Type)
	local Pannel_Y = 25  
	if Type == 1 then
		Pannel_Y = 40
	end
	  local TEXT_Align = 1
	  local ENotice_Panel = Panel()
      ENotice_Panel.SetOpacity(100)                             		
      ENotice_Panel.rect = Rect(0,Client.width*(Pannel_Y*0.01),Client.width*0.3,40)
	  ENotice_Panel.masked = true
      local EPrint_Txt = Text("",Rect(0,10,Client.width*0.3,40))     	
      EPrint_Txt.text = Evnt_Text
      EPrint_Txt.textAlign = TEXT_Align                              
      ENotice_Panel.AddChild(EPrint_Txt)
	  Client.GetTopic("Commod_ENotice_Close").Add(function() ENotice_Panel.Destroy() end)
   end
Client.GetTopic("ExitGame").Add(function(text) print("게임 종료") Client.Quit() end)
Client.GetTopic("Commod_Notice").Add(function(Notice_Text,Type) Commod_Notice(Notice_Text,Type) end)
Client.GetTopic("Commod_ENotice_Show").Add(function(Evnt_Text,Type) Commod_ENotice_Show(Evnt_Text,Type) end)
