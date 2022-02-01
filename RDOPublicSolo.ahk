; Original source for network disable and PublicSolo by reddit.com/u/CRlME (https://www.reddit.com/r/gtaglitches/comments/fycrzs/psapc_you_can_pull_your_ethernet_cable_with_a/)
; Original source for lucky wheel by reddit.com/u/Efeler_Gibi (https://www.reddit.com/r/gtaglitches/comments/gweo51/psa_i_wrote_a_very_simple_autohotkey_script_for/)
; Always run this as administrator!
; PreRequisits for lucky wheel
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
SetWorkingDir %A_ScriptDir%

; Define the network adapter name
; To find out the name use "netsh interface ipv4 show config" in cmd
IniRead, network_adapter_name, RDOPublicSolo.ini, RDOPublicSoloConfig, network_adapter_name , "Ethernet"

; Key-shortcut (Ctrl+F11) to block RDR2 from accessing the internet for 25 sec
; This is to come back online
^f11::
	IniRead, timeout_F11, RDOPublicSolo.ini, RDOPublicSoloConfig, timeout_F11 , "15000"
	; Set network adapter to off
	run, *runas %comspec% /c netsh interface set interface name="%network_adapter_name%" admin=disabled,,hide 
	; Show the tooltip to inform user
	Tooltip [F11] Network adapter (%network_adapter_name%) is now disabled for %timeout_F11% millisec..., 10, 20
	; Wait 20 sec
	DllCall("Sleep",UInt,timeout_F11)
	Tooltip
	; Set network adapter to on
	run, *runas %comspec% /c netsh interface set interface name="%network_adapter_name%" admin=enabled,,hide
	return

; Key-shortcut (Ctrl+F12) to automatically block, wait 10sec and then allow RDR from accessing the internet
; This is for public solo mission
^f12::
	IniRead, timeout_F12, RDOPublicSolo.ini, RDOPublicSoloConfig, timeout_F12 , "10000"
	; Explicitly add a new rule to block incoming traffic to RDR2.exe
	run, *runas %comspec% /c netsh advfirewall firewall add rule name="RDR2BlockButton" dir=in action=block profile=any protocol=UDP localport=6672",, hide, npPid
	; Explicitly add a new rule to block outgoing traffic to RDR2.exe
	run, *runas %comspec% /c netsh advfirewall firewall add rule name="RDR2BlockButton" dir=out action=block profile=any protocol=UDP localport=6672",, hide, npPid
	; Show the tooltip to inform user
	Tooltip [F12] Blocking RDR2 (%rdr2_path%\RDR2.exe) for %timeout_F12% millisec..., 10, 20
	; Wait 10 sec
	DllCall("Sleep",UInt,timeout_F12)
	Tooltip
	; Delete the created rule
	run, *runas %comspec% /c netsh advfirewall firewall delete rule name="RDR2BlockButton",, hide, npPid
	return