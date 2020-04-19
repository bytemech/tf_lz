resource "azurerm_automation_dsc_configuration" "dormant_dc" {
  name                    = "dormant_domain_controller"
  location                = var.location
  resource_group_name     = var.rg_name
  automation_account_name = azurerm_automation_account.main.name

  description      = "This configuration configures Windows Server DNS Role, and installs prerequisite roles for promotion to a domain controller."
  content_embedded = <<CONFIGURATION
configuration ConfigureDNS
{

  param
  (
    [Int]$RetryCount = 20,
    [Int]$RetryIntervalSec = 30
  )

  Import-DscResource -ModuleName StorageDsc, NetworkingDsc, xPendingReboot, xDnsServer
  $Interface = Get-NetAdapter | Where-Object Name -Like "Ethernet*" | Select-Object -First 1
  $InterfaceAlias = $($Interface.Name)

  Node localhost
  {
    LocalConfigurationManager
    {
      RebootNodeIfNeeded = $true
    }

    WindowsFeature DNS
    {
      Ensure = "Present"
      Name = "DNS"
    }

    Script EnableDNSDiags
    {
      SetScript = {
        Set-DnsServerDiagnostics -All $true
        Write-Verbose -Verbose "Enabling DNS client diagnostics"
      }

      GetScript =  { @{} }
      TestScript = { $false }
      DependsOn = "[WindowsFeature]DNS"
    }

    WindowsFeature DnsTools
    {
      Ensure = "Present"
      Name = "RSAT-DNS-Server"
      DependsOn = "[WindowsFeature]DNS"
    }

    DnsServerAddress DnsServerAddress
    {
      Address = '127.0.0.1'
      InterfaceAlias = $InterfaceAlias
      AddressFamily  = 'IPv4'
      DependsOn = "[WindowsFeature]DNS"
    }

    xDnsServerForwarder SetForwarders
    {
        IsSingleInstance = 'Yes'
        IPAddresses = '1.1.1.1','8.8.8.8'
        UseRootHint = $false
    }

    WaitforDisk Disk2
    {
      DiskId = 2
      RetryIntervalSec = $RetryIntervalSec
      RetryCount = $RetryCount
    }

    Disk DataDisk {
      DiskId = 2
      DriveLetter = "F"
      DependsOn = "[WaitForDisk]Disk2"
    }
  }
CONFIGURATION
}