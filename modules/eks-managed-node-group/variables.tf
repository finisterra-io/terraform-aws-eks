variable "create" {
  description = "Determines whether to create EKS managed node group or not"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "platform" {
  description = "Identifies if the OS platform is `bottlerocket` or `linux` based; `windows` is not supported"
  type        = string
  default     = "linux"
}

################################################################################
# User Data
################################################################################

variable "enable_bootstrap_user_data" {
  description = "Determines whether the bootstrap configurations are populated within the user data template. Only valid when using a custom AMI via `ami_id`"
  type        = bool
  default     = false
}

variable "cluster_name" {
  description = "Name of associated EKS cluster"
  type        = string
  default     = null
}

variable "cluster_endpoint" {
  description = "Endpoint of associated EKS cluster"
  type        = string
  default     = ""
}

variable "cluster_auth_base64" {
  description = "Base64 encoded CA of associated EKS cluster"
  type        = string
  default     = ""
}

variable "cluster_service_ipv4_cidr" {
  description = "The CIDR block to assign Kubernetes service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks"
  type        = string
  default     = null
}

variable "pre_bootstrap_user_data" {
  description = "User data that is injected into the user data script ahead of the EKS bootstrap script. Not used when `platform` = `bottlerocket`"
  type        = string
  default     = ""
}

variable "post_bootstrap_user_data" {
  description = "User data that is appended to the user data script after of the EKS bootstrap script. Not used when `platform` = `bottlerocket`"
  type        = string
  default     = ""
}

variable "bootstrap_extra_args" {
  description = "Additional arguments passed to the bootstrap script. When `platform` = `bottlerocket`; these are additional [settings](https://github.com/bottlerocket-os/bottlerocket#settings) that are provided to the Bottlerocket user data"
  type        = string
  default     = ""
}

variable "user_data_template_path" {
  description = "Path to a local, custom user data template file to use when rendering user data"
  type        = string
  default     = ""
}

variable "launch_template_id" {
  description = "The ID of an existing launch template to use. Required when `create_launch_template` = `false` and `use_custom_launch_template` = `true`"
  type        = string
  default     = ""
}

################################################################################
# EKS Managed Node Group
################################################################################

variable "subnet_ids" {
  description = "Identifiers of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: `kubernetes.io/cluster/CLUSTER_NAME`"
  type        = list(string)
  default     = null
}

variable "min_size" {
  description = "Minimum number of instances/nodes"
  type        = number
  default     = 0
}

variable "max_size" {
  description = "Maximum number of instances/nodes"
  type        = number
  default     = 3
}

variable "desired_size" {
  description = "Desired number of instances/nodes"
  type        = number
  default     = 1
}

variable "name" {
  description = "Name of the EKS managed node group"
  type        = string
  default     = ""
}

variable "use_name_prefix" {
  description = "Determines whether to use `name` as is or create a unique name beginning with the `name` as the prefix"
  type        = bool
  default     = true
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Valid values are `AL2_x86_64`, `AL2_x86_64_GPU`, `AL2_ARM_64`, `CUSTOM`, `BOTTLEROCKET_ARM_64`, `BOTTLEROCKET_x86_64`"
  type        = string
  default     = null
}

variable "ami_release_version" {
  description = "AMI version of the EKS Node Group. Defaults to latest version for Kubernetes version"
  type        = string
  default     = null
}

variable "capacity_type" {
  description = "Type of capacity associated with the EKS Node Group. Valid values: `ON_DEMAND`, `SPOT`"
  type        = string
  default     = "ON_DEMAND"
}

variable "disk_size" {
  description = "Disk size in GiB for nodes. Defaults to `20`. Only valid when `use_custom_launch_template` = `false`"
  type        = number
  default     = null
}

variable "force_update_version" {
  description = "Force version update if existing pods are unable to be drained due to a pod disruption budget issue"
  type        = bool
  default     = null
}

variable "instance_types" {
  description = "Set of instance types associated with the EKS Node Group. Defaults to `[\"t3.medium\"]`"
  type        = list(string)
  default     = null
}

variable "labels" {
  description = "Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed"
  type        = map(string)
  default     = null
}

variable "cluster_version" {
  description = "Kubernetes version. Defaults to EKS Cluster Kubernetes version"
  type        = string
  default     = null
}

variable "launch_template_version" {
  description = "Launch template version number. The default is `$Default`"
  type        = string
  default     = null
}

variable "remote_access" {
  description = "Configuration block with remote access settings. Only valid when `use_custom_launch_template` = `false`"
  type        = any
  default     = {}
}

variable "taints" {
  description = "The Kubernetes taints to be applied to the nodes in the node group. Maximum of 50 taints per node group"
  type        = any
  default     = {}
}

variable "update_config" {
  description = "Configuration block of settings for max unavailable resources during node group updates"
  type        = map(string)
  default = {
    max_unavailable_percentage = 33
  }
}

variable "timeouts" {
  description = "Create, update, and delete timeout configurations for the node group"
  type        = map(string)
  default     = {}
}

################################################################################
# IAM Role
################################################################################

variable "iam_role_arn" {
  description = "Existing IAM role ARN for the node group. Required if `create_iam_role` is set to `false`"
  type        = string
  default     = null
}

################################################################################
# Autoscaling Group Schedule
################################################################################

variable "create_schedule" {
  description = "Determines whether to create autoscaling group schedule or not"
  type        = bool
  default     = true
}

variable "schedules" {
  description = "Map of autoscaling group schedule to create"
  type        = map(any)
  default     = {}
}

variable "vpc_id" {
  description = "ID of the VPC where the cluster will be provisioned"
  type        = string
  default     = null
}

variable "vpc_name" {
  description = "Name of the VPC where the cluster will be provisioned"
  type        = string
  default     = null
}

variable "subnet_names" {
  description = "List of subnet names where the cluster will be provisioned"
  type        = list(string)
  default     = null
}
