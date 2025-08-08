Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All", "Group.ReadWrite.All"

# Current workaround for assigning licenses...
$users = Get-MgUser
$PowerAutomateLicense = Get-MgSubscribedSku -All | Where-Object SkuPartNumber -eq 'FLOW_FREE'

# License details here
$licenses = @{
    addLicenses = @(@{SkuId = $PowerAutomateLicense.SkuId})
    # addLicenses    = @{}
    # removeLicenses = @($PowerAutomateLicense.SkuId)
    removeLicenses = @()
}

Write-Host $users[0].DisplayName
Get-MgUserLicenseDetail -UserId $users[0].Id
Set-MgUserLicense -UserId $users[0].Id -BodyParameter $licenses

# Remember that User in Restricted AU's will not be affected, must use the AU Admin for this script

<#
foreach ($user in $users) {
    Write-Host $user.DisplayName
    
    # Skip all AD-synchronized accounts
    if ($user.DisplayName -eq "On-Premises Directory Synchronization Service Account")
    {
        Write-Host "Skipping AD Sync Account" -ForegroundColor red
        continue
    } 

    # Assign licenses to Power Automate Free, set Usage Location if needed first as well
    # Update-MgUser -UserId $item.Id -UsageLocation US
    Set-MgUserLicense -UserId $user.Id -AddLicenses @{SkuId = $PowerAutomateLicense.SkuId } -RemoveLicenses @()

    # Remove licenses for Power Automate Free
    # Set-MgUserLicense -UserId $item.Id -RemoveLicenses @($PowerAutomateLicense.SkuId) -AddLicenses @{}

    Get-MgUserLicenseDetail -UserId $user.Id | Format-List
}
#>
