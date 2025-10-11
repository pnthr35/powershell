# TODO: Get quick sign in activities of specified User or Users...

	 function Get-GetOcyActivity {
	    [CmdletBinding()]
	    Param(
	     
	    )

	    Begin{
            Connect-MgGraph -Scopes "AuditLog.Read.All"
        }

	    Process {
	      
	    } #End Process

	    End{}
	 } #End Function
