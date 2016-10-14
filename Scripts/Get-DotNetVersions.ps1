function global:Get-DotNetVersions {
<#
  .SYNOPSIS
  This Cmdlet retrieves all registered versions of .NET on the local machine.

  .DESCRIPTION
  This Cmdlet retrieves all registered versions of .NET on the local machine and formats them based on their common version numbers.

  .EXAMPLE
  Get-DotNetVersions
  Returns an object with all registered versions of .NET Framework

  .LINK
  https://lab.zibings.net/amale/powershell-profile
#>

  Begin { }

  Process {
    Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse |
    Get-ItemProperty -name Version,Release -EA 0 |
    Where { $_.PSChildName -match '^(?!S)\p{L}'} |
    Select PSChildName, Version, Release, @{
      name = "Product"
      expression = {
        switch -regex ($_.Release) {
          "378389" { [Version]"4.5" }
          "378675|378758" { [Version]"4.5.1" }
          "379893" { [Version]"4.5.2" }
          "393295|393297" { [Version]"4.6" }
          "394254|394271" { [Version]"4.6.1" }
          "394802|394806" { [Version]"4.6.2" }
          {$_ -gt 394806} { [Version]"Undocumented 4.6.2 or higher, please update script" }
        }
      }
    }
  }

  End { }
}