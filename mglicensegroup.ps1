Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All", "Group.ReadWrite.All"

$groups = Get-MgGroup
$PowerAutomateLicense = Get-MgSubscribedSku -All | Where-Object SkuPartNumber -eq 'FLOW_FREE'

# Check if Group exists
foreach ($item in $Groups)
{
    if ($item.DisplayName -eq "Testing Group")
    {
        Write-Host "Group already exists..."
        Write-Host $item.DisplayName
    }

}

# Set-MgGroupLicense -GroupId $groupId -AddLicenses $PowerAutomateLicense
Write-Host "Done!"