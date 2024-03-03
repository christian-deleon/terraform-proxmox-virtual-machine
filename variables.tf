variable "name" {
  type = string
  description = "The name of the virtual machine"
}

variable "vmid" {
  type = number
  default = 0
  description = "The ID of the virtual machine"
}

variable "target_node" {
  type = string
  description = "The name of the node where the virtual machine will be created"
}

variable "template_name" {
  type = string
  description = "The name of the template to clone"
}

variable "os_type" {
  type = string
  description = "The type of the operating system. Options: ubuntu, centos, cloud-init"
}

variable "cores" {
  type = number
  default = 4
  description = "The number of cores"
}

variable "sockets" {
  type = number
  default = 1
  description = "The number of sockets"
}

variable "memory" {
  type = number
  default = 2048
  description = "The amount of memory in MB"
}
