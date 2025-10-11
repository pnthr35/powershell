# TODO: Get quick sign in activities of specified User or Users...

[CmdletBinding()]
Param(
	[Parameter(Mandatory = $true,
		ValueFromPipeline = $true,
		ValueFromPipelineByPropertyName = $true,
		HelpMessage = "Enter one or multiple UPN's")]	
	[String[]]$Users
)

Begin {
	Connect-MgGraph
} # End Begin

Process {
	$userList = New-Object System.Collections.Generic.List[PSObject]

	foreach ($user in $Users) {
		# Look up the User and add to list
		$temp = Get-MgUser -Filter "userPrincipalname eq '$user'" -Property DisplayName, SignInActivity

		$userList.Add([PSCustomObject]@{
				DisplayName = $temp.DisplayName
				LastSignIn  = $temp.SignInActivity.LastNonInteractiveSignInDateTime
		})
	}
} # End Process

End {
	$userList | Format-Table *
}
