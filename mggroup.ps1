# Testing Group interactions with Graph Powershell
Connect-MgGraph -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)

$Groups = Get-MgGroup
Write-Host $Groups