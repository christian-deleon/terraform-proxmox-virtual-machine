############################################
# Proxmox
############################################

variable "name" {
  type        = string
  description = "The name of the virtual machine"
}

variable "vmid" {
  type        = number
  default     = 0
  description = "The ID of the virtual machine"
}

variable "description" {
  type        = string
  default     = null
  description = "The description of the virtual machine"
}

variable "target_node" {
  type        = string
  description = "The name of the node where the virtual machine will be created"
}

variable "resource_pool" {
  type        = string
  default     = null
  description = "The name of the resource pool"
}

variable "template_name" {
  type        = string
  description = "The name of the template to clone"
}

variable "os_type" {
  type        = string
  description = "The type of the operating system. Options: ubuntu, centos, cloud-init"
}

variable "qemu_agent" {
  type        = bool
  default     = false
  description = "Enable the QEMU Guest Agent"
}

############################################
# Hardware
############################################

variable "cores" {
  type        = number
  default     = 4
  description = "The number of cores"
}

variable "sockets" {
  type        = number
  default     = 1
  description = "The number of sockets"
}

variable "memory" {
  type        = number
  default     = 2048
  description = "The amount of memory in MB"
}

variable "disk_size" {
  type        = number
  default     = 32
  description = "The size of the disk in GB"
}

variable "storage_name" {
  type        = string
  description = "The name of the storage"
}

variable "network_model" {
  type        = string
  default     = "virtio"
  description = "The network model"
}

variable "network_bridge" {
  type        = string
  default     = "vmbr0"
  description = "The network bridge"
}
