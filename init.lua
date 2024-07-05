core.register_privilege("doas","Allows to run commands as any player")
core.register_chatcommand("doas", {
  description = "Run command as any player. Warning, it's priv-bypassing",
  privs = {doas=true},
  params = "[<playername>|<@all>|<@random>] <command> [params]",
  func = function(name,param)
	local nick, cmd, par = param:match("^(%S+)%s(%S+)%s?(.*)$")
	if not (nick and cmd and par) then return false, "Invalid parameters" end
	local vcmd = core.chatcommands[cmd]
	if vcmd then
		if nick == "@all" or nick == "@everyone" then
			for _,player in ipairs(core.get_connected_players()) do
				local pname = player and player:get_player_name()
				if pname then
					vcmd.func(pname,par)
				end
			end
			return true, "Executed '/"..cmd.." "..par.."' as all online players"
		elseif nick == "@random" then
			local players = core.get_connected_players()
			local player = players[math.random(1,#players)]
			local pname = player and player:get_player_name()
			if pname then
				vcmd.func(pname, par)
			end
			return true, "Executed '/"..cmd.." "..par.."' as "..pname
		end
		vcmd.func(nick,par)
		return true, "Executed '/"..cmd.." "..par.."' as "..nick
	else
		return false, "Invalid command"
	end
end})
