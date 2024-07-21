# Testing User interactions in Graph Powershell
$UserLookup = @{}
[array]$Users = Get-MgUser -All -Filter "usertype eq 'Member'" -Property Id, DisplayName

foreach ($User in $Users) {
    $UserLookup.Add($User.Id, $User.DisplayName)
}