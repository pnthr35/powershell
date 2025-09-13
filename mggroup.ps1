# Connect-MgGraph -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)
Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All", "Group.ReadWrite.All"

$Groups = Get-MgGroup
$groupExists = $false

# See if a Group exists, in this case GroupTestGraph
foreach ($group in $groups) {
    Write-Host $group.DisplayName
    if ($group.DisplayName -eq "GroupScriptTestGraph") {
        $groupExists = $true
    }
}

if ($groupExists) {
    Write-Host "Group exists, deleting the Group!"
    $group = Get-MgGroup -Filter "DisplayName eq 'GroupScriptTestGraph'"
    Write-Host $group.Id

    # In case multiple Id's exist, you can use an index? Check on this
    # If there is only one Group though, this will fail since no array, a check on the data type maybe?
    Remove-MgGroup -GroupId $group.Id

} else {
    # If group does not exist, we will create it
    Write-Host "Group does not exist, creating the group!"
    New-MgGroup -DisplayName 'GroupScriptTestGraph' -MailEnabled:$False -MailNickName 'grouptestgraph' -SecurityEnabled  
}

# Todo
# Organize results into an Object List
# Write all Groups to a .csv file?