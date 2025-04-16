# Connect
Connect-MgGraph -Scopes "Directory.Read.All", "User.Read.All", "Group.Read.All"

# Get all directory roles
$Roles = Get-MgRoleManagementDirectoryRoleDefinition

Write-Host "Found $($Roles.Count) directory roles"

# Initialize array for role assignments
$RoleAssignments = [System.Collections.Generic.List[PSCustomObject]]::new()

# Process each role
foreach ($Role in $Roles) {
    # Get assignments for current role
    $Assignments = Get-MgRoleManagementDirectoryRoleAssignment -Filter "roleDefinitionId eq '$($Role.Id)'" -ErrorAction Stop

    foreach ($Assignment in $Assignments) {
        # Get user info
        $User = Get-MgUser -UserId $Assignment.PrincipalId -ErrorAction SilentlyContinue

        If($User) {
            $RoleAssignments.Add([PSCustomObject]@{
                RoleName = $Role.DisplayName
                RoleDescription = $Role.Description
                UserDisplayName = $User.DisplayName
                UserPrincipalName = $User.UserPrincipalName
                AssignmentId = $Assignment.Id
                AssignmentCreatedDateTime = $Assignment.CreatedDateTime
            })
        }
    }
}

# Export results
$ReportPath = ".\RoleAssignments_$(Get-Date -Format 'yyyy-MM-dd').csv"

$RoleAssignments | Export-Csv -Path $ReportPath -NoTypeInformation

Write-Output "Report exported to: $ReportPath"