variable "proxmox_info" {
  type = object({
    ip          = string
    pm_user     = string
    pm_password = string
  })

  sensitive = true
}