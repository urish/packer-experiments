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
  vm_name = "tinytapeout_analog_vm"
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
  cpus                   = 4
  disk_size              = 32768
  guest_os_type          = "Ubuntu_64"
  headless               = true
  http_directory         = "./http"
  iso_checksum           = "d2fb80d9ce77511ed500bcc1f813e6f676d4a3577009dfebce24269ca23346a5"
  iso_url                = "https://releases.ubuntu.com/23.10.1/ubuntu-23.10-live-server-amd64.iso"
  memory                 = 8192
  gfx_controller         = "vmsvga"
  gfx_vram_size          = 128
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

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get upgrade -y",
      "sudo apt-get remove -y --autoremove gnome-initial-setup"
    ]
  }   

  provisioner "shell" {
    env = {
      PDK_ROOT        = "/home/ttuser/pdk"
      PDK_VERSION     = "bdc9412b3e468c102d01b7cf6337be06ec6e9c9a"
      MAGIC_VERSION   = "8.3.460"
      KLAYOUT_VERSION = "0.28.17"
    }
    scripts = [
      "scripts/install_magic.sh",
      "scripts/install_klayout.sh",
      "scripts/install_pdk.sh"
    ]
  }
}
