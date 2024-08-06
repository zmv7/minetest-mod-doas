# minetest-mod-doas
Mod that provides execution commands as other player  
[![ContentDB](https://content.minetest.net/packages/Zemtzov7/doas/shields/downloads/)](https://content.minetest.net/packages/Zemtzov7/doas/)
### Usage
* `/doas <playername> <command> [params]`
* `/doas @all <command> [params]` - execute command as all online players
* This command requires `doas` privilege, which granged automatically to singleplayer or host account
* Warning! `doas` is bypassing privileges(except grant,revoke), e.g. `/doas UnprivilegedSam giveme adminpick` will work(if player online). 
