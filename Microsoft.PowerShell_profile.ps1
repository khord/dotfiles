Set-Alias cvis Connect-VIServer
function dvisf {Disconnect-VIServer * -cf:$false}
Set-Alias dvis dvisf
function gvisf {$global:DefaultVIServers}
Set-Alias gvis gvisf
cd /Users/khord/repos/simspace/VMware-Automation
