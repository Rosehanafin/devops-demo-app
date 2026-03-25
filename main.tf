terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

variable "do_token" {}

resource "digitalocean_droplet" "devops_demo" {
  name   = "devops-demo-droplet"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-22-04-x64"

  user_data = <<-EOF
    #!/bin/bash

    echo "root:devops2026" | chpasswd

    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

    systemctl restart sshd
  EOF
}

output "droplet_ip" {
  value = digitalocean_droplet.devops_demo.ipv4_address
}
