
Client.GetTopic("sarpp").Add(function(text)

local nakoo = Utility.JSONParse(text)

panel2=Panel(Rect(Client.width/2-375,50,750,390))
panel2.showOnTop=true

panel2.color =  Color(0, 0, 0, 200)
panel1=ScrollPanel()
panel1.rect=Rect(5,65,740, 320)
panel1.horizontal=false
panel1.showVerticalScrollbar= true
panel2.AddChild(panel1) 


panel3 = Panel(Rect(0, 0, 730, (#nakoo.name*50)+((#nakoo.name-1)*6)))
panel3.SetOpacity(0)
panel1.AddChild(panel3) 
panel1.content =panel3

can=Button('닫기',Rect(685,5,60,25))
can.onClick.Add(function()
panel2.Destroy()
end)
panel2.AddChild(can) 

textcat=Text('채팅로그',Rect(325,-20,200,100))
textcat.textSize=25
panel2.AddChild(textcat) 

for i=1,#nakoo.name do


panel4=Panel(Rect(0, ((i-1)*50)+((i-1)*6), 730, 50))
panel3.AddChild(panel4)

namepanel=Text(nakoo.name[i]..':',Rect(5, -25, 1000, 100))

msgpanel=Text(nakoo.msg[i],Rect(180, -25, 1000, 100))

msgpanel.textSize=12
panel4.AddChild(msgpanel) 

panel4.AddChild(namepanel) 

--panel3.rect=Rect(0,0,750, )
end


print('확인')
end)

