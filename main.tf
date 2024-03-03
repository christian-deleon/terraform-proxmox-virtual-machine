resource "proxmox_vm_qemu" "vm" {
  name        = var.name
  target_node = var.target_node

  clone   = var.template_name
  os_type = var.os_type

  cores   = var.cores
  sockets = var.sockets
  memory  = var.memory

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disks {
    scsi {
      scsi0 {
        disk {
          size    = 10
          storage = "ceph"
        }
      }
    }
  }
}