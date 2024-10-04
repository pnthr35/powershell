# Interaction with Intune
Connect-MgGraph "DeviceManagementManagedDevices.Read.All"

# -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)

$devices = Get-MgDeviceManagementManagedDevice
$devices | ForEach-Object {
    Write-Output $_.DisplayName
}