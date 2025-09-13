# Getting last sign in time

# This connection should run with delegated access
Connect-MgGraph

# Use with MgGraph and grab a token if needed on the current system
# -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)

$Users = Get-MgUser -Property Id, DisplayName, SignInActivity

# Output Users
Write-Host $UserLookup
foreach ($User in $Users) {
    # Find better way to format (Todo)
    # Implement a conditional to exclude some Users like the Sync Accounts
    $User | Format-Table Id, DisplayName, @{label="Last Sign In";Expression={$User.SignInActivity.LastNonInteractiveSignInDateTime}}
}
Write-Host "Done!"