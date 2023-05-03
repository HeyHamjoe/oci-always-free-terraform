# Output the tenancy name.
output "tenancy-name" {
  value = data.oci_identity_tenancy.freelab_tenancy.name
}

# Output the availability domain.
output "availability-domain" {
  value = var.ad
}

# Output the compartment name.
output "compartment-name" {
  value = oci_identity_compartment.freelab.name
}

# Output the public IP for x86 instances.
output "x86_64-public-IP" {
  value = oci_core_instance.vm_instance_x86_64.*.public_ip
}

# Output the public IP for ampere instances.
output "ampere-public-IP" {
  value = oci_core_instance.vm_instance_ampere.*.public_ip
}

# Output the list of all active volumes in the compartment.
output "all-active-volumes" {
  value = data.oci_core_boot_volumes.freelab_boot_volumes.boot_volumes.*.display_name
}

# Output the block volume name.
output "block_volume_name" {
  value = data.oci_core_volume.freelab_block_volume.*.display_name
}