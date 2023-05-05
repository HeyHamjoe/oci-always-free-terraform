# Oracle Cloud Infrastructure - Free Lab
Oracle Cloud Infrastructure (OCI) offers Always Free resources, but they can be somewhat difficult to understand and configure using the web console.  This is a terraform plan that, after setting a few variables, should create the environment and most of the resources for you.  Hopefully it's helpful in getting your free lab up and running quickly!
[Oracle Cloud Free Tier](https://docs.oracle.com/en-us/iaas/Content/FreeTier/freetier_topic-Always_Free_Resources.htm)

## What is currently created?
* Compartment for all the resources to live.
* Virtual Cloud Network, with public subnet and DHCP options.
* Firewall ruleset allowing egress and basic necessary ingress (SSH and ping) traffic.
* Up to two x86 compute servers (VM.Standard.E2.1.Micro) with 1 CPU, 1 GB RAM, and 50 GB boot disk.
* Up to one ampere aarch64 compute servers (VM.Standard.A1.Flex) with 4 CPU, 24 GB RAM, and 50 GB boot disk.
* One 50 GB block volume storage that can be attached to a VM.
* A volume backup policy that will keep 5 rolling backups of all boot and block volumes.

## Requirements
* An OCI Free Tier [account](https://signup.cloud.oracle.com/).
* Terraform v1.1.0+
* A public/private key pair for SSH and OCI API (can be the same but not recommended).
* A few brain cells!

## Configuration
1. Download this repository and begin to edit the terraform.tfvars file where the configurable variables are stored.  Most of our time will be spent editing this file.
2. We will be using API Key Authentication, so use instructions [here](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformproviderconfiguration.htm#APIKeyAuth) to get the following credentials so we can connect to the right account:
   * `tenancy_ocid`
   * `user_ocid`
   * `private_key_path`
   * `fingerprint`
   * `region`
   If you don't already have a public/private key pair, follow instructions [here](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#two).
3. For `ad`, we're looking for the availability domain to deploy resources to.  Many regions only have 1, but some have 3.  This can be found by going to the OCI Web console and clicking on Compute > Instances.  They should be listed at the bottom left corner.
4. Choose how many and the mix of hosts.  I recommend two `x86_hosts` and one `ampere_hosts`.  Some regions and availability domains are very difficult to create an ampere instance in due to the popularity and free tier capacity of that instance type.  If it's causing problems, you may have to set ampere to zero and try later.
5. Choose to create separate `block_volumes` or not.  The free tier account allows for 200 GB of total block/boot storage, so if you create 3 hosts theres 50 GB left for a block volume to attach to one of the hosts.  I have not paramaterized it yet, but you can edit the volume.tf file to attach the block volume to a host.
6. For `vm_image_ocid_x86_64` and `vm_image_ocid_ampere`, go to the [OCI images site](https://docs.oracle.com/en-us/iaas/images/all/) to find the operating system you want and the chosen region.
7. `ssh_public_key` is given in string format and will be placed on each host to allow SSH authentication. It can be the same as the API keys, but it's best security practice to use different keys.
8. The remote-exec section is optional.  This will log into each VM after boot and run a custom startup script that you provide.  `vm_username` is whatever the default username is for the chosen OS, `startup_script_url` is the web location of your script, and `ssh_private_key_path` is the path to your SSH key for remote login to the host.

## That's it!
From here, just run the typical `terraform init` and `terraform apply` commands.  Hopefully I've explained everything well enough and it works seemlessly.

## What's next?
You could add some additional firewall rules in the firewall.tf file, or work on a custom script that installs docker and some containers.  There are a few additional OCI Always Free resources that weren't configured, like an object storage and a database, that you could play with.  I may improve this repo to include some of that over time.  Mostly, just have fun and get creative!

## Thanks 
Some of this OCI and terraform isn't documented as well as other cloud environments, and it's a bit hard to search for forums when you hit a roadblock.  Most information I found was spread far and wide across the net, and most of the time only partially working, but it still saved me a good bit of effort.  So, special thanks to all who came before me and gave some good examples and ideas to start with!