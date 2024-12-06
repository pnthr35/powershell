# Testing Group interactions with Graph Powershell
# Connect-MgGraph -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)
Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All", "Group.ReadWrite.All"

$Groups = Get-MgGroup

# See if a Group exists
foreach ($group in $groups) {
    Write-Host $group
    Write-Host $group.DisplayName
    if ($group.DisplayName -eq "GroupTestGraph") {
        $groupExists = $true
    }
}

if (!$groupExists) {
    New-MgGroup -DisplayName 'GroupTestGraph' -MailEnabled:$False -MailNickName 'grouptestgraph' -SecurityEnabled   
}
else {
    Write-Host "reached else"
    $group = Get-MgGroup -Filter "DisplayName eq 'GroupTestGraph'"
    Write-Host $group.DisplayName
    #Remove-MgGroup -GroupId $group.Id
}

# Write all Groups to a .csv file