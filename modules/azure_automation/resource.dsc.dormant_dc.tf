data "azurerm_subscription" "current" {
  provider = azurerm.default
}

resource "azurerm_automation_dsc_configuration" "dormant_dc" {
  provider                = azurerm.default
  name                    = "DormantDC"
  location                = var.location
  resource_group_name     = var.rg_name
  automation_account_name = azurerm_automation_account.main.name

  description = "This configuration configures Windows Server DNS Role, and installs prerequisite roles for promotion to a domain controller."

  content_embedded = <<CONFIGURATION
configuration DormantDC
{
    param
    (
        [Int]$RetryCount = 20,
        [Int]$RetryIntervalSec = 30
    )

    Import-DscResource -ModuleName StorageDsc -ModuleVersion 4.9.0.0
    Import-DscResource -ModuleName NetworkingDsc -ModuleVersion 7.4.0.0
    Import-DscResource -ModuleName xPendingReboot -ModuleVersion 0.4.0.0
    Import-DscResource -ModuleName xDnsServer -ModuleVersion 1.16.0.0
    Import-DscResource -ModuleName cChoco -ModuleVersion 2.4.0.0
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node localhost
    {
        LocalConfigurationManager {
            RebootNodeIfNeeded = $true
        }

        WindowsFeature DNS {
            Ensure = "Present"
            Name   = "DNS"
        }

        Script EnableDNSDiags {
            SetScript  = {
                Set-DnsServerDiagnostics -All $true
                Write-Verbose -Verbose "Enabling DNS client diagnostics"
            }

            GetScript  = { @{ } }
            TestScript = { $false }
            DependsOn  = "[WindowsFeature]DNS"
        }

        WindowsFeature DnsTools {
            Ensure    = "Present"
            Name      = "RSAT-DNS-Server"
            DependsOn = "[WindowsFeature]DNS"
        }

        WindowsFeature ADDSInstall {
            Ensure = "Present"
            Name   = "AD-Domain-Services"
        }

        WindowsFeature ADDSTools {
            Ensure    = "Present"
            Name      = "RSAT-ADDS-Tools"
            DependsOn = "[WindowsFeature]ADDSInstall"
        }

        WindowsFeature ADAdminCenter {
            Ensure    = "Present"
            Name      = "RSAT-AD-AdminCenter"
            DependsOn = "[WindowsFeature]ADDSTools"
        }


        DnsServerAddress DnsServerAddress
        {
            Address        = '127.0.0.1'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
            DependsOn      = "[WindowsFeature]DNS"
        }

        xDnsServerForwarder SetForwarders
        {
            IsSingleInstance = 'Yes'
            IPAddresses      = '1.1.1.1', '1.0.0.1'
            UseRootHint      = $false
        }

        WaitforDisk Disk2 {
            DiskId           = 2
            RetryIntervalSec = $RetryIntervalSec
            RetryCount       = $RetryCount
        }

        Disk DataDisk {
            DiskId      = 2
            DriveLetter = "F"
            DependsOn   = "[WaitForDisk]Disk2"
        }
        cChocoInstaller installChoco
        {
            InstallDir = "c:\choco"
        }
        cChocoPackageInstaller bginfo
        {
            Name      = 'bginfo'
            Ensure    = 'Present'
            DependsOn = "[cChocoInstaller]installChoco"
        }

    }
}
CONFIGURATION

  provisioner "local-exec" {
    command     = ".'${path.module}\\helpers\\compile-aa-dsc.ps1' -configname DormantDC -nodename dormantdc -automationaccountname ${azurerm_automation_account.main.name} -subscriptionid ${data.azurerm_subscription.current.subscription_id} -resourcegroupname ${var.rg_name} "
    interpreter = ["PowerShell", "-Command"]
  }
}