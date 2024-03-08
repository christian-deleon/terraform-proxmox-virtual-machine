terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "this" {
  # General settings
  name        = var.name
  vmid        = var.vmid
  desc        = var.description
  target_node = var.target_node
  clone       = var.template_name
  agent       = var.qemu_agent ? "1" : "0"
  tags        = join(",", var.tags)

  # Cloud-init settings
  os_type                 = var.os_type
  ciuser                  = var.cloudinit_user
  cipassword              = var.cloudinit_password
  sshkeys                 = var.cloudinit_sshkey
  cloudinit_cdrom_storage = var.cloudinit_cdrom

  # Hardware settings
  sockets  = var.sockets
  cores    = var.cores
  numa     = var.numa
  vcpus    = var.vcpus
  cpu      = var.cpu
  memory   = var.memory
  scsihw   = var.scsihw
  bootdisk = var.bootdisk

  # High Availability settings
  hastate = var.hastate
  hagroup = var.hagroup

  # Network settings
  ipconfig0  = var.ipconfig0_ip == null ? null : "ip=${var.ipconfig0_ip}/${var.ipconfig0_cidr},gw=${var.ipconfig0_gw}"
  nameserver = var.nameserver

  network {
    model  = var.network_model
    bridge = var.network_bridge
  }

  # Disk settings
  disks {
    scsi {
      scsi0 {
        disk {
          size    = var.disk_size
          storage = var.storage_name
        }
      }
    }
  }
}
