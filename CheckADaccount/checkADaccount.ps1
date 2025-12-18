function Test-ADCredential {
    [CmdletBinding()]
    Param
    (
        [parameter(Mandatory=$true)][string]$UserName,
        [parameter(Mandatory=$true)][string]$Password
    )
    if (!($UserName) -or !($Password)) {
        Write-Warning 'Test-ADCredential: Please specify both user name and password'
    } else {
        Add-Type -AssemblyName System.DirectoryServices.AccountManagement
        $DS = New-Object System.DirectoryServices.AccountManagement.PrincipalContext('domain')
        $DS.ValidateCredentials($UserName, $Password)
    }
}
