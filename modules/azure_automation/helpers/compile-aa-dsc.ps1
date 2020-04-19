[CmdletBinding()]
Param(
    [string] $configname,
    [string] $subscriptionid,
    [string] $nodename,
    [string] $resourcegroupname,
    [string] $automationaccountname
)
$ErrorActionPreference = "Stop"

if (!$(Get-AzContext)) {
    Connect-AzAccount -UseDeviceAuthentication 
}
Set-AzContext -subscriptionid $subscriptionid

$ConfigData = @{
    AllNodes = @(
        @{
            NodeName                    = 'DormantDC'
            PSDscAllowPlainTextPassword = $true
            PSDscAllowDomainUser        = $true
        }
    )
}
$compParams = @{
    AutomationAccountName = $automationaccountname
    ResourceGroupName     = $resourcegroupname
    ConfigurationName     = $configname
    ConfigurationData     = $ConfigData
}
$CompilationJob = Start-AzAutomationDscCompilationJob @compParams
## Wait for the DSC compile
while ($null -eq $CompilationJob.EndTime -and $null -eq $CompilationJob.Exception) {
    $CompilationJob = $CompilationJob | Get-AzAutomationDscCompilationJob
    Start-Sleep -Seconds 3
}
