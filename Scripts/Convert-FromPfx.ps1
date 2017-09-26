function Convert-FromPfx {
<#

#>
	[CmdletBinding()]
	param (
		[string] $PfxFile,
		[string] $OutFilePemNoKey = [string]::Empty,
		[string] $OutFilePemKey = [string]::Empty,
		[string] $OutFileKey = [string]::Empty,
		[string] $OutFileCombo = [string]::Empty
	)

	if ([string]::IsNullOrWhiteSpace($PfxFile) -or !(Test-Path $PfxFile)) {
		Write-Error "A valid PFX must be supplied"
	}

	$DidSomething = $false

	if (![string]::IsNullOrWhiteSpace($OutFilePemNoKey)) {
		openssl pkcs12 -in $PfxFile -out $OutFilePemNoKey -nokeys
		$DidSomething = $true

		Write-Host "Wrote PEM no-key file"
	}

	if (![string]::IsNullOrWhiteSpace($OutFilePemKey)) {
		openssl pkcs12 -in $PfxFile -out $OutFilePemKey
		$DidSomething = $true

		Write-Host "Wrote PEM file"
	}

	if (![string]::IsNullOrWhiteSpace($OutFilePemNoKey) -and
			![string]::IsNullOrWhiteSpace($OutFileKey) -and
			![string]::IsNullOrWhiteSpace($OutFileCombo)) {
		openssl rsa -in $PfxFile -out $OutFileKey
		Get-Content $OutFilePemNoKey, $OutFileKey | Out-File $OutFileCombo
		$DidSomething = $true
		
		Write-Host "Wrote key & combo files"
	}

	if (!$DidSomething) {
		Write-Error "You must provide output options for something to be converted"
	}
}