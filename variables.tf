variable "database_name" {
  description = "Specifies the name of the Cosmos DB Mongo Database. Changing this forces a new resource to be created."
  type        = string
}


variable "resource_group_name" {
  description = "The name of the resource group in which the Cosmos DB Mongo Database is created. Changing this forces a new resource to be created."
  type        = string
}

variable "cosmos_db_account_name" {
  description = "The name of the Cosmos DB Mongo Database to create the table within. Changing this forces a new resource to be created."
  type        = string
}

variable "throughput" {
  description = "The throughput of the MongoDB database (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply."
  type        = number
  default     = null
  validation {
    condition     = try(can(var.throughput / 100) && var.throughput >= 400 && var.throughput <= 1000000, true)
    error_message = "Invalid variable: ${var.throughput}"

  }
}

variable "max_autoscaling_throughput" {
  description = "The maximum autoscale throughput of the MongoDB database (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput."
  type        = number
  default     = null
  validation {
    condition     = try(can(var.max_autoscaling_throughput / 1000) && var.max_autoscaling_throughput >= 1000 && var.max_autoscaling_throughput <= 1000000, true)
    error_message = "Invalid variable: ${var.max_autoscaling_throughput}"

  }

}
