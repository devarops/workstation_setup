resource "digitalocean_droplet" "devserver" {
  image  = "ubuntu-22-04-x64"
  name   = "devserver"
  region = "sfo3"
  size   = "s-4vcpu-8gb-intel"
  ssh_keys = [
    data.digitalocean_ssh_key.evaro-desktop.id,
    data.digitalocean_ssh_key.evaro-laptop.id,
    data.digitalocean_ssh_key.nepo-desktop.id,
    data.digitalocean_ssh_key.nepo-laptop.id
  ]
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
}

resource "digitalocean_floating_ip_assignment" "devip" {
  ip_address = "146.190.1.89"
  droplet_id = digitalocean_droplet.devserver.id
}
