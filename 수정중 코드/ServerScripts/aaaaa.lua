Server.GetTopic("addLog").Add(function(text)
unit.FireEvent("addLog", "text")
end
)

Server.rewardCallback = function(me, monster,damage)
 me.FireEvent("addLog", "경험치 획득 +"..monster.monsterData.dropEXP.." EXP")
end

Server.onAddItem.Add(function(unit,titem,count))
 unit.FireEvent("addLog", Server.GetItem(titem.dataID).name.." 획득")
end)

Server.rewardCallback = function(me,mob,dmg)
if me.GetSingleSummonedPet() ~= nil then
me.GetSingleSummonedPet().AddEXP(mob.dropEXP)
end
end