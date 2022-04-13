------------------------------------------------------------

local TitleVar = 31 -- 칭호 변수 변호입니다.
local TitleColor = 32
local NameVar = 30 -- 닉네임 색상 변수 변호입니다.

local LvColor = "<color=#FF5E00>"

local LvView = false -- 레벨 표기 설정입니다.

------------------------------------------------------------

function TitleSet(text, color)
	unit.SetStringVar(TitleVar, text)
	unit.SetStringVar(TitleColor, "<color=#"..color..">")

	if (LvView == true) then
		unit.name = unit.GetStringVar(TitleColor)..unit.GetStringVar(TitleVar).."</color>"..LvColor.."Lv."..unit.level.." </color>"..AddFamilyname..unit.GetStringVar(NameVar)..unit.player.name.."</color>"
	else
		unit.name = unit.GetStringVar(TitleColor)..unit.GetStringVar(TitleVar).."</color>"..AddFamilyname()..unit.GetStringVar(NameVar)..unit.player.name.."</color>"
	end
	
	unit.SendUpdated()
end

function TitleDel()
	unit.SetStringVar(TitleVar, "Nil")
	if (LvView == true) then
		unit.name = LvColor.."Lv."..unit.level.." </color>"..AddFamilyname()..unit.GetStringVar(NameVar)..unit.player.name.."</color>"
	else
		unit.name = AddFamilyname()..unit.player.name
	end
	
	unit.SendUpdated()
end

function NameSet(text)
	unit.SetStringVar(NameVar, "<color=#"..text..">")
	TitleRefresh()
end

function TitleRefresh()
	if (unit.GetVar(NameVar) == 0) then
		unit.SetVar(NameVar, 1)
		unit.SetVar(TitleColor, 1)
		unit.SetStringVar(NameVar, "<color=#FFFFFF>")
		unit.SetStringVar(TitleColor, "<color=#FF5000>")
	end
	if (unit.GetStringVar(TitleVar) == "Nil") then
		if (LvView == true) then
			unit.name = LvColor.."Lv."..unit.level.." </color>"..AddFamilyname()..unit.GetStringVar(NameVar)..unit.player.name.."</color>"
		else
			unit.name = AddFamilyname()..unit.player.name
		end
	else
		if (LvView == true) then
			unit.name = unit.GetStringVar(TitleColor)..unit.GetStringVar(TitleVar).."</color>"..LvColor.."Lv."..unit.level.." </color>"..AddFamilyname()..unit.GetStringVar(NameVar)..unit.player.name.."</color>"
		else
			unit.name = unit.GetStringVar(TitleColor)..unit.GetStringVar(TitleVar).."</color>"..AddFamilyname()..unit.GetStringVar(NameVar)..unit.player.name.."</color>"
		end
		
		unit.SendUpdated()
	end
end

function onUnitLevelUp(target, level)
	if (target.GetStringVar(TitleVar) == "Nil") then
		if (LvView == true) then
			target.name = LvColor.."Lv."..target.level.." </color>"..AddFamilyname()..target.GetStringVar(NameVar)..target.player.name.."</color>"
		else
			target.name = AddFamilyname()..target.player.name
		end
	else
		if (LvView == true) then
			target.name = target.GetStringVar(TitleColor)..LvColor.."Lv."..target.level.." </color>"..AddFamilyname()..target.GetStringVar(NameVar)..target.player.name.."</color>"..target.GetStringVar(TitleVar).."</color>"
		else
			target.name = target.GetStringVar(TitleColor)..AddFamilyname()..target.GetStringVar(NameVar)..target.player.name.."</color>"..target.GetStringVar(TitleVar).."</color>"
		end
	
		target.SendUpdated()
	end
end

Server.onUnitLevelUp.Add(onUnitLevelUp)

function AddFamilyname()
	if unit.GetStringVar(500) ~= nil and unit.GetStringVar(500) ~= '' then
		local familyname = unit.GetStringVar(500)
		return "["..familyname.."]"
	else
		return ''
	end
end