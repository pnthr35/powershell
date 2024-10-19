Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All", "Group.ReadWrite.All"

$Users = Get-MgUser
$PowerAutomateLicense = Get-MgSubscribedSku -All | Where-Object SkuPartNumber -eq 'FLOW_FREE'

# Remember that User in Restricted AU's will not be affected, must use the AU Admin for this script
foreach ($item in $Users) {
    Write-Host $item.DisplayName

    # Assign licenses to Power Automate Free
    Update-MgUser -UserId $item.Id -UsageLocation US
    Set-MgUserLicense -UserId $item.Id -AddLicenses @{SkuId = $PowerAutomateLicense.SkuId } -RemoveLicenses @()

    # Remove licenses for Power Automate Free???
    # Set-MgUserLicense -UserId $item.Id -RemoveLicenses @($PowerAutomateLicense.SkuId) -AddLicenses @{}

    Get-MgUserLicenseDetail -UserId $item.Id | Format-List
}
