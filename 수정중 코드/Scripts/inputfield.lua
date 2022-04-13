
Client.GetTopic("Hwaks").Add(function()
aaaa=InputField()
aaaa.rect=Rect(Client.width/2-150,Client.height/2-50,300,100)
aaaa.color=Color(0,0,0)
aaaa.placeholder = "<color=#003000>글을 입력하고 보내기버튼을 누르세요.</color>"

aaaaa=Button("보내기",Rect(aaaa.width/2-50,aaaa.height-30,100,24))
aaaa.AddChild(aaaaa)
aaaaa.color=Color(0,50,255)
aaaaa.SetOpacity(255)

aaaaa.onClick.Add(function()

Client.FireEvent("SSS",aaaa.text)
aaaa.Destroy()

	

end
)
end
)