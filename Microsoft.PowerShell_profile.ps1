Set-PoshPrompt -Theme ~/dotfiles/.pwsh_p10k_lean.omp.json

# aliases and functions
function lastErrorTypef {$error[0].Exception.GetType().FullName}
Set-Alias lastErrorType lastErrorTypef
function cvisf([string]$server) {Connect-VIServer -Credential $ad_cred -Server $server}
Set-Alias cvis cvisf
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

# script sourcing
Import-Module /Users/khord/repos/vmware/PowerCLI-Example-Scripts/Modules/VMware.vSphere.SsoAdmin/VMware.vSphere.SsoAdmin.psd1
. /Users/khord/.local/share/powershell/Scripts/VmDeleteHistory.ps1
cd /Users/khord/repos/simspace/VMware-Automation

# 1password credential fetching
zsh -c 'eval $(op signin --account simspace.1password.com)'
$ad_user = (op item get AD --fields username)
$ad_pass = (op item get AD --fields password) | ConvertTo-SecureString -AsPlainText -Force
$ad_cred = Get-Credential $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ad_user, $ad_pass)
