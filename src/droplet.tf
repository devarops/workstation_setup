resource "digitalocean_droplet" "devserver" {
  image = "ubuntu-21-10-x64"
  name = "devserver"
  region = "sfo3"
  size = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.nepo.id,
    data.digitalocean_ssh_key.evaro.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
}

resource "digitalocean_floating_ip_assignment" "foobar" {
  ip_address = "146.190.1.89"
  droplet_id = digitalocean_droplet.devserver.id
}