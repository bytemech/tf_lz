#Terraform Landing Zone

##Background
This repository is an experimental repository to gauge how much quicker it might be to create a sample Landing Zone using Terraform rather than the ARM/PowerShell native Azure IaC toolchain. 

##Usage Guidelines
This repository is licensed under a copyleft license, please see LICENSE in the root of the repository.

#Instructions 

1. Clone the repository to your machine
2. Enter the details of a Storage Account for the tf statefile in the terraform {} block in main.tf
3. Enter the subscription IDs for the hub and core subscriptions in core.providers.tf
4. For N number of spokes, create/copy N number of provider contexts in optional.providers.tf
5. For N number of spokes, create/copy N number of modules in optional.modules.tf
6. In the root of the directory, run terraform init / terraform apply
7. Profit
