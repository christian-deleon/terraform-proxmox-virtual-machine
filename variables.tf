############################################
# General settings
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

variable "template_name" {
  type        = string
  description = "The name of the template to clone"
}

variable "qemu_agent" {
  type        = bool
  default     = true
  description = "Enable the QEMU Guest Agent"
}

############################################
# Cloud-init settings
############################################

variable "os_type" {
  type        = string
  description = "The type of the operating system. Options: ubuntu, centos, cloud-init"
}

variable "cloudinit_user" {
  type        = string
  default     = null
  description = "The cloud-init user"
}

variable "cloudinit_password" {
  type        = string
  default     = null
  description = "The cloud-init user password"
}

variable "cloudinit_sshkey" {
  type        = string
  default     = null
  description = "The cloud-init user ssh key"
}

variable "cloudinit_cdrom" {
  type        = string
  default     = null
  description = "The cloud-init cdrom storage name"
}

variable "cloudinit_custom" {
  type        = string
  default     = null
  description = "The cloud-init custom configuration"
}

############################################
# Hardware settings
############################################

variable "sockets" {
  type        = number
  default     = 1
  description = "The number of sockets"
}

variable "cores" {
  type        = number
  default     = 4
  description = "The number of cores"
}

variable "vcpus" {
  type        = string
  default     = "0"
  description = "The number of vcpus"
}

variable "cpu" {
  type        = string
  default     = "host"
  description = "The CPU type. Options: host, kvm64, kvm32, core2duo, pentium, phenom, qemu32, qemu64"
}

variable "numa" {
  type        = bool
  default     = false
  description = "Enable NUMA"
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

variable "scsihw" {
  type        = string
  default     = null
  description = "The SCSI controller type. Options: lsi, virtio-scsi-pci, virtio-scsi-single"
}

variable "bootdisk" {
  type        = string
  default     = "scsi0"
  description = "The boot disk"
}

############################################
# Network settings
############################################

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

variable "ipconfig0_ip" {
  type    = string
  default = null
}

variable "ipconfig0_cidr" {
  type    = string
  default = null
}

variable "ipconfig0_gw" {
  type    = string
  default = null
}

variable "nameserver" {
  type    = string
  default = null
}

############################################
# High Availability (HA) Settings
############################################

variable "hastate" {
  type        = string
  default     = null
  description = "The HA state of the virtual machine. One of 'started', 'stopped', 'enabled', 'disabled', or 'ignored'"
}

variable "hagroup" {
  type        = string
  default     = null
  description = "The HA group of the virtual machine. HA State must be set."
}
