showPosDB={}

-- 아래 설정을 이용하세요.
showPosDB.loopTime=0.5	--텍스트 갱신 주기(초단위)
showPosDB.posX = nil	--텍스트 X좌표. nil일경우 X 좌측기준 30에 출력
showPosDB.posY = nil	--텍스트 Y좌표. nil일경우 Y 하단기준 35에 출력
showPosDB.textSize = 14	--텍스트 크기. nil일경우 사이즈 14
showPosDB.color = nil	--텍스트 컬러 설정. nil일경우 흰색. 아래 주석과 같이 설정하세요.
			--showPosDB.color = Color(20,200,200)



--**
function PosObj(x,y,size,color)
	local self = {}
	self.x = x == nil and 10 or x
	self.y = y == nil and Client.height-65 or y
	self.size = size == nil and 14 or size
	self.color = color==nil and Color(7,233,12) or color

	self.textSh = Text("",Rect(self.x+1,self.y+1, 200, 32))
	self.textSh.textSize = self.size
	self.textSh.color = Color(30,30,30)	

	self.text = Text("",Rect(self.x,self.y, 200, 32))
	self.text.textSize = self.size
	self.text.color = self.color 	

	function self:setText(str)
		self.text.text = str
		self.textSh.text = str
	end
	
	return self
end
_postCount = 0
function _ShowUnitPos(t)
_postCount = _postCount+t
    if(_postCount>=showPosDB.loopTime) then
	if(unitPos == nil) then
		unitPos = PosObj(showPosDB.posX,showPosDB.posY,showPosDB.textSize,showPosDB.color)
	else
		Client.FireEvent("getMapName")
	end
	_postCount = 0
    end
end

Client.GetTopic("getMapName").add(function(name)
	if(unitPos ~= nil) then
		local str = name.." ["..math.floor(Client.myPlayerUnit.x/32).."/"..math.floor(Client.myPlayerUnit.y/-32).."]"
		unitPos:setText(str)
	end
end)

Client.onTick.Add(_ShowUnitPos)
