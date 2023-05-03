# The x86_64 host configuration.
resource "oci_core_instance" "vm_instance_x86_64" {
  count                               = var.x86_hosts
  availability_domain                 = var.ad
  compartment_id                      = oci_identity_compartment.freelab.id
  shape                               = "VM.Standard.E2.1.Micro"
  display_name                        = join("", [var.vm_name, count.index + 1])
  preserve_boot_volume                = false
  is_pv_encryption_in_transit_enabled = true
  freeform_tags                       = var.tags

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }

  source_details {
    source_id   = var.vm_image_ocid_x86_64
    source_type = "image"
  }

  availability_config {
    is_live_migration_preferred = true
  }

  create_vnic_details {
    assign_public_ip          = true
    subnet_id                 = oci_core_subnet.vcn-public-subnet.id
    assign_private_dns_record = true
    hostname_label            = join("", [var.vm_name, count.index + 1])
    private_ip                = join(".", ["10", "0", "0", count.index + 101])
    nsg_ids                   = [oci_core_network_security_group.freelab-network-security-group.id]
    freeform_tags             = var.tags
  }
}
