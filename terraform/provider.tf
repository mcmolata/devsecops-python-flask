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
  pm_api_url          = "https://192.227.162.136:8006/api2/json"
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret 
  pm_tls_insecure     = true
}