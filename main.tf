terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "this" {
  name        = var.name
  vmid        = var.vmid
  desc        = var.description
  target_node = var.target_node
  agent       = var.qemu_agent ? "1" : "0"
  hastate     = var.hastate
  hagroup     = var.hagroup
  clone       = var.template_name
  os_type     = var.os_type

  # Hardware
  cores   = var.cores
  sockets = var.sockets
  memory  = var.memory

  network {
    model  = var.network_model
    bridge = var.network_bridge
  }

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
