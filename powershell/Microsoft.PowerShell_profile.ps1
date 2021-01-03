# function Write-BranchName() {
#     try {
#         $branch = git rev-parse --abbrev-ref HEAD

#         if ($branch -eq "HEAD") {
#             # we're probably in detached HEAD state, so print the SHA
#             ## NOTE: hits this on empty repo
#             $branch = git rev-parse --short HEAD
#             Write-Host " ($branch)" -nonewline -ForegroundColor "red"
#         }
#         elseif ($branch -ne $null) {
#             # we're on an actual branch, so print it
#             Write-Host " ($branch)" -nonewline -ForegroundColor "magenta"
#         }
#     } catch {
#         # we'll end up here if we're in a newly initiated git repo
#         # NOTE: never hits this
#         Write-Host " (no branches)" -nonewline -ForegroundColor "orange"
#     }
# }

# function prompt {
#     $pcname = ($env:computername)
#     $currentfolder = $(Split-Path (Split-Path $(get-location) -Leaf) -Leaf)
#     $condaenv = ($env:CONDA_DEFAULT_ENV)
    
#     Write-Host $pcname -nonewline -ForegroundColor "Blue" -BackgroundColor "Green"
#     Write-Host " " -nonewline
#     if ($condaenv -ne "base") {
#         # No need to show this if base env is active
#         Write-Host "($condaenv)" -nonewline -ForegroundColor "DarkGreen"
#         Write-Host " " -nonewline
#     }
#     Write-Host $currentfolder -nonewline -ForegroundColor "cyan"
#     Write-BranchName
#     Write-Host ">" -nonewline -ForegroundColor "cyan"

#     # $Host.UI.RawUI.WindowTitle = "Windows PowerShell - " + (get-location).tostring()
#     return " "
# }

# Set-PSReadLineOption -Colors @{
#     Parameter = "Green";
#     Operator = 'Blue'
# }

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Agnoster
