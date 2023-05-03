# Create backup policy.
resource "oci_core_volume_backup_policy" "freelab_volume_backup_policy" {
  compartment_id = oci_identity_compartment.freelab.id
  display_name   = "freelab"
  freeform_tags  = var.tags

  schedules {
    backup_type       = "INCREMENTAL"
    day_of_month      = 1
    day_of_week       = "FRIDAY"
    hour_of_day       = 3
    month             = "JANUARY"
    offset_seconds    = 0
    offset_type       = "STRUCTURED"
    period            = "ONE_WEEK"
    retention_seconds = 3024000 # 5 weeks
    time_zone         = "REGIONAL_DATA_CENTER_TIME"
  }
}

# Assign backup policy to boot volume(s).
resource "oci_core_volume_backup_policy_assignment" "freelab_boot_volume_backup_policy_assignment" {
  count     = var.x86_hosts + var.ampere_hosts
  asset_id  = data.oci_core_boot_volumes.freelab_boot_volumes.boot_volumes[count.index].id
  policy_id = oci_core_volume_backup_policy.freelab_volume_backup_policy.id

# Something funky going on here.  Have to apply terraform twice to get policy to assign.
  depends_on = [
    data.oci_core_boot_volumes.freelab_boot_volumes
  ]
}

# Assign backup policy to block volume.
resource "oci_core_volume_backup_policy_assignment" "freelab_block_volume_backup_policy_assignment" {
  count     = var.block_volumes
  asset_id  = data.oci_core_volume.freelab_block_volume[count.index].id
  policy_id = oci_core_volume_backup_policy.freelab_volume_backup_policy.id

#  depends_on = [
#    oci_core_volume.freelab_block_volume
#  ]
}