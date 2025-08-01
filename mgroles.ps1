# Get and display a Role report
Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All", "Group.ReadWrite.All"

[array]$Roles = Get-MgDirectoryRole | Sort-Object displayName

ForEach ($Role in $Roles) {
    [array]$RoleMembers = Get-MgDirectoryRoleMember -DirectoryRoleId $Role.Id
        If ($RoleMembers) {
            Write-Host ("Members of the {0} directory role:" -f $Role.displayName)
            $RoleMembers.additionalProperties.displayName
        }
}

 Write-Host "End of processing..."