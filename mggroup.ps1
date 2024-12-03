# Testing Group interactions with Graph Powershell
# Connect-MgGraph -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)
Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All", "Group.ReadWrite.All"

$Groups = Get-MgGroup

# See if a Group exists
foreach ($group in $groups)
{
    Write-Host $group.DisplayName
    if ($group.DisplayName -eq "GroupTestGraph")
    {
        Write-Host "Group exists"
        $groupExists = $true
    }
}

if (!$groupExists)
{
    New-MgGroup -DisplayName 'GroupTestGraph' -MailEnabled:$False -MailNickName 'grouptestgraph' -SecurityEnabled   
}

# Write all Groups to a .csv file