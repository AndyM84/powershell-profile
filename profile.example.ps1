Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

function shorten-path([string] $path) { 
   $loc = $path.Replace($HOME, '~') 
   # remove prefix for UNC paths 
   $loc = $loc -replace '^[^:]+::', '' 
   # make path shorter like tabs in Vim, 
   # handle paths starting with \\ and . correctly 
   return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2') 
}

# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    # our theme 
    $cdelim = [ConsoleColor]::White
    $chost = [ConsoleColor]::Green 
    $cloc = [ConsoleColor]::Cyan 

    write-host '' -n -f $cdelim 
    write-host (shorten-path (pwd).Path) -n -f $cdelim
    write-host '' -n -f $cdelim

    #Write-Host($pwd.ProviderPath) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

Pop-Location

Start-SshAgent -Quiet

$GitPromptSettings.EnableFileStatus = $false