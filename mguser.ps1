# Testing User interactions in Graph Powershell

# This connection should run with delegated access
Connect-MgGraph

# Use with MgGraph and grab a token if needed on the current system
# -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)

$UserLookup = @{}
[array]$Users = Get-MgUser -All -Filter "usertype eq 'Member'" -Property Id, DisplayName

# Get Users
foreach ($User in $Users) {
    $UserLookup.Add($User.Id, $User.DisplayName)
}

# Output Users
Write-Host $UserLookup
Write-Host "All Users:"
foreach ($User in $Users) {
    $User.DisplayName + "`n" + $User.Id
}
Write-Host "Done!"