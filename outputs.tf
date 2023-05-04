# Output the tenancy name.
output "Output_1_Tenancy-Name" {
  value = data.oci_identity_tenancy.freelab_tenancy.name
}

# Output the availability domains in the region.
output "Output_2_Availability-Domains" {
  value = data.oci_identity_availability_domains.availability_domains_in_region.availability_domains
}

# Output the compartment name.
output "Output_3_Compartment-Name" {
  value = oci_identity_compartment.freelab.name
}

# Output the public IP for x86 instances.
output "Output_4_Public-IP-x86_64" {
  value = oci_core_instance.vm_instance_x86_64.*.public_ip
}

# Output the public IP for ampere instances.
output "Output_5_Public-IP-ampere" {
  value = oci_core_instance.vm_instance_ampere.*.public_ip
}

# Output the boot volumes.
output "Output_6_Boot-Volumes" {
  value = data.oci_core_boot_volume.freelab_boot_volume.*.display_name
}

# Output the block volume name.
output "Output_7_Block-Volumes" {
  value = data.oci_core_volume.freelab_block_volume.*.display_name
}