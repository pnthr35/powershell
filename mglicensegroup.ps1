Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All", "Group.ReadWrite.All"

$Groups = Get-MgGroup
$PowerAutomateLicense = Get-MgSubscribedSku -All | Where-Object SkuPartNumber -eq 'FLOW_FREE'

foreach ($item in $Groups)
{
    if ($item.DisplayName -eq "Testing Group")
    {
        Write-Host "Group already exists..."
    }
}

Write-Host "Done!"