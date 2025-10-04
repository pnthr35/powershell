# Quickly get users for a specific Role
Connect-MgGraph -Scopes "Directory.Read.All", "User.Read.All", "Group.Read.All"

# Todo: Revise to get Role from command input
# Eg. Get-OcyMgRole -Role "User Administrator", "Global Administrator"
$Roles = Get-MgRoleManagementDirectoryRoleDefinition
Write-Host "Found $($Roles.Count) directory roles"

# Initialize list for User Role Assignments
$UserRoleAssignments = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach ($Role in $Roles) {
    $Assignments = Get-MgRoleManagementDirectoryRoleAssignment -Filter "roleDefinitionId eq '$($Role.Id)'" -ErrorAction Stop

    foreach ($Assignment in $Assignments) {
        # Get user info
        $User = Get-MgUser -UserId $Assignment.PrincipalId -ErrorAction SilentlyContinue

        If($User) {
            $UserRoleAssignments.Add([PSCustomObject]@{
                RoleName = $Role.DisplayName
                UserPrincipalName = $User.UserPrincipalName
                UserDisplayName = $User.DisplayName
            })
        }
    }
}

$UserRoleAssignments | Format-Table *

<#
// Older Script
[array]$Roles = Get-MgDirectoryRole | Sort-Object displayName

ForEach ($Role in $Roles) {
    [array]$RoleMembers = Get-MgDirectoryRoleMember -DirectoryRoleId $Role.Id
        If ($RoleMembers) {
            Write-Host ("Members of the {0} directory role:" -f $Role.displayName)
            $RoleMembers.additionalProperties.displayName
        }
}

 Write-Host "End of processing..."
#>