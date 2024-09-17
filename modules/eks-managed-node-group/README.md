# eks-managed-node-group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.67 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_user_data"></a> [user\_data](#module\_user\_data) | ../_user_data | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_schedule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule) | resource |
| [aws_eks_node_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_subnet.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_release_version"></a> [ami\_release\_version](#input\_ami\_release\_version) | AMI version of the EKS Node Group. Defaults to latest version for Kubernetes version | `string` | `null` | no |
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | Type of Amazon Machine Image (AMI) associated with the EKS Node Group. | `string` | `null` | no |
| <a name="input_bootstrap_extra_args"></a> [bootstrap\_extra\_args](#input\_bootstrap\_extra\_args) | Additional arguments passed to the bootstrap script. When `platform` = `bottlerocket`; these are additional [settings](https://github.com/bottlerocket-os/bottlerocket#settings) that are provided to the Bottlerocket user data | `string` | `""` | no |
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | Type of capacity associated with the EKS Node Group. Valid values: `ON_DEMAND`, `SPOT` | `string` | `"ON_DEMAND"` | no |
| <a name="input_cluster_auth_base64"></a> [cluster\_auth\_base64](#input\_cluster\_auth\_base64) | Base64 encoded CA of associated EKS cluster | `string` | `""` | no |
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | Endpoint of associated EKS cluster | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of associated EKS cluster | `string` | `null` | no |
| <a name="input_cluster_service_ipv4_cidr"></a> [cluster\_service\_ipv4\_cidr](#input\_cluster\_service\_ipv4\_cidr) | The CIDR block to assign Kubernetes service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks | `string` | `null` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubernetes version. Defaults to EKS Cluster Kubernetes version | `string` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Determines whether to create EKS managed node group or not | `bool` | `true` | no |
| <a name="input_create_schedule"></a> [create\_schedule](#input\_create\_schedule) | Determines whether to create autoscaling group schedule or not | `bool` | `true` | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | Desired number of instances/nodes | `number` | `1` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Disk size in GiB for nodes. Defaults to `20`. Only valid when `use_custom_launch_template` = `false` | `number` | `null` | no |
| <a name="input_enable_bootstrap_user_data"></a> [enable\_bootstrap\_user\_data](#input\_enable\_bootstrap\_user\_data) | Determines whether the bootstrap configurations are populated within the user data template. Only valid when using a custom AMI via `ami_id` | `bool` | `false` | no |
| <a name="input_force_update_version"></a> [force\_update\_version](#input\_force\_update\_version) | Force version update if existing pods are unable to be drained due to a pod disruption budget issue | `bool` | `null` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | Existing IAM role ARN for the node group. Required if `create_iam_role` is set to `false` | `string` | `null` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | Set of instance types associated with the EKS Node Group. Defaults to `["t3.medium"]` | `list(string)` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed | `map(string)` | `null` | no |
| <a name="input_launch_template_id"></a> [launch\_template\_id](#input\_launch\_template\_id) | The ID of an existing launch template to use. Required when `create_launch_template` = `false` and `use_custom_launch_template` = `true` | `string` | `""` | no |
| <a name="input_launch_template_version"></a> [launch\_template\_version](#input\_launch\_template\_version) | Launch template version number. The default is `$Default` | `string` | `null` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum number of instances/nodes | `number` | `3` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum number of instances/nodes | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the EKS managed node group | `string` | `""` | no |
| <a name="input_platform"></a> [platform](#input\_platform) | Identifies if the OS platform is `bottlerocket` or `linux` based; `windows` is not supported | `string` | `"linux"` | no |
| <a name="input_post_bootstrap_user_data"></a> [post\_bootstrap\_user\_data](#input\_post\_bootstrap\_user\_data) | User data that is appended to the user data script after of the EKS bootstrap script. Not used when `platform` = `bottlerocket` | `string` | `""` | no |
| <a name="input_pre_bootstrap_user_data"></a> [pre\_bootstrap\_user\_data](#input\_pre\_bootstrap\_user\_data) | User data that is injected into the user data script ahead of the EKS bootstrap script. Not used when `platform` = `bottlerocket` | `string` | `""` | no |
| <a name="input_remote_access"></a> [remote\_access](#input\_remote\_access) | Configuration block with remote access settings. Only valid when `use_custom_launch_template` = `false` | `any` | `{}` | no |
| <a name="input_schedules"></a> [schedules](#input\_schedules) | Map of autoscaling group schedule to create | `map(any)` | `{}` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Identifiers of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: `kubernetes.io/cluster/CLUSTER_NAME` | `list(string)` | `null` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | List of subnet names where the cluster will be provisioned | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_taints"></a> [taints](#input\_taints) | The Kubernetes taints to be applied to the nodes in the node group. Maximum of 50 taints per node group | `any` | `{}` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Create, update, and delete timeout configurations for the node group | `map(string)` | `{}` | no |
| <a name="input_update_config"></a> [update\_config](#input\_update\_config) | Configuration block of settings for max unavailable resources during node group updates | `map(string)` | <pre>{<br>  "max_unavailable_percentage": 33<br>}</pre> | no |
| <a name="input_use_name_prefix"></a> [use\_name\_prefix](#input\_use\_name\_prefix) | Determines whether to use `name` as is or create a unique name beginning with the `name` as the prefix | `bool` | `true` | no |
| <a name="input_user_data_template_path"></a> [user\_data\_template\_path](#input\_user\_data\_template\_path) | Path to a local, custom user data template file to use when rendering user data | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where the cluster will be provisioned | `string` | `null` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC where the cluster will be provisioned | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscaling_group_schedule_arns"></a> [autoscaling\_group\_schedule\_arns](#output\_autoscaling\_group\_schedule\_arns) | ARNs of autoscaling group schedules |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | The Amazon Resource Name (ARN) specifying the IAM role |
| <a name="output_node_group_arn"></a> [node\_group\_arn](#output\_node\_group\_arn) | Amazon Resource Name (ARN) of the EKS Node Group |
| <a name="output_node_group_autoscaling_group_names"></a> [node\_group\_autoscaling\_group\_names](#output\_node\_group\_autoscaling\_group\_names) | List of the autoscaling group names |
| <a name="output_node_group_id"></a> [node\_group\_id](#output\_node\_group\_id) | EKS Cluster name and EKS Node Group name separated by a colon (`:`) |
| <a name="output_node_group_labels"></a> [node\_group\_labels](#output\_node\_group\_labels) | Map of labels applied to the node group |
| <a name="output_node_group_resources"></a> [node\_group\_resources](#output\_node\_group\_resources) | List of objects containing information about underlying resources |
| <a name="output_node_group_status"></a> [node\_group\_status](#output\_node\_group\_status) | Status of the EKS Node Group |
| <a name="output_node_group_taints"></a> [node\_group\_taints](#output\_node\_group\_taints) | List of objects containing information about taints applied to the node group |
| <a name="output_platform"></a> [platform](#output\_platform) | Identifies if the OS platform is `bottlerocket`, `linux`, or `windows` based |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
