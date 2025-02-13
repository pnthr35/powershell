# Testing User interactions in Graph Powershell

# This connection should run with delegated access
Connect-MgGraph

# Use with MgGraph and grab a token if needed on the current system
# -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)

# Get Users
$UserLookup = @{}
[array]$Users = Get-MgUser -All -Filter "usertype eq 'Member'" -Property Id, DisplayName

foreach ($User in $Users) {
    $UserLookup.Add($User.Id, $User.DisplayName)
}

# Output Users
Write-Host $UserLookup
foreach ($User in $Users) {
    # Find better way to format (todo)
    $User.DisplayName + "`t`t`t" + $User.Department
}
Write-Host "Done!"