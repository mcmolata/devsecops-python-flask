terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
  required_version = ">= 0.14"
}

provider "proxmox" {
  pm_api_url          = var.cmp_url
  pm_api_token_id     = var.cmp_token
  pm_api_token_secret = var.cmp_secret 
  pm_tls_insecure     = true
}