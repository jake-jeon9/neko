 --채팅내용에 /이 있을경우 제거된후 저장됩니다 /이 있는 상태로 json하면 오류가 나기때문에 삭제합니다.
--월드변수 번호입니다.
woldidd =500


--관리자를 늘리시려면 이런식으로 작성하세요.
--admin={"TEST_1","TEST_2","TEST_3"}

--실행하려면 관리자 아이디로 /채팅보기를 입력하세요.

admin={"톱이","알런"}

function onSay(unit, text3)



local text= text3
text= text:gsub("/", "")



if Server.GetWorldStringVar(woldidd)==nil then

asfw={name={},msg={}}
local cataunttl= Utility.JSONSerialize(asfw)
Server.SetWorldStringVar(woldidd,cataunttl)

end

if #Server.GetWorldStringVar(woldidd) > 65335 then

Server.SetWorldStringVar(woldidd,nil)


end


local nakosd= Utility.JSONParse(Server.GetWorldStringVar(woldidd)) 

local serverwold=#nakosd.name+1
print(serverwold)

local text2= unit.player.name
text22= text2:gsub("/", "")

nakosd.name[serverwold]=text22
nakosd.msg[serverwold]=text


local cataunttl= Utility.JSONSerialize(nakosd)



Server.SetWorldStringVar(woldidd,cataunttl)

              for i in ipairs(admin) do
              if unit.player.name==admin[i] then
                if text3=="/로그" then
                  local kfns=Server.GetWorldStringVar(woldidd)
                  print(kfns)
                  unit.FireEvent("sarpp",Server.GetWorldStringVar(woldidd))

                print('확인')
                end
               end
	  end




end
Server.onSay.Add(onSay)
