Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module oh-my-posh
Install-Script -Name VmDeleteHistory
Install-Module VMware.PowerCLI
Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false
