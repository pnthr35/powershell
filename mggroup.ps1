# Testing Group interactions with Graph Powershell
# Connect-MgGraph -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)
Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All", "Group.ReadWrite.All"

$Groups = Get-MgGroup
Write-Host $Groups

# See if a Group exists

# If not, create the Group

# Write all Groups to a .csv file