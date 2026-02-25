# Quickly get users for a specific Role

[CmdletBinding()]
Param(
	[Parameter(Mandatory = $true,
		ValueFromPipeline = $true,
		ValueFromPipelineByPropertyName = $true,
		HelpMessage = "Enter one or multiple UPN's")]	
	[String[]]$Users
)

Connect-MgGraph -Scopes "Directory.Read.All", "User.Read.All", "Group.Read.All"