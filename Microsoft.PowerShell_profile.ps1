$host.UI.RawUI.BackgroundColor = "Black";
Clear-Host

# Load posh-git example profile
. '~\Documents\WindowsPowerShell\profile.example.ps1'

Get-ChildItem '~\Documents\WindowsPowerShell\Scripts' |
Where { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} |
ForEach { . $_.FullName }

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
