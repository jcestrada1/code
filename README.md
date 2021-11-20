# MongoDB Atlas Project Terraform Module

A Terraform module for createing MongoDB Atlas projects.

Change all instances of the `NAME-OF-MODULE` to the name of the module you're creating. This should just simply be the following files which need to be changed:

* README.md
* .chglog/config.yml
* Jenkinsfile

> **_NOTE:** Please remove the above section and this note before committing/pushing your module!

## Usage

```hcl
module "atlas_project" {
  source = "../../"

  atlas_org_id = "609068c9b4d9cf790b8688e1"
  project_name    = "Project-Test"
  admin_team_id = "609c9b32dab6544342896501"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | >= 0.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_mongodbatlas"></a> [mongodbatlas](#provider\_mongodbatlas) | >= 0.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [mongodbatlas_alert_configuration.CLUSTER_MONGOS_IS_MISSING_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.CLUSTER_MONGOS_IS_MISSING_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.CLUSTER_MONGOS_IS_MISSING_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.Creditcard_expire_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.Creditcard_expire_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.Creditcard_expire_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.User_joined_group_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.User_joined_group_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.User_joined_group_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.cpu_steal_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.cpu_steal_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.cpu_steal_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.disk_partition_utilization_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.disk_partition_utilization_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.disk_partition_utilization_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.disk_utilization_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.disk_utilization_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.disk_utilization_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.high_cpu_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.high_cpu_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.high_cpu_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.mongo_connection_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.mongo_connection_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.mongo_connection_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.page_fault_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.page_fault_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.page_fault_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.query_targeting_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.query_targeting_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.query_targeting_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.queues_total_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.queues_total_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.queues_total_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.replication_lag_p](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.replication_lag_p1](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_alert_configuration.replication_lag_p2](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/alert_configuration) | resource |
| [mongodbatlas_auditing.audit](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/auditing) | resource |
| [mongodbatlas_cloud_provider_access_authorization.auth_role](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_provider_access_authorization) | resource |
| [mongodbatlas_cloud_provider_access_setup.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/cloud_provider_access_setup) | resource |
| [mongodbatlas_encryption_at_rest.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/encryption_at_rest) | resource |
| [mongodbatlas_maintenance_window.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/maintenance_window) | resource |
| [mongodbatlas_privatelink_endpoint.privatelink](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/privatelink_endpoint) | resource |
| [mongodbatlas_project.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project) | resource |
| [mongodbatlas_project_ip_access_list.ip](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project_ip_access_list) | resource |
| [mongodbatlas_third_party_integration.datadog](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/third_party_integration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_email"></a> [alert\_email](#input\_alert\_email) | email to send alerts from datadog | `string` | `null` | no |
| <a name="input_atlas_org_id"></a> [atlas\_org\_id](#input\_atlas\_org\_id) | MongoDB Atlas Organization ID | `string` | n/a | yes |
| <a name="input_audit_filter"></a> [audit\_filter](#input\_audit\_filter) | Json Audit filter configuration | `string` | `null` | no |
| <a name="input_audit_filter_auth_success"></a> [audit\_filter\_auth\_success](#input\_audit\_filter\_auth\_success) | If true will include auth success in audit logs. | `bool` | `false` | no |
| <a name="input_aws_account_name"></a> [aws\_account\_name](#input\_aws\_account\_name) | Name of aws account name E.G. cfg-commercial, cfg-consumer | `string` | n/a | yes |
| <a name="input_datadog_key"></a> [datadog\_key](#input\_datadog\_key) | datadog api key | `string` | `null` | no |
| <a name="input_day_of_week"></a> [day\_of\_week](#input\_day\_of\_week) | Day of the week when you would like the maintenance window to start as a 1-based integer: S=1, M=2, T=3, W=4, T=5, F=6, S=7 | `string` | `2` | no |
| <a name="input_environment_id"></a> [environment\_id](#input\_environment\_id) | possible values, p -- prod, p-1 -- qa, p-2 -- dev | `string` | n/a | yes |
| <a name="input_hour_of_day"></a> [hour\_of\_day](#input\_hour\_of\_day) | Hour of the day when you would like the maintenance window to start. This parameter uses the 24-hour clock, where midnight is 0, noon is 12 (Time zone is UTC). | `string` | `6` | no |
| <a name="input_kms_IAM_role"></a> [kms\_IAM\_role](#input\_kms\_IAM\_role) | kms iam role | `string` | `null` | no |
| <a name="input_kms_arn"></a> [kms\_arn](#input\_kms\_arn) | KMS arn | `string` | `null` | no |
| <a name="input_kms_region"></a> [kms\_region](#input\_kms\_region) | AWS Region for KMS | `string` | `"us-east-1"` | no |
| <a name="input_list_of_cdirs"></a> [list\_of\_cdirs](#input\_list\_of\_cdirs) | Range of IP addresses in CIDR notation to be added to the access list | `list(string)` | `[]` | no |
| <a name="input_pl_region"></a> [pl\_region](#input\_pl\_region) | AWS Region for private links | `string` | `null` | no |
| <a name="input_shortened_app_name"></a> [shortened\_app\_name](#input\_shortened\_app\_name) | Application names, no longer than 5 characteres | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to tag resources with | `map(string)` | n/a | yes |
| <a name="input_team_permission"></a> [team\_permission](#input\_team\_permission) | team ids to set for project roles | <pre>map(object({<br>    team_id    = string<br>    role_names = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_use_kms"></a> [use\_kms](#input\_use\_kms) | Should kms be enabled? | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_provider_access_external_id"></a> [cloud\_provider\_access\_external\_id](#output\_cloud\_provider\_access\_external\_id) | The external ID for the Atlas IAM role that you need to use to create an IAM Role to allow access to the KMS key in your AWS account |
| <a name="output_cloud_provider_account_arn"></a> [cloud\_provider\_account\_arn](#output\_cloud\_provider\_account\_arn) | The Atlas AWS Account ARN. You need this to create an IAM Role to allow access to the KMS key in your AWS account |
| <a name="output_endpoint_service_named"></a> [endpoint\_service\_named](#output\_endpoint\_service\_named) | Name of the PrivateLink endpoint service in AWS |
| <a name="output_private_link_id"></a> [private\_link\_id](#output\_private\_link\_id) | Unique identifier of the AWS PrivateLink connection |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The project id is |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK --> 
