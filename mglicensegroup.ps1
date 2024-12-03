Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All", "Group.ReadWrite.All"

$groups = Get-MgGroup
$targetGroup = ""
$PowerAutomateLicense = Get-MgSubscribedSku -All | Where-Object SkuPartNumber -eq 'FLOW_FREE'

# Check if Group exists
foreach ($item in $Groups)
{
    if ($item.DisplayName -eq "Test Group")
    {
        Write-Host "Group already exists..."
        $targetGroup = $item.Id
    }
}

# Add a License to a Group
Set-MgGroupLicense -GroupId $targetGroup -AddLicenses @{SkuId = $PowerAutomateLicense.SkuId } -RemoveLicenses @()

# Remove a License from a Group
# Set-MgGroupLicense -GroupId $targetGroup -RemoveLicenses @($PowerAutomateLicense.SkuId) -AddLicenses @{}
Write-Host "Done!"