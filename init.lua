core.register_privilege("doas","Allows to run commands as any player")
core.register_chatcommand("doas", {
    description = "Run command as any player. Warning, its priv-bypassing",
    privs = {doas=true},
    params = "<playername> <command> [params]",
    func = function(name,param)
        local nick, cmd, par = param:match("^(%S+)%s(%S+)%s?(.*)$")
        if not nick then return false, "Invalid parameters" end
        local vcmd = core.chatcommands[cmd]
        if vcmd then
            vcmd.func(nick,par)
            return true, "Executed '/"..cmd.." "..par.."' as "..nick
        else
			return false, "Invalid command"
		end
end})
