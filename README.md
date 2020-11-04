# Terraform Landing Zone

## Background
This repository is an experimental repository to gauge how much quicker it might be to create a sample Landing Zone using Terraform rather than the ARM/PowerShell native Azure IaC toolchain. 

## Usage Guidelines
This repository is licensed under a copyleft license, please see LICENSE in the root of the repository.

# Instructions 

1. Clone the repository to your machine
2. Edit the areas in the settings files marked "please edit"
3. For N number of spokes, create/copy N number of settings.spoke1.tf, replacing "spoke1" with the correct number. 
4. In the root of the directory, run terraform init / terraform apply
5. Profit
