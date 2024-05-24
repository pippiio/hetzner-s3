######################
## Server Variables ##
######################

variable "server_type" {
  description = "VM type of the Minio server"
  type        = string
  default     = "cx11"
}

variable "server_datacenter" {
  description = "Datacenter of the Minio server"
  type        = string
  default     = "fsn1-dc14"
}

#####################
## SSHFS Variables ##
#####################

variable "sshfs_ip" {
  description = "IP address of the SSHFS Server"
  type        = string
}

variable "sshfs_user" {
  description = "Username of the SSHFS Server"
  type        = string
}

variable "sshfs_path" {
  description = "Path to data on the SSHFS Server"
  type        = string
}

variable "sshfs_ssh_key" {
  description = "SSH key for SSHFS Server"
  type        = string
  sensitive   = true
}

#######################
## Network Variables ##
#######################

variable "network_id" {
  description = "ID of the network"
  type        = string
  default     = null
}

variable "network_cidr" {
  description = "CIDR of the network"
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_subnet" {
  description = "Subnet of the network"
  type        = string
  default     = "10.0.0.0/28"
}

#####################
## MinIO Variables ##
#####################

variable "minio_username" {
  description = "Username for Minio root user"
  type        = string
  default     = null

  validation {
    error_message = "Minio username must be at least 3 characters long."
    condition     = var.minio_username != null ? length(var.minio_username) >= 3 : true
  }
}

variable "minio_password" {
  description = "Password for Minio root user"
  type        = string
  default     = null

  validation {
    error_message = "Minio password must be at least 8 characters long."
    condition     = var.minio_password != null ? length(var.minio_password) >= 8 : true
  }
}
