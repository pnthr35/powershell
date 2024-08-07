# Testing User interactions in Graph Powershell
Connect-MgGraph -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)
$UserLookup = @{}
[array]$Users = Get-MgUser -All -Filter "usertype eq 'Member'" -Property Id, DisplayName

foreach ($User in $Users) {
    $UserLookup.Add($User.Id, $User.DisplayName)
}

Write-Host $UserLookup
Write-Host "All Users:"
foreach ($User in $Users) {
    $User.DisplayName + $User.Id
}
Write-Host "Done!"