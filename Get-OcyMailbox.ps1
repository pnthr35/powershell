# TODO: Get Mailbox Stats
[CmdletBinding()]
Param(
	[Parameter(Mandatory = $true,
		ValueFromPipeline = $true,
		ValueFromPipelineByPropertyName = $true,
		HelpMessage = "Enter one or multiple UPN's")]	
	[String[]]$Users
)

