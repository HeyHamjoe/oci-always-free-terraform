# Check the README.md for help finding these.
tenancy_ocid            = "" # Example: "ocid1.tenancy.oc1..aaa928979..."
user_ocid               = "" # Example: "ocid1.user.oc1..aaa928979..."
fingerprint             = "" # Example: "51:b4:24:cd:ad:6c:..."
region                  = "" # Example: "us-phoenix-1"
ad                      = "" # Example: "Uocm:PHX-AD-1"
x86_hosts               = 0  # The number of x86 hosts to create. 0-2 for free tier. 
ampere_hosts            = 0  # The number of ampere hosts to create. 0-1 for free tier, unless you use less cpu/memory.  
block_volumes           = 0  # The number of block volumes to create. 0-1 for a 50 GB size volume.  Can be more if smaller.

# VM OS images. Go here for a list of images: https://docs.oracle.com/en-us/iaas/images/all/
vm_image_ocid_x86_64    = "" # Ubuntu 22.04 minimal Phoenix Example: "ocid1.image.oc1.phx.aaaaaaaa5jsphvppp7am5dekdds4c5zepa4wbugukxoaa2cau327aaqovp5a"
vm_image_ocid_ampere    = "" # Ubuntu 22.04 aarch64 minimal Phoenix Example: "ocid1.image.oc1.phx.aaaaaaaalz4kuyiaw2og7u5pg53f2ebbtoh6vp5kldo6gxtl3ztv2auykx2q"

# Environment name.
compartment_name        = "freelab"
vm_name                 = "freelab"
tags                    = { Project = "freelab" }

# OCI API key and SSH Private key.  Enter the key information between EOT statements.
# API private key is used connect to and manage OCI.
api_private_key         = <<EOT
EOT

# SSH public key to be placed on the hosts.
ssh_public_key          = <<EOT
EOT

# Remote-exec configuration (optional). After the hosts are created, the remote-exec will log into the host with the username and SSH private key to upload and execute your startup script.
# If undesired, comment these lines out and delete remote-exec.tf file.
vm_username             = "" # Example: "ubuntu"
startup_script_path     = "" # Example: "/home/HeyHamjoe/ubuntu_startup_script.sh"
ssh_private_key         = <<EOT
EOT
