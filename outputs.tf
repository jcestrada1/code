
output "project_id" {
  description = "The project id is "
  value       = mongodbatlas_project.this.id
}


#Information you’ll need to edit your AWS policy
output "cloud_provider_access_external_id" {
  description = "The external ID for the Atlas IAM role that you need to use to create an IAM Role to allow access to the KMS key in your AWS account"
  value       = var.use_kms != true ? "" : mongodbatlas_cloud_provider_access_setup.this[0].aws.atlas_assumed_role_external_id
}

#Information you’ll need to edit your AWS policy
output "cloud_provider_account_arn" {
  description = "The Atlas AWS Account ARN. You need this to create an IAM Role to allow access to the KMS key in your AWS account"
  value       = var.use_kms != true ? "" : mongodbatlas_cloud_provider_access_setup.this[0].aws.atlas_aws_account_arn
}

output "endpoint_service_named" {
  description = "Name of the PrivateLink endpoint service in AWS"
  value = {
    for k, v in mongodbatlas_privatelink_endpoint.privatelink : k => v.endpoint_service_name
  }
}

output "private_link_id" {
  description = "Unique identifier of the AWS PrivateLink connection"
  value = {
    for k, v in mongodbatlas_privatelink_endpoint.privatelink : k => v.private_link_id
  }
}
