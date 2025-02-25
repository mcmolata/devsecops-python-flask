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
  pm_api_token_id     = "root@pam!op" 
  pm_api_token_secret = "7879b698-a672-486b-98c0-e59ff997f1aa"     
  pm_tls_insecure     = true
}