# Connect
Connect-MgGraph "DeviceManagementManagedDevices.Read.All"

# Use an access token if needed, generally just use delegated access for labbing
# -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)

$devices = Get-MgDeviceManagementManagedDevice -all:$true

foreach ($device in $devices)
{
    # Get Device information, the most important information is detailed here
    # TODO: Organize and possibly export to a file?
    Write-Host $device.DeviceName $device.Id $device.ComplianceState $device.DeviceEnrollmentType $device.DeviceRegistrationState $device.UserDisplayName
}