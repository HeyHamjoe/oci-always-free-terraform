variable "compartment_name" {
  description = "The name of the compartment."
  type        = string
}

variable "tenancy_ocid" {
  description = "The OCID of the tenancy."
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user."
  type        = string
}

variable "vm_image_ocid_x86_64" {
  description = "The OCID of the x86_64 VM image (which OS) to be deployed."
  type        = string
}

variable "x86_hosts" {
    description = "The number of x86 hosts to create (2 are free)."
    type        = number
}

variable "vm_image_ocid_ampere" {
  description = "The OCID of the ampere VM image (which OS) to be deployed."
  type        = string
}

variable "ampere_hosts" {
    description = "The number of ampere hosts to create (1 is free)."
    type        = number
}

variable "block_volumes" {
    description = "The number of block volumes to create (1 up to 59GB is free)."
    type        = number
}

variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "region" {
  description = "The name of the cloud region."
  type        = string
}

variable "ad" {
  description = "The availability domain for the region."
  type        = string
}

variable "fingerprint" {
  description = "The fingerprint of the OCI API private key."
  type        = string
}

variable "api_private_key_path" {
  description = "The location of the OCI API private key."
  type        = string
}

variable "ssh_private_key_path" {
  description = "The location fo the SSH prviate key."
  type        = string
}

variable "ssh_public_key" {
  description = "The value of the SSH public key used for VM login."
  type        = string
}

variable "tags" {
  description = "Freeform tags."
  type        = map(any)
}

variable "startup_script_path" {
  description = "Local path for custom startup script."
  type        = string
}

variable "vm_username" {
  description = "The username for the host VM."
  type        = string
}