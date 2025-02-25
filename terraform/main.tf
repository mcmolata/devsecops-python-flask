resource "proxmox_vm_qemu" "terraform_vm" {
  name        = "terraform-vm"
  target_node = "servers"                  
  clone       = "Template-debian11-bullseye"
  vmid        = 140

  cores   = 2
  sockets = 1
  memory  = 1024
  scsihw  = "virtio-scsi-pci"


  # static ip
  ipconfig0 = "ip=192.168.100.40/24,gw=192.168.100.1"

  # disk
  disk {
    size    = "8G"
    storage = "local-lvm"
    type    = "scsi"
  }

  # network
  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

    # upload file
  provisioner "file" {
    source      = "/var/lib/jenkins/workspace/devsecopsdemo"  
    destination = "/home/devsecopsdemo" 

    connection {
      type        = "ssh"
      user        = var.vm_user                  
      host        = "192.168.100.40"
      private_key  = file(var.ssh_private_key)
      timeout     = "5m"
    }
  }

  # remote command
  provisioner "remote-exec" {
    inline = [
      "sudo kill -9 $(ps -ef | grep apt-get | grep -v grep | awk '{print $2}')",
      "sudo apt-get install -y docker.io",
      "sudo curl -L \"https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "cd /home/devsecopsdemo/ && sudo docker-compose -f docker-compose.yml up -d"
    ]

    connection {
      type        = "ssh"
      user        = var.vm_user
      host        = "192.168.100.40"
      private_key  = file(var.ssh_private_key)
      timeout     = "5m"
    }
  }



}