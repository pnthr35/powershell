# Interaction with Intune
Connect-MgGraph "DeviceManagementManagedDevices.Read.All"

# -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)

$devices = Get-MgDeviceManagementManagedDevice -all:$true
foreach ($device in $devices)
{
    # Get Device information
    Write-Host $device.DeviceName $device.Id $device.ComplianceState 
}