Server.GetTopic('minishop_buy').Add(function(goods, price)
if unit.gameMoney >= price then
unit.UseGameMoney(price)
unit.addItem(goods,1,true)
else
unit.PlaySE("소지금이부족합니다.ogg")
end
end)

Server.GetTopic('minishop_sell').Add(function(goods, price)
if unit.CountItem(goods) >= 1 then
unit.RemoveItem(goods, 1, true, true, true)
unit.AddGameMoney(price)
else
unit.PlaySE("아이템이없습니다.ogg")
end
end)

--새로운 소리파일을 넣은뒤에는 반드시 리소스 관리자에서 리소스마다 새로고침 해주세요. 안그럼 적용이 안됩니다.