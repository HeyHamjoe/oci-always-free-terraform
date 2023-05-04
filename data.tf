# Provides tenancy name.
data "oci_identity_tenancy" "freelab_tenancy" {
    #Required
    tenancy_id = var.tenancy_ocid
}

# Provides compartment name.
data "oci_identity_compartment" "freelab_compartment" {
  id = oci_identity_compartment.freelab.id
}

# Provides list of availability domains in the chosen region.
data "oci_identity_availability_domains" "availability_domains_in_region" {
  compartment_id = var.tenancy_ocid
}

# Provides list of boot volumes.
data "oci_core_boot_volume" "freelab_boot_volume" {
  count = var.x86_hosts
  boot_volume_id = oci_core_instance.vm_instance_x86_64[count.index].boot_volume_id
}

# Provides list of block volumes.
data "oci_core_volume" "freelab_block_volume" {
  count           = var.block_volumes
  volume_id       = oci_core_volume.freelab_block_volume[count.index].id
}