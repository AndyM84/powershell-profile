$host.UI.RawUI.BackgroundColor = “Black”;
Clear-Host

# Load posh-git example profile
. 'D:\Personal\posh-git\profile.example.ps1'

Get-ChildItem '~\Documents\WindowsPowerShell\Scripts' |
Where { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} |
ForEach { . $_.FullName }

D:
cd \