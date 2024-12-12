# Testing Group interactions with Graph Powershell
# Connect-MgGraph -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)
Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All", "Group.ReadWrite.All"

$Groups = Get-MgGroup
$groupExists = $false

# See if a Group exists
foreach ($group in $groups) {
    Write-Host $group.DisplayName
    if ($group.DisplayName -eq "GroupTestGraph") {
        $groupExists = $true
    }
}

Write-Host $groupExists

if ($groupExists) {
    Write-Host "Group exists, deleting the Group!"
    $group = Get-MgGroup -Filter "DisplayName eq 'GroupTestGraph'"
    #Write-Host $group.DisplayName
    Remove-MgGroup -GroupId $group.Id
} else {
    Write-Host "Group does not exist, creating the Group!"
    New-MgGroup -DisplayName 'GroupTestGraph' -MailEnabled:$False -MailNickName 'grouptestgraph' -SecurityEnabled  
}

# Write all Groups to a .csv file