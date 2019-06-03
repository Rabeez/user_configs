function prompt {
    $currentBranchExt = $((git branch) -match "\*");
    $pcname = ($env:computername)
    $currentfolder = $(Split-Path (Split-Path $(get-location) -Leaf) -Leaf)


    $fullprompt = ""
    if ($currentBranchExt) {
        Try {           
                # Holds the pattern for extracting the branch name
                $currentBranchMatchPattern = "\w*";
                # Executes the regular expression against the matched branch
                $currentBranchNameMatches = [regex]::matches($currentBranchExt, $currentBranchMatchPattern);
                # Gets the current branch from the matches
                $currentBranchName = $currentBranchNameMatches.Captures[2].Value.Trim();

                # Sets the Prompt which contains the Current git branch name
                # Prompt format - current_directory [ current_branch ] >
                $fullprompt = $pcname + ": [" + $currentBranchName + "] " + $currentfolder + ">"
            }
            Catch {
                # Calls the default prompt
                $fullprompt = $pcname + ": " + $currentfolder + ">"
            }
    } else {
        # Calls the default prompt
        $fullprompt = $pcname + ": " + $currentfolder + ">"
    }

    Write-Host($fullprompt) -nonewline -foregroundcolor Cyan

    $Host.UI.RawUI.WindowTitle = "Windows PowerShell - " + (get-location).tostring()
    return " "
}

Set-PSReadlineOption -TokenKind Parameter -ForegroundColor Blue
Set-PSReadlineOption -TokenKind Operator -ForegroundColor Blue
