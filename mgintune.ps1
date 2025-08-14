# Connect with only Read permissions
Connect-MgGraph "DeviceManagementManagedDevices.Read.All"

# Use an access token if needed, generally just use delegated access for labbing
# -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)

$complianceCheckReport = [System.Collections.Generic.List[Object]]::new()
$devices = Get-MgDeviceManagementManagedDevice -all:$true

foreach ($device in $devices)
{
    $reportItem = [PSCustomObject]@{
        User = $device.UserDisplayName
        deviceName = $device.DeviceName
        complianceState = $device.ComplianceState
    }

    $complianceCheckReport.Add($reportItem)

    # Get Device information, the most important information is detailed here
    # TODO: Organize information and write to CSV? Possibly SQL for display on internal website?
    <#
    Write-Host "Device Name:" $device.DeviceName 
    Write-Host "Device ID:" $device.Id
    Write-Host "Compliance State:" $device.ComplianceState 
    Write-Host "Enrollment Type:" $device.DeviceEnrollmentType
    Write-Host "Device Registration State:" $device.DeviceRegistrationState
    Write-Host "User Display Name:" $device.UserDisplayName
    Write-Host "Operating System and Version:" $device.OperatingSystem $device.OSVersion
    Write-Host "User Email:" $device.EmailAddress
    Write-Host "Enroll Date:" $device.EnrolledDateTime
    Write-Host "Last Sync" $device.LastSyncDateTime
    Write-Host ""
    #>
}

$complianceCheckReport | Format-Table User, deviceName, complianceState