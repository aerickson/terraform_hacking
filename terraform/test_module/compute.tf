resource "google_compute_disk" "vm_disk" {
  name  = "redacted-disk-${count.index}"
  count = "${var.host_count}"
  size  = "25"
  image = "ubuntu-1804-lts"
}

resource "google_compute_instance" "vm_instance" {
  count = "${var.host_count}"

  name         = "redacted-${count.index}"
  machine_type = "n1-standard-2"

  metadata = {
    // can take multiple, just separate with "\n"
    sshKeys = "${var.ssh_user}:${var.ssh_key}"
  }

  boot_disk {
    auto_delete = false
    source      = "${element(google_compute_disk.vm_disk.*.self_link, count.index)}"
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "${google_compute_network.redacted-net.name}"

    access_config {
      nat_ip = "${element(google_compute_address.ip_address.*.address, count.index)}"
    }
  }
}

resource "google_compute_firewall" "devicepool-firewall" {
  name    = "devicepool-firewall"
  network = "${google_compute_network.redacted-net.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  // restricted to vpn
  source_ranges = ["abc", "123"]
}

resource "google_compute_network" "redacted-net" {
  name = "redacted-net"
}

resource "google_compute_address" "ip_address" {
  count = "${var.host_count}"
  name  = "redacted-ip-${count.index}"
}

resource "aws_route53_record" "redacted" {
  count = "${var.host_count}"

  zone_id = "${data.aws_route53_zone.redacted.zone_id}"
  name    = "redacted-${count.index}.redacted.redacted.net"
  type    = "A"
  ttl     = "3600"
  records = ["${element(google_compute_address.ip_address.*.address, count.index)}"]
}
