# Check the README.md for help finding these.
tenancy_ocid            = "" # Example: "ocid1.tenancy.oc1..aaa928979..."
user_ocid               = "" # Example: "ocid1.user.oc1..aaa928979..."
private_key_path        = "" # Example: "/home/HeyHamjoe/oci_api_private_key.pem"
fingerprint             = "" # Example: "51:b4:24:cd:ad:6c:..."
region                  = "" # Example: "us-phoenix-1"
ad                      = "" # Example: "Uocm:PHX-AD-1"
x86_hosts               = 0  # The number of x86 hosts to create. 0-2 for free tier. 
ampere_hosts            = 0  # The number of ampere hosts to create. 0-1 for free tier, unless you use less cpu/memory.  
block_volumes           = 0  # The number of block volumes to create. 0-1 for a 50 GB size volume.  Can be more if smaller.

# VM OS images. Go here for a list of images: https://docs.oracle.com/en-us/iaas/images/all/
vm_image_ocid_x86_64    = "" # Ubuntu 22.04 minimal Phoenix Example: "ocid1.image.oc1.phx.aaaaaaaa5jsphvppp7am5dekdds4c5zepa4wbugukxoaa2cau327aaqovp5a"
vm_image_ocid_ampere    = "" # Ubuntu 22.04 aarch64 minimal Phoenix Example: "ocid1.image.oc1.phx.aaaaaaaalz4kuyiaw2og7u5pg53f2ebbtoh6vp5kldo6gxtl3ztv2auykx2q"

# SSH public key to be placed on the host VMs.
ssh_public_key          = "" # Example: "ssh-ed25519 AbjlasdfljkAAC3asdf... freelab"


# Remote-exec configuration (optional). After the hosts are created, the remote-exec will log into the host with the username and SSH private key to download and execute a startup script.
# If undesired, comment these lines out and delete remote-exec.tf file.
vm_username             = "" # Example: "ubuntu"
startup_script_url      = "" # Example: "https://blahblahtoken12345@raw.githubusercontent.com/user/repo/main/ubuntu_startup.sh"
ssh_private_key_path    = "" # Example: "/home/HeyHamjoe/freelab_ssh_private_key.pem"

# Environment name.
compartment_name        = "freelab"
vm_name                 = "freelab"
tags                    = { Project = "freelab" }
