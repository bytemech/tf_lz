[CmdletBinding()]
param (
    [string] $automationaccountname,
    [string] $resourcegroupname,
    [string] $subscriptionid
)

if (!$(Get-AzContext)) {
    Connect-AzAccount -UseDeviceAuthentication 
}
Set-AzContext -subscriptionid $subscriptionid

$modules = @(
    [PSCustomObject]@{
        Name = "StorageDsc"
        Version = "4.9.0"
    }
    [PSCustomObject]@{
        Name = "NetworkingDsc"
        Version = "7.4.0.0"
    }    
    [PSCustomObject]@{
        Name = "xPendingReboot"
        Version = "0.4.0.0"
    } 
    [PSCustomObject]@{
        Name = "xDnsServer"
        Version = "1.16.0.0"
    }  
    [PSCustomObject]@{
        Name = "cChoco"
        Version = "2.4.0.0"
    }      
)

foreach ($module in $modules) {
    New-AzAutomationModule `
    -AutomationAccountName $automationaccountname `
    -ResourceGroupName $resourcegroupname `
     -Name $module.name `
     -ContentLinkUri "https://www.powershellgallery.com/api/v2/package/$($module.name)/$($module.Version)"
}

Start-Sleep 120 