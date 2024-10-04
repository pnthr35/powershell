# Interaction with Intune
Connect-MgGraph "DeviceManagementManagedDevices.Read.All"

# -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)

$devices = Get-MgDeviceManagementManagedDevice -all:$true
Write-Output $devices