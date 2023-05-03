# Refer to the README.md file to fill these in.
tenancy_ocid            = ""
user_ocid               = ""
api_private_key_path    = ""
ssh_private_key_path    = ""
fingerprint             = ""
region                  = ""
ad                      = ""
x86_hosts               = 0 #0-2
ampere_hosts            = 0 #0-1
block_volumes           = 0 #0-1

# VM images here.
# Go here for a list of images: https://docs.oracle.com/en-us/iaas/images/all/
vm_image_ocid_x86_64 = ""
vm_image_ocid_ampere = ""

# SSH key.
ssh_public_key = "ssh-ed25519 AbjlasdfljkAAC3asdf..."

# Username for the host VMs.
vm_username = ""

# Add a startup script.
startup_script_url = ""

# Optional: Preferred environment name
compartment_name = "freelab"
vm_name          = "freelab"
tags             = { Project = "freelab" }
