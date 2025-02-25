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

variable "cmp_url" {
  description = "CMP URL"
  sensitive   = true                        
}
variable "cmp_token" {
  description = "CMP token"
  sensitive   = true                        
}
variable "cmp_secret" {
  description = "CMP secret"
  sensitive   = true                        
}
variable "ssh_private_key" {
  description = "SSH Private KEY"
  sensitive   = true                        
}