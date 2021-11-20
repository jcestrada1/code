
output "project_id" {
  description = "id of the created project"
  value       = module.atlas_project.project_id
}

#Information you’ll need to edit your AWS policy
output "cloud_provider_access_external_id" {
  value = module.atlas_project.cloud_provider_access_external_id
}
#Information you’ll need to edit your AWS policy
output "cloud_provider_account_arn" {
  value = module.atlas_project.cloud_provider_account_arn
}
