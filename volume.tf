# Create block volume.
resource "oci_core_volume" "freelab_block_volume" {
  count                = var.block_volumes
  compartment_id       = oci_identity_compartment.freelab.id
  availability_domain  = var.ad
  display_name         = join("-", [var.vm_name, "block", "volume"])
  freeform_tags        = var.tags
  size_in_gbs          = 59
  is_auto_tune_enabled = true
}


## This is commented out for now since ampere instances are hard to create in some regions.  If enabled, it will attach to the ampere instance.
# Attach block volume to ampere instance.
/* resource "oci_core_volume_attachment" "ampere_volume_attachment" {
  attachment_type                     = "paravirtualized"
  instance_id                         = oci_core_instance.vm_instance_ampere.id
  volume_id                           = oci_core_volume.freelab_block_volume.id
  device                              = "/dev/oracleoci/oraclevdb"
  display_name                        = "freelab-block-volume-attachment"
  is_pv_encryption_in_transit_enabled = true
  is_read_only                        = false
}
 */