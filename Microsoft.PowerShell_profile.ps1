# Enable starship
Invoke-Expression (&starship init powershell)

# Enable zoxide
Invoke-Expression (
    & {
        $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
        (zoxide init --hook $hook powershell | Out-String)
    }
)

# Environment Variables

# ssh-agent for git
[Environment]::SetEnvironmentVariable("GIT_SSH", "$((Get-Command ssh).Source)", [System.EnvironmentVariableTarget]::User)

# AWS
$Env:AWS_DEFAULT_REGION = "eu-west-2"
$Env:AWS_DEFAULT_PROFILE = "my-account"

# Variables
$HomeDirectory = $Env:USERPROFILE
$ScoopBinDirectory = "$HomeDirectory\scoop\shims"
$GitBinary = 'C:\Program Files\Git\cmd\git.exe'

# Aliases
set-alias vi "$ScoopBinDirectory\nvim.exe"
set-alias vim "$ScoopBinDirectory\nvim.exe"
set-alias tf "$ScoopBinDirectory\terraform.exe"
set-alias tg "$ScoopBinDirectory\terragrunt.exe"

# Functions
function l {
    & "$ScoopBinDirectory\ls.exe"
}

function ll {
    & "$ScoopBinDirectory\ls.exe" '-l'
}

function la {
    & "$ScoopBinDirectory\ls.exe" '-a'
}

function lal {
    & "$ScoopBinDirectory\ls.exe" '-la'
}

function l1 {
    & "$ScoopBinDirectory\ls.exe" '-1'
}

function gs {
    & $GitBinary 'st'
}

function gd {
    & $GitBinary 'diff'
}

function gdc {
    & $GitBinary 'diff' '--cached'
}

function gp {
    & $GitBinary 'pull'
}

function gnb {
    & $GitBinary 'checkout' '-b' $Args[0]
}

function gb {
    & $GitBinary 'branch'
}

function gbt {
    & $GitBinary 'branch-toggle'
}

function gdlc {
    & $GitBinary 'diff-last-commit'
}

function gr {
    & $GitBinary 'remote' '-v'
}
