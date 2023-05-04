# Check the README.md for help finding these.
tenancy_ocid            = "" # Example: "ocid1.tenancy.oc1..aaa928979..."
user_ocid               = "" # Example: "ocid1.user.oc1..aaa928979..."
api_private_key_path    = "" # Example: "/home/HeyHamjoe/oci_api_private_key.pem"
fingerprint             = "" # Example: "51:b4:24:cd:ad:6c:..."
region                  = "" # Example: "us-phoenix-1"
ad                      = "" # Example: "Uocm:PHX-AD-1"
x86_hosts               = 0  # The number of x86 hosts to create. 0-2 for free tier. 
ampere_hosts            = 0  # The number of ampere hosts to create. 0-1 for free tier, unless you use less cpu/memory.  
block_volumes           = 0  # The number of block volumes to create. 0-1 for a 59 GB size volume.  Can be more if smaller.

# VM OS images. Go here for a list of images: https://docs.oracle.com/en-us/iaas/images/all/
vm_image_ocid_x86_64    = "" # Ubuntu 22.04 Example: "ocid1.image.oc1.iad.aaaaaaaatzeicfqyern34soj45m7svfrovuntmhscd3otihi2yvq577x5zwa"
vm_image_ocid_ampere    = "" # Ubuntu 22.04 Example: "ocid1.image.oc1.iad.aaaaaaaadyaq6oeuym4ocalnaw65h3vi54u2ouz27gtlz5ienjmcaywmkk5q"

# SSH public key and SSH private key path for VMs.
ssh_public_key          = "" # Example: "ssh-ed25519 AbjlasdfljkAAC3asdf... freelab"
ssh_private_key_path    = "" # Example: "/home/HeyHamjoe/freelab_ssh_private_key.pem"

# Username for the host VMs.
vm_username             = "" # Example: "ubuntu"

# Startup script for the VMs to run after boot.
startup_script_url      = "" # Example: "https://blahblahtoken12345@raw.githubusercontent.com/user/repo/main/ubuntu_startup.sh"

# Environment name.
compartment_name        = "freelab"
vm_name                 = "freelab"
tags                    = { Project = "freelab" }
