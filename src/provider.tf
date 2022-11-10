terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}
variable "pvt_key" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "evaro-desktop" {
  name = "evaro@saltapared"
}

data "digitalocean_ssh_key" "evaro-laptop" {
  name = "evaro@tijereta"
}

data "digitalocean_ssh_key" "nepo-desktop" {
  name = "nepo@pelicano"
}

data "digitalocean_ssh_key" "nepo-laptop" {
  name = "nepo@petrel"
}

data "digitalocean_ssh_key" "provisioner" {
  name = "provisioner"
}
