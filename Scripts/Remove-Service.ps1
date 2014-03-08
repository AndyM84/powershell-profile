function global:Remove-Service {
<#
	.SYNOPSIS
	This Cmdlet attempts to remove a service from the local machine.
	
	.DESCRIPTION
	This Cmdlet attempts to remove a service from the local machine using the service's name, not its display name.
	
	.EXAMPLE
	Remove-Service SomeService
	Attempts to remove SomeService from your machine.
	
	.LINK
	https://lab.zibings.net/amale/powershell-profile
#>

	[CmdletBinding(
		DefaultParameterSetName="Service"
	)]

	PARAM(
		[string[]]$Service
	);

	Begin { }

	Process {
		$g = (gwmi win32_service -filter "name='$Service'");

		if ($g -ne $null) {
			$g.delete();
		} else {
			Write-Error -message "Error: $Service doesn't appear to exist." -category InvalidArgument
		}
	}

	End { }
}