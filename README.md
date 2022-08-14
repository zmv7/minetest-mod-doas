# minetest-mod-doas
Mod that provides execution commands as other player
### Usage
* `/doas <playername> <command> [params]`
* This command requires `doas` privilege, which granged automatically to singleplayer or host account
* Warning! `doas` is bypassing privileges(except grant,revoke), e.g. `/doas UnprivilegedSam giveme adminpick` will work(if player online). 
