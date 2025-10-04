# TODO: Get quick sign in activities of specified User or Users...

Connect-MgGraph -Scopes "Directory.Read.All"

# Get-MgUser -UserId [UserId] -Property SignInActivity | Select-Object -ExpandProperty SignInActivity