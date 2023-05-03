# Create security groups and ingress/egress rule.
resource "oci_core_network_security_group" "freelab-network-security-group" {
  compartment_id = oci_identity_compartment.freelab.id
  vcn_id         = module.vcn.vcn_id
  display_name   = "network-security-group-freelab"
  freeform_tags  = var.tags
}

resource "oci_core_network_security_group_security_rule" "freelab-network-security-group-list-ingress" {
  network_security_group_id = oci_core_network_security_group.freelab-network-security-group.id
  direction                 = "INGRESS"
  source                    = oci_core_network_security_group.freelab-network-security-group.id
  source_type               = "NETWORK_SECURITY_GROUP"
  protocol                  = "all"
  stateless                 = true
}

resource "oci_core_network_security_group_security_rule" "freelab-network-security-group-list-egress" {
  network_security_group_id = oci_core_network_security_group.freelab-network-security-group.id
  direction                 = "EGRESS"
  destination               = oci_core_network_security_group.freelab-network-security-group.id
  destination_type          = "NETWORK_SECURITY_GROUP"
  protocol                  = "all"
  stateless                 = true
}

resource "oci_core_security_list" "public-security-list" {
  compartment_id = oci_identity_compartment.freelab.id
  vcn_id         = module.vcn.vcn_id
  display_name   = "security-list-public"
  freeform_tags  = var.tags

  egress_security_rules {
    stateless        = false
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
  }


# Allowed Ports
  # Default SSH port.
  ingress_security_rules {
    stateless   = false
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol    = "6"
    description = "SSH traffic"

    tcp_options {
      min = 22
      max = 22
    }
  }

  # ICMP/Ping rules.
  ingress_security_rules {
    stateless   = false
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol    = "1"
    description = "ICMP Port Unreachable"

    icmp_options {
      type = 3
      code = 4
    }
  }

  ingress_security_rules {
    stateless   = false
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    protocol    = "1"
    description = "ICMP Destination Unreachable"

    icmp_options {
      type = 3
    }
  }

  ingress_security_rules {
    stateless   = false
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    protocol    = "1"
    description = "ICMP Echo Reply"

    icmp_options {
      type = 0
    }
  }

  ingress_security_rules {
    stateless   = false
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    protocol    = "1"
    description = "ICMP Echo"

    icmp_options {
      type = 8
    }
  }
  
  # The previous allowed ports are reasonable defaults for ICMP and SSH connection.
  # Add any additionl necessary open ports below using the example.
  #
  #   ingress_security_rules {
  #     stateless   = false
  #     source      = "0.0.0.0/0"
  #     source_type = "CIDR_BLOCK"
  #     protocol    = "6"
  #     description = "HTTPS traffic"
  #
  #     tcp_options {
  #       min = 443
  #       max = 443
  #     }
  #   }
}