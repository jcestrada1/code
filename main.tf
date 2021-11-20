resource "mongodbatlas_project" "this" {
  name   = lower(format("MongoAtlas-%v-%v-%v", var.aws_account_name, var.shortened_app_name, var.environment_id))
  org_id = var.atlas_org_id


  dynamic "teams" {
    for_each = var.team_permission
    content {
      team_id    = teams.value["team_id"]
      role_names = teams.value["role_names"]

    }
  }
}


resource "mongodbatlas_project_ip_access_list" "ip" {
  for_each   = toset(var.list_of_cdirs)
  project_id = mongodbatlas_project.this.id
  cidr_block = each.key
  comment    = "cidr block for accessing the cluster"
}

resource "mongodbatlas_maintenance_window" "this" {
  project_id  = mongodbatlas_project.this.id
  day_of_week = var.day_of_week
  hour_of_day = var.hour_of_day
}
