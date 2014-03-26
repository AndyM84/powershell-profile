function global:Remove-Subfolders {
<#
	.SYNOPSIS
	This Cmdlet attempts to remove subfolders from all child folders.
	
	.DESCRIPTION
	This Cmdlet attempts to resursively remove subfolders (like .svn) from all existing subfolders.
	
	.EXAMPLE
	Remove-Subfolders .svn
	Attempts to remove .svn folders from all subfolders.
	
	.LINK
	https://lab.zibings.net/amale/powershell-profile
#>

	[CmdletBinding(
		DefaultParameterSetName="Folder"
	)]

	PARAM(
		[string[]]$Folder
	);

	Begin { }

	Process {
		$Children = Get-ChildItem $MyInvocation.MyCommand.Path -Include $Folder -Force -Recurse;

		Foreach ($path in $Children)
		{
				Write-Host "Removing $Folder from $path.Fullname..."
		    Remove-Item $path.Fullname -Force -Recurse
		}
	}

	End { }
}