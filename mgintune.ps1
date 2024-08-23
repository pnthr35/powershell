# Interaction with Intune
Connect-MgGraph -AccessToken ($Env:token | ConvertTo-SecureString -AsPlainText -Force)
