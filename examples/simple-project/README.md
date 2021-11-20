# Simple MongoDB Atlas Project Example

Spin up a very simple MongoDB Atlas project

## Preconditions
Ensure you have a valid set of Atlas Keys in your environment that have permissions to create a project on the DigitalOnUs Atlas cluster.

Atlas Keys to set:
```bash
MONGODB_ATLAS_PUBLIC_KEY
MONGODB_ATLAS_PRIVATE_KEY
```

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_atlas_project"></a> [atlas\_project](#module\_atlas\_project) | ../../ |  |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_provider_access_external_id"></a> [cloud\_provider\_access\_external\_id](#output\_cloud\_provider\_access\_external\_id) | Information you’ll need to edit your AWS policy |
| <a name="output_cloud_provider_account_arn"></a> [cloud\_provider\_account\_arn](#output\_cloud\_provider\_account\_arn) | Information you’ll need to edit your AWS policy |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | id of the created project |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK --> 
