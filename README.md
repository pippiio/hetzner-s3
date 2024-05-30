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
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.47 |

## Resources

| Name | Type |
|------|------|
| [hcloud_firewall.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |
| [hcloud_network.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network) | resource |
| [hcloud_network_subnet.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_subnet) | resource |
| [hcloud_primary_ip.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip) | resource |
| [hcloud_server.single](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A map of default tags, that will be applied to all resources applicable. | `map(string)` | `{}` | no |
| <a name="input_minio_password"></a> [minio\_password](#input\_minio\_password) | Password for Minio root user | `string` | `null` | no |
| <a name="input_minio_username"></a> [minio\_username](#input\_minio\_username) | Username for Minio root user | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | A prefix that will be used on all named resources. | `string` | `"pippi-"` | no |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | CIDR of the network | `string` | `"10.0.0.0/24"` | no |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | ID of the network | `string` | `null` | no |
| <a name="input_network_subnet"></a> [network\_subnet](#input\_network\_subnet) | Subnet of the network | `string` | `"10.0.0.0/28"` | no |
| <a name="input_server_datacenter"></a> [server\_datacenter](#input\_server\_datacenter) | Datacenter of the Minio server | `string` | `"fsn1-dc14"` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | VM type of the Minio server | `string` | `"cx11"` | no |
| <a name="input_sshfs_ip"></a> [sshfs\_ip](#input\_sshfs\_ip) | IP address of the SSHFS Server | `string` | n/a | yes |
| <a name="input_sshfs_path"></a> [sshfs\_path](#input\_sshfs\_path) | Path to data on the SSHFS Server | `string` | n/a | yes |
| <a name="input_sshfs_ssh_key"></a> [sshfs\_ssh\_key](#input\_sshfs\_ssh\_key) | SSH key for SSHFS Server | `string` | n/a | yes |
| <a name="input_sshfs_user"></a> [sshfs\_user](#input\_sshfs\_user) | Username of the SSHFS Server | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_minio_root_password"></a> [minio\_root\_password](#output\_minio\_root\_password) | Password for Minio root user |
| <a name="output_minio_root_user"></a> [minio\_root\_user](#output\_minio\_root\_user) | Username for Minio root user |
| <a name="output_server_ip"></a> [server\_ip](#output\_server\_ip) | IP address of the MinIO server |
<!-- END_TF_DOCS -->
