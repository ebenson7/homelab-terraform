terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = ">=2.9.14"
    }
  }
  required_version = ">=1.4.2"
}

provider "proxmox" {
  pm_api_url = var.proxmox_info.ip
  pm_user = var.proxmox_info.pm_user
  pm_password = var.proxmox_info.pm_password
}

resource "proxmox_vm_qemu" "Docker" {
  name        = "Docker"
  target_node = "pve"
  iso         = "local:iso/ubuntu-22.04.1-live-server-amd64.iso"
  scsihw      = "virtio-scsi-single"
  memory      = "4096"
  sockets     = "1"
  cores       = 4
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "50G"
  }
  network {
    bridge = "vmbr0"
    model  = "virtio"
  }
}