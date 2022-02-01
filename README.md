# RDOPublicSolo
AHK Script to quickly create a Red Dead Online Public Solo Session and turn off/on a network adapter

## What you'll need:
1. Windows Firewall enabled (https://support.microsoft.com/en-us/help/4028544/windows-10-turn-microsoft-defender-firewall-on-or-off)
2. AutoHotKey from https://www.autohotkey.com/ (The version doesn't matter)
3. Administrator rights
4. Network adapter name to be disabled (use "netsh interface ipv4 show config" to find out which one)

## How it works:
1. Download the .zip file from the repo (https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/panzerschrekk/RDOPublicSolo)
3. Extract to .zip file anywhere
4. Insert your network adapter name in the RDOPublicSolo.ini file
5. Right click the .exe file -> Run as administrator
6. Start Red Dead Online
7. As soon as you're in a public session (you see your character) press either:

    7a. **Ctrl+F12** to automatically block, wait 10sec and then allow Red Dead Redemption from accessing the internet (e.g. public solo session)
    
    7b. **Ctrl+F11** to disable the network adapter, wait 25sec and then enable the network adapter (e.g. you are under attack while delivering)
    
## What the script does:
Adds a temporary Windows firewall rule to block UDP-Port 6672 from accessing the internet

Turns off the network adapter completely


## Compability
### Tested
- Windows 10
- Steam Version of RDO
- Rockstar Games Version of RDO

### Not tested, but probably works
- Windows 8.1, 8.0 and 7
- Epic Games Version of RDO

### Doesn't work
- Windows XP

### Credits
Original source for network disable and PublicSolo by reddit.com/u/CRlME (https://www.reddit.com/r/gtaglitches/comments/fycrzs/psapc_you_can_pull_your_ethernet_cable_with_a/)

Original source for lucky wheel by reddit.com/u/Efeler_Gibi (https://www.reddit.com/r/gtaglitches/comments/gweo51/psa_i_wrote_a_very_simple_autohotkey_script_for/)

Port information from CodeSwine (https://github.com/CodeSwine/GTA5Online-Private_Public_Lobby)
