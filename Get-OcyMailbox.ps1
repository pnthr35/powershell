# TODO: Get Mailbox Stats
[CmdletBinding()]
Param(
	[Parameter(Mandatory = $true,
		ValueFromPipeline = $true,
		ValueFromPipelineByPropertyName = $true,
		HelpMessage = "Enter one or multiple UPN's")]	
	[String[]]$Users
)

Begin {
	Connect-MgGraph -Scopes "Directory.Read.All", "User.Read.All", "Group.Read.All"
} # End Begin

Process {
	$userList = New-Object System.Collections.Generic.List[PSObject]

	foreach ($user in $Users) {
		# Look up quick Mailbox Stats
		# TODO
		
		$userList.Add([PSCustomObject]@{
				DisplayName = $temp.DisplayName
				LastSignIn  = $temp.SignInActivity.LastNonInteractiveSignInDateTime
		})
	}
} # End Process

End {
	$userList | Format-Table *
}