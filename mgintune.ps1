# Connect
Connect-MgGraph "DeviceManagementManagedDevices.Read.All"

# Use an access token if needed, generally just use delegated access for labbing
# -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)

$devices = Get-MgDeviceManagementManagedDevice -all:$true

foreach ($device in $devices)
{
    # Get Device information, the most important information is detailed here
    # TODO: Organize and possibly export to a file?
    Write-Host "Device Name:" $device.DeviceName 
    Write-Host "Device ID:" $device.Id
    Write-Host "Compliance State:" $device.ComplianceState 
    Write-Host "Enrollment Type:" $device.DeviceEnrollmentType
    Write-Host "Device Registration State:" $device.DeviceRegistrationState
    Write-Host "User Display Name:" $device.UserDisplayName
}