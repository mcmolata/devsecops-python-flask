variable "ssh_password" {
  description = "SSH password for VM access"
  type        = string
  sensitive   = true
}
variable "vm_user" {
  description = "VM user"
  default     = "root"                    
}

variable "vm_password" {
  description = "VM password"
  sensitive   = true                        
}

variable "ssh_public_key_path" {
  description = "SSH public key"
  default     = "/home/wirt/.ssh/id_ed25519.pub"
}

variable "ssh_private_key_path" {
  description = "SSH private key"
  default     = "/home/wirt/.ssh/id_ed25519"
}