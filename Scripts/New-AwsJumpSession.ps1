function New-AwsJumpSession
{
<#
	.SYNOPSIS
	Starts a new SSH session that proxies through a jump box in an AWS
	cluster.

	.DESCRIPTION
	Attempts to start a proxied SSH session using the given identity
	through a jumpbox with access to a closed VPC in an AWS cluster.

	.INPUTS
	IdentityFile
		The identity file to use when opening the SSH sessions
	JumpBoxHost
		The host value of the jump box used for proxying
	DestinationHost
		The host value of the destination host in the closed VPC
#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true, Position=0)] [string] $IdentityFile,
		[parameter(Mandatory=$true, Position=1)] [string] $JumpBoxHost,
		[parameter(Mandatory=$true, Position=2)] [string] $DestinationHost
	)
	
	Invoke-Expression "ssh -i $IdentityFile -o ""ProxyCommand ssh -W %h:%p -i $IdentityFile $JumpBoxHost"" $DestinationHost"
}