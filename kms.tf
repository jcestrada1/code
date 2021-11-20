
locals {
  policy_name = lower(format("MongoAtlas-policy-%v-%v-%v", var.aws_account_name, var.shortened_app_name, var.environment_id))
  role_name   = lower(format("MongoAtlas-role-%v-%v-%v", var.aws_account_name, var.shortened_app_name, var.environment_id))
}

# This resource needs to be created first if use_kms is set to true. This will cause the Atlas IAM Role external ID to be returned
# which can be used to generate the needed IAM role for the next two resources.
resource "mongodbatlas_cloud_provider_access_setup" "this" {
  count         = var.use_kms != true ? 0 : 1
  project_id    = mongodbatlas_project.this.id
  provider_name = "AWS"
}


# These two resources get created on the second terraform apply. After the IAM role was created and passed in as kms_IAM_role.

resource "mongodbatlas_cloud_provider_access_authorization" "auth_role" {
  count      = var.use_kms == true && var.kms_IAM_role != null ? 1 : 0
  project_id = mongodbatlas_project.this.id
  role_id    = mongodbatlas_cloud_provider_access_setup.this[0].role_id

  aws = {
    iam_assumed_role_arn = var.kms_IAM_role
  }
}

resource "mongodbatlas_encryption_at_rest" "this" {
  count      = var.use_kms == true && var.kms_IAM_role != null ? 1 : 0
  project_id = mongodbatlas_project.this.id

  aws_kms = {
    enabled                = true
    customer_master_key_id = var.kms_arn
    region                 = upper(replace(var.kms_region, "-", "_"))
    role_id                = mongodbatlas_cloud_provider_access_authorization.auth_role[0].role_id
  }
}
