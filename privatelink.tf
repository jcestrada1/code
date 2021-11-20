
//private link will only create if pl_region is not null or ""
resource "mongodbatlas_privatelink_endpoint" "privatelink" {
  for_each = toset(compact([var.pl_region]))

  project_id    = mongodbatlas_project.this.id
  provider_name = "AWS"
  region        = var.pl_region
}
