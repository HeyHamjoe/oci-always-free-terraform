#The OCI compartment to create
resource "oci_identity_compartment" "freelab" {
  compartment_id = var.tenancy_ocid
  description    = "Compartment for freelab resources."
  name           = var.compartment_name
  freeform_tags  = var.tags
}
