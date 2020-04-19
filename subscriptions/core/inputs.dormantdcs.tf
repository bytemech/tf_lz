variable "dormantdc1_name" {
  description = "Name of the Automation Account to be created."
  type        = string
}

variable "dormantdc2_name" {
  description = "Name of the Automation Account to be created."
  type        = string
}

variable "dormantdc_vm_size" {
  description = "Name of the Automation Account to be created."
  type        = string
}

variable "dormantdc1_ip_addr" {
  description = "IP address of the first dormant dc to be created."
  type        = string
}

variable "dormantdc2_ip_addr" {
  description = "IP address of the second dormant dc to be created."
  type        = string
}

variable "workload_rg_name" {
  description = "Name of the Workload resource group to be created."
  type        = string
}