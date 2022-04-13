local Potion_StringVar = 60 --개인스트링변수
local txt = '[false, false, 50, 50, 1, 1]' --테이블 기본값

Server.GetTopic('자동물약체력').Add(function(BOOL)
	local T = Utility.JSONParse(unit.GetStringVar(Potion_StringVar))
	T[1] = BOOL
	unit.SetStringVar(Potion_StringVar, Utility.JSONSerialize(T))
	unit.FireEvent('데이터업데이트', unit.GetStringVar(Potion_StringVar))
end)

Server.GetTopic('자동물약체력퍼센트').Add(function(num)
	local T = Utility.JSONParse(unit.GetStringVar(Potion_StringVar))
	T[3] = num
	unit.SetStringVar(Potion_StringVar, Utility.JSONSerialize(T))
	unit.FireEvent('데이터업데이트', unit.GetStringVar(Potion_StringVar))
end)

Server.GetTopic('자동물약체력선택').Add(function(num)
	local T = Utility.JSONParse(unit.GetStringVar(Potion_StringVar))
	T[5] = num
	unit.SetStringVar(Potion_StringVar, Utility.JSONSerialize(T))
	unit.FireEvent('데이터업데이트', unit.GetStringVar(Potion_StringVar))
end)

Server.GetTopic('자동물약마나').Add(function(BOOL)
	local T = Utility.JSONParse(unit.GetStringVar(Potion_StringVar))
	T[2] = BOOL
	unit.SetStringVar(Potion_StringVar, Utility.JSONSerialize(T))
	unit.FireEvent('데이터업데이트', unit.GetStringVar(Potion_StringVar))
end)

Server.GetTopic('자동물약마나퍼센트').Add(function(num)
	local T = Utility.JSONParse(unit.GetStringVar(Potion_StringVar))
	T[4] = num
	unit.SetStringVar(Potion_StringVar, Utility.JSONSerialize(T))
	unit.FireEvent('데이터업데이트', unit.GetStringVar(Potion_StringVar))
end)

Server.GetTopic('자동물약마나선택').Add(function(num)
	local T = Utility.JSONParse(unit.GetStringVar(Potion_StringVar))
	T[6] = num
	unit.SetStringVar(Potion_StringVar, Utility.JSONSerialize(T))
	unit.FireEvent('데이터업데이트', unit.GetStringVar(Potion_StringVar))
end)

Server.GetTopic('자동물약데이터가져와').Add(function()
	if unit.GetStringVar(Potion_StringVar) == '' or unit.GetStringVar(Potion_StringVar) == nil then
		unit.SetStringVar(Potion_StringVar, txt)
	end
	
	unit.FireEvent('데이터옜다', unit.GetStringVar(Potion_StringVar))
end)

Server.GetTopic('자물').Add(function()
	unit.FireEvent('자동물약', unit.GetStringVar(Potion_StringVar))
end)