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
  target_node = var.target_node

  clone   = var.template_name
  os_type = var.os_type

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
