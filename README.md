# hetzner-object-storage
The _hetzner-object-storage_ is a generic Terraform module within the pippi.io family, maintained by Tech Chapter. The pippi.io modules are build to support common use cases often seen at Tech Chapters clients. They are created with best practices in mind and battle tested at scale. All modules are free and open-source under the Mozilla Public License Version 2.0.

The hetzner-object-storage module is made to provision a a S3 compatible object storage on Hetzner

## Example usage
For information on how to optain values for `sshfs` variables read [Prerequisites](#prerequisites-setting-up-sshfs) section below
```hcl
module "object_storage" {
  source = "github.com/pippiio/hetzner-object-storage.git"

  name_prefix = "my-"

  network_id = "4267435"

  sshfs_ip      = "uXXXXX.your-storagebox.de"
  sshfs_user    = "uXXXXX"
  sshfs_path    = "/"
  sshfs_ssh_key = <<-EOF
    .....
    .....
    EOF
}
```

## Prerequisites (Setting up SSHFS)
Since Hetzner Robots do not currently have a Terraform module, you will need to set up a Storage Box manually. After the initial setup, you can connect to it using SSHFS. Follow these steps to get started:

### Step 1: Set Up Your Hetzner Storage Box
1. *Log into your Hetzner account:* Go to the Hetzner website and log into your account.
2. *Purchase a Storage Box:* Navigate to the Storage Box section and select the plan that suits your needs. Follow the on-screen instructions to complete the purchase.
3. *Access your Storage Box details:* Once the purchase is complete, go to your Storage Box overview page. Note down the details such as the hostname, username, and password.

### Step 2: Add an SSH Key
To enhance security, it is recommended to use SSH keys for authentication. Follow these steps to add an SSH key to your Hetzner Storage Box:

1. Generate an SSH key pair (if you don't already have one):
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Press Enter to accept the default file location and provide a passphrase if desired.

2. Add the SSH key to your Hetzner Storage Box:
Follow the guide provided by Hetzner to add your public SSH key: [Hetzner Backup Space SSH Keys Guide.](https://docs.hetzner.com/robot/storage-box/backup-space-ssh-keys/)

### Step 3: Add information to Terraform Module
```hcl
sshfs_ip      = "uXXXXX.your-storagebox.de"
sshfs_user    = "uXXXXX"
sshfs_path    = "/"
sshfs_ssh_key = <<-EOF
  .....
  .....
  EOF
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
