function New-ISession {
<#
		.SYNOPSIS
		Starts a new PSSession and immediately enters it upon successful
		open.

		.DESCRIPTION
		Attempts to start a new PSSession to the computer using the credentials
		provided.  If the connection succeeds, Enter-PSSession is immediately
		invoked to save hassle and razzle.

		.INPUTS
		ComputerName
			The name/host of the remote computer
		Credential
			The user account to send for authentication
#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string[]] $ComputerName,

		[Parameter(Mandatory = $true)]
		[PSCredential] $Credential
	)

	$Sess = @()
	$Conn = $False

	# Attempt to create the session
	try {
		$Sess = New-PSSession -ComputerName $ComputerName -Credential $Credential -ErrorAction Stop
		$Conn = $True
	}
	catch {
		$Conn = $False
	}

	if ($Conn -eq $False) {
		Write-Error "Failed to connect session for some reason, who cares"
		Exit
	}

	Enter-PSSession $Sess
}