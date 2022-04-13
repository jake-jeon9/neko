Server.GetTopic("SSS").Add(function(text)
Server.SendSay(""..unit.name..": "..text.."",0065344)
Server.FireEvent("Topnotice",unit.name,text)
end
)


-- 색코드 알아내는법: https://www.shodor.org/stella2java/rgbint.html 들어가서
-- 원하는 색코드 evaluate로 치환하고 00(RGB int 8자리) 넣으면 됨. 절대 앞에 손댈 생각하지마셈.