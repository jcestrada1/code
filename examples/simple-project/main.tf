
module "atlas_project" {
  source = "../../"

  atlas_org_id = "609068c9b4d9cf790b8688e1" //DOU
  #atlas_org_id  = "6091a521f317557941b7ffad" //Citizens
  aws_account_name   = "cfg-commercial"
  shortened_app_name = "splpj"
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

  use_kms = false

  tags = {
    "Criticality"     = "Tier3",
    "Requestor"       = "cfg-cldsvc-app-automation-role",
    "Support"         = "julio.estrada@citizensbank.com",
    "CostCenter"      = "2009160"
    "DataClass"       = "Testing",
    "applicationName" = "Testing",
    "ApplicationID"   = "04560"
  }
}
