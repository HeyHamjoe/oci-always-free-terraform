# After booting, the commands under "inline" will be executed locally on the x86 VMs.
resource "null_resource" "remote-exec-x86" {
  depends_on = [oci_core_instance.vm_instance_x86_64]
  count = var.x86_hosts
  
  # Triggers script to always run on Terraform Apply.
  triggers = {
    always_run = "${timestamp()}"
    }
  
  # Provision the x86 instances.
  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "30m"
      host        = oci_core_instance.vm_instance_x86_64[count.index].public_ip
      user        = var.vm_username
      private_key = file("${var.ssh_private_key_path}")
    }
    # Commands here will be executed at the VM shell.
    inline = [
      # Wait for services to settle and create log files.
      "sleep 30 &",
      "wait",
      "touch ~/logs",
      "chmod +rwx ~/logs",
      "echo '[Script begin]' >> ~/logs",
      join(" ", ["echo $(echo | date)\"",oci_core_instance.vm_instance_x86_64[count.index].display_name,oci_core_instance.vm_instance_x86_64[count.index].public_ip,"\">> logs"]),
      
      # Download and execute a remote script using curl. Comment these lines out if preferred.
      "echo '[Execute script]' >> ~/logs",
      "curl -o ~/my_startup_script.sh ${var.startup_script_url}",
      "chmod +rwx ~/my_startup_script.sh",
      "./my_startup_script.sh >> ~/logs",
      "echo '[Scripts done]\n\n\n' >> ~/logs",
    ]
  }
}

# After booting, the commands under "inline" will be executed locally on the ampere VMs.
resource "null_resource" "remote-exec-ampere" {
  depends_on = [oci_core_instance.vm_instance_ampere]
  count = var.ampere_hosts
  
  # Triggers script to always run on Terraform Apply.
  triggers = {
    always_run = "${timestamp()}"
    }
  
  # Provision the ampere instance.
  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "30m"
      host        = oci_core_instance.vm_instance_ampere[count.index].public_ip
      user        = var.vm_username
      private_key = file("${var.ssh_private_key_path}")
    }
    # Commands here will be executed at the VM shell.
    inline = [
      # Wait for services to settle and create log files.
      "sleep 30 &",
      "wait",
      "touch ~/logs",
      "chmod +rwx ~/logs",
      "echo '[Script begin]' >> ~/logs",
      join(" ", ["echo $(echo | date)\"",oci_core_instance.vm_instance_ampere[count.index].display_name,oci_core_instance.vm_instance_ampere[count.index].public_ip,"\">> logs"]),
      
      # Download and execute a remote script using curl. Comment these lines out if preferred.
      "echo '[Execute script]' >> ~/logs",
      "curl -o ~/my_startup_script.sh ${var.startup_script_url}",
      "chmod +rwx ~/my_startup_script.sh",
      "./my_startup_script.sh >> ~/logs",
      "echo '[Scripts done]\n\n\n' >> ~/logs",
    ]
  }
}