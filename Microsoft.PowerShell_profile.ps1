function lastErrorTypef {$error[0].Exception.GetType().FullName}
Set-Alias lastErrorType lastErrorTypef
Set-Alias cvis Connect-VIServer
function dvisf {Disconnect-VIServer * -cf:$false}
Set-Alias dvis dvisf
function gvisf {$global:DefaultVIServers}
Set-Alias gvis gvisf
function consolidationf {(Get-View -ViewType VirtualMachine -Property Name, Runtime.ConsolidationNeeded | ?{$_.Runtime.ConsolidationNeeded}).Count}
Set-Alias consolidation consolidationf
function sessiondumpf {(Get-View SessionManager).SessionList | Select Key, UserName, FullName, LoginTime, LastActiveTime, IpAddress, CallCount | Sort-Object UserName, IpAddress, LoginTime | epcsv -NoType "session-list_$($global:defaultVIServer.Name)_$(Get-Date -F FileDateTime).csv"}
Set-Alias sessiondump sessiondumpf
function esxi-ssh-disablef {Get-VMHost | %{$ssh = $($_ | Get-VMHostService | ?{$_.Key -eq "TSM-SSH"});if($ssh.Running){Write-Host "Disabling SSH on $($_.Name)"; $ssh | Stop-VMHostService -cf:$false | Out-Null}}}
Set-Alias esxi-ssh-disable esxi-ssh-disablef

cd /Users/khord/repos/simspace/VMware-Automation
