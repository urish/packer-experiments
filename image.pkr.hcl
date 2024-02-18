packer {
  required_plugins {
    virtualbox = {
      source  = "github.com/hashicorp/virtualbox"
      version = "~> 1"
    }
  }
}

source "virtualbox-iso" "tinytapeout_analog_vm" {
  format = "ova"
  boot_command = [
    "<wait5>c<wait>",
    "set gfxpayload=keep<enter><wait>",
    "linux /casper/vmlinuz <wait>",
    "autoinstall quiet fsck.mode=skip <wait>",
    "net.ifnames=0 biosdevname=0 systemd.unified_cgroup_hierarchy=0 <wait>",
    "ds=\"nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/\" <wait>",
    "---<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<wait><enter><enter>"
  ]
  boot_wait              = "1s"
  cpus                   = 8
  disk_size              = 32768
  guest_os_type          = "Ubuntu_64"
  headless               = false
  http_directory         = "./http"
  iso_checksum           = "d2fb80d9ce77511ed500bcc1f813e6f676d4a3577009dfebce24269ca23346a5"
  iso_url                = "https://releases.ubuntu.com/23.10.1/ubuntu-23.10-live-server-amd64.iso"
  memory                 = 8192
  shutdown_command       = "sudo shutdown -h now"
  ssh_password           = "magic"
  ssh_port               = 22
  ssh_read_write_timeout = "600s"
  ssh_timeout            = "120m"
  ssh_username           = "ttuser"
  vboxmanage = [
    ["modifyvm", "{{ .Name }}", "--cpu-profile", "host"],
  ]
  vrdp_bind_address = "0.0.0.0"
  vrdp_port_max     = 6000
  vrdp_port_min     = 5900
}

build {
  sources = ["source.virtualbox-iso.tinytapeout_analog_vm"]
}
