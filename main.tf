resource "proxmox_vm_qemu" "this" {
  # General settings
  name             = var.name
  vmid             = var.vmid
  desc             = var.description
  target_node      = var.target_node
  clone            = var.template_name
  vm_state         = var.vm_state
  automatic_reboot = var.automatic_reboot
  agent            = var.qemu_agent ? "1" : "0"
  tags             = join(",", var.tags)

  # Cloud-init settings
  os_type    = var.os_type
  ciuser     = var.cloudinit_user
  cipassword = var.cloudinit_password
  sshkeys    = var.cloudinit_sshkey
  cicustom   = "vendor=local:snippets/qemu-guest-agent.yml" # /var/lib/vz/snippets/qemu-guest-agent.yml
  ciupgrade  = true

  # Hardware settings
  sockets  = var.sockets
  cores    = var.cores
  numa     = var.numa
  vcpus    = var.vcpus
  cpu_type = var.cpu_type
  memory   = var.memory
  scsihw   = var.scsihw
  bootdisk = var.bootdisk
  boot     = "order=scsi0"

  # High Availability settings
  hastate = var.hastate
  hagroup = var.hagroup

  # Network settings
  ipconfig0  = var.ipconfig0_ip == null ? null : "ip=${var.ipconfig0_ip}/${var.ipconfig0_cidr},gw=${var.ipconfig0_gw}"
  nameserver = var.nameserver
  skip_ipv6  = true

  # Serial settings
  serial {
    id = 0
  }

  # Network settings
  network {
    id     = 0
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

    ide {
      ide1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }
}
