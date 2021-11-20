module "atlas_project" {
  source = "../../"

  atlas_org_id       = "609068c9b4d9cf790b8688e1"
  aws_account_name   = "cfg-commercial"
  shortened_app_name = "mdbcc"
  environment_id     = "dev"
  team_permission = {
    IAM_team = {
      team_id    = "60a7f62c4cea772769a0fea2"
      role_names = ["GROUP_DATA_ACCESS_ADMIN", "GROUP_OWNER", "GROUP_CLUSTER_MANAGER"]
    }
    project_owner = {
      team_id    = "60ac2734e7ed9548f7f64694"
      role_names = ["GROUP_DATA_ACCESS_ADMIN", "GROUP_OWNER", "GROUP_CLUSTER_MANAGER"]
    }
    admin_team = {
      team_id    = "609c9b32dab6544342896501"
      role_names = ["GROUP_DATA_ACCESS_ADMIN", "GROUP_OWNER", "GROUP_CLUSTER_MANAGER"]
    }
  }



  list_of_cdirs = ["1.2.3.4/32", "192.2.0.0/16"]

  use_kms = true
  kms_arn = aws_kms_key.test.arn
  ## Set this manually after you create the role using the ouputs of the first run
  # kms_IAM_role       = ""

  alert_email               = "DL_mongodbalerts@mailinator.com"
  datadog_key               = "XXXXXXXXXX"
  pl_region                 = "us-east-1"
  audit_filter              = file("./resources/audit_filter.json")
  audit_filter_auth_success = true
  day_of_week               = "6"
  hour_of_day               = "0"

  ###TAGS######
  tags = {
    "Criticality"     = "Tier3",
    "Requestor"       = "cfg-cldsvc-app-automation-role",
    "Support"         = "julio.estrada@citizensbank.com",
    "CostCenter"      = "2009160"
    "DataClass"       = "Testing",
    "applicationname" = "atl-cs2-levelit-p-2",
    "ApplicationID"   = "04560"
  }

}

resource "aws_kms_key" "test" {
  description             = "MongoDB Atlas Test Key"
  deletion_window_in_days = 7
}
