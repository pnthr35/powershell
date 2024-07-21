# Testing User interactions in Graph Powershell
Connect-MgGraph -Scopes "Directory.ReadWrite.All","User.ReadWrite.All"
$UserLookup = @{}
[array]$Users = Get-MgUser -All -Filter "usertype eq 'Member'" -Property Id, DisplayName

foreach ($User in $Users) {
    $UserLookup.Add($User.Id, $User.DisplayName)
}

Write-Host $UserLookup
Write-Host "Done!"