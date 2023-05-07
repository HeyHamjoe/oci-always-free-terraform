# Create backup policy.
resource "oci_core_volume_backup_policy" "freelab_volume_backup_policy" {
  compartment_id = oci_identity_compartment.freelab.id
  display_name   = "freelab"
  freeform_tags  = var.tags

  schedules {
    backup_type       = "INCREMENTAL"
#    day_of_month      = 1
    day_of_week       = "SUNDAY"
    hour_of_day       = 5
#    month             = "JANUARY"
#    offset_seconds    = 0
    offset_type       = "STRUCTURED"
    period            = "ONE_WEEK"
    retention_seconds = 604800 # 1 week
    time_zone         = "REGIONAL_DATA_CENTER_TIME"
  }
}

# Assign backup policy to x86 boot volume(s).
resource "oci_core_volume_backup_policy_assignment" "freelab_x86_boot_volume_backup_policy_assignment" {
  count     = var.x86_hosts
  asset_id  = oci_core_instance.vm_instance_x86_64[count.index].boot_volume_id
  policy_id = oci_core_volume_backup_policy.freelab_volume_backup_policy.id
}

# Assign backup policy to ampere boot volume(s).
resource "oci_core_volume_backup_policy_assignment" "freelab_ampere_boot_volume_backup_policy_assignment" {
  count     = var.ampere_hosts
  asset_id  = oci_core_instance.vm_instance_ampere[count.index].boot_volume_id
  policy_id = oci_core_volume_backup_policy.freelab_volume_backup_policy.id
}

# Assign backup policy to block volume(s).
resource "oci_core_volume_backup_policy_assignment" "freelab_block_volume_backup_policy_assignment" {
  count     = var.block_volumes
  asset_id  = data.oci_core_volume.freelab_block_volume[count.index].id
  policy_id = oci_core_volume_backup_policy.freelab_volume_backup_policy.id
}