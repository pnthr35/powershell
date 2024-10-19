Connect-MgGraph

$Users = Get-MgUser

foreach ($item in $Users) {
   Write-Host $item.DisplayName
   Get-MgUserLicenseDetail -UserId $item.Id | Format-List
}
