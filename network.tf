#Virtual network
module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.5.4"

  compartment_id = oci_identity_compartment.freelab.id
  region         = var.region
  vcn_name       = var.compartment_name
  vcn_dns_label  = var.compartment_name

  create_internet_gateway  = true
  create_nat_gateway       = false
  create_service_gateway   = false
  vcn_cidrs                = [ "10.0.0.0/16" ]
}

#Subnet
resource "oci_core_subnet" "vcn-public-subnet" {
  compartment_id = oci_identity_compartment.freelab.id
  vcn_id         = module.vcn.vcn_id
  cidr_block     = "10.0.0.0/24"
  freeform_tags  = var.tags

  route_table_id = module.vcn.ig_route_id
  security_list_ids = [
    oci_core_security_list.public-security-list.id,
  ]

  display_name    = "public-subnet"
  dhcp_options_id = oci_core_dhcp_options.dhcp-options.id
  dns_label       = "publicsubnet"
}

#DHCP
resource "oci_core_dhcp_options" "dhcp-options" {
  compartment_id = oci_identity_compartment.freelab.id
  vcn_id         = module.vcn.vcn_id
  display_name   = "freelab-dhcp-options"
  freeform_tags  = var.tags

  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  options {
    type                = "SearchDomain"
    search_domain_names = ["freelab.oraclevcn.com"]
  }
}
