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
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

# Provides list of available boot volumes.
data "oci_core_boot_volumes" "freelab_boot_volumes" {
  compartment_id      = oci_identity_compartment.freelab.id

  filter {
    name   = "state"
    values = ["AVAILABLE"]
  }
}

# Provides list of available block volumes.
data "oci_core_volume" "freelab_block_volume" {
  count           = var.block_volumes
  volume_id       = oci_core_volume.freelab_block_volume[count.index].id
}
