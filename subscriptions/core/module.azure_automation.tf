module "azure_automation" {
  source                  = "../../modules/azure_automation"
  rg_name                 = var.automation_rg_name
  location                = var.location
  automation_account_name = var.automation_account_name
  tags                    = var.tags
}

