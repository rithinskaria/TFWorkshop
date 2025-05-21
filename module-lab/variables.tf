variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  
  default     = "East US"
}

variable "app_service_plan_name" {
 
}

variable "app_service_plan_sku" {
  description = "SKU of the App Service Plan"
  type        = string
  default     = "B1"
}

variable "app_names" {
  description = "List of web app names"
  type        = list(string)
}

variable "app2_names" {
  description = "List of web app names"
  type        = list(string)
}