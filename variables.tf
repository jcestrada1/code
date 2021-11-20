variable "atlas_org_id" {
  description = "MongoDB Atlas Organization ID"
  type        = string
  #TODO Should we prepopulate with the citizens orgid?
}

variable "audit_filter" {
  description = "Json Audit filter configuration"
  type        = string
  default     = null
}

variable "audit_filter_auth_success" {
  description = "If true will include auth success in audit logs."
  type        = bool
  default     = false
}

variable "list_of_cdirs" {
  description = "Range of IP addresses in CIDR notation to be added to the access list"
  type        = list(string)
  default     = []
}

variable "use_kms" {
  description = "Should kms be enabled?"
  type        = bool
  default     = false
}
variable "kms_arn" {
  description = "KMS arn"
  type        = string
  default     = null
}
variable "datadog_key" {
  description = "datadog api key"
  type        = string
  default     = null
}
variable "aws_account_name" {
  description = "Name of aws account name E.G. cfg-commercial, cfg-consumer"
  type        = string
}
variable "shortened_app_name" {
  description = "Application names, no longer than 5 characteres"
  type        = string
}
variable "environment_id" {
  description = "possible values, p -- prod, p-1 -- qa, p-2 -- dev"
  type        = string
}
variable "alert_email" {
  description = "email to send alerts from datadog"
  type        = string
  default     = null
}

variable "day_of_week" {
  description = "Day of the week when you would like the maintenance window to start as a 1-based integer: S=1, M=2, T=3, W=4, T=5, F=6, S=7"
  type        = string
  default     = 2
}

variable "hour_of_day" {
  description = "Hour of the day when you would like the maintenance window to start. This parameter uses the 24-hour clock, where midnight is 0, noon is 12 (Time zone is UTC)."
  type        = string
  default     = 6
}

//TODO use a datasource to get the kms region
variable "kms_region" {
  description = "AWS Region for KMS"
  type        = string
  default     = "us-east-1"
}

variable "pl_region" {
  description = "AWS Region for private links"
  type        = string
  default     = null
}
variable "kms_IAM_role" {
  description = "kms iam role "
  type        = string
  default     = null

}
variable "team_permission" {
  description = "team ids to set for project roles"
  type = map(object({
    team_id    = string
    role_names = list(string)
  }))
}

####TAGS####
variable "tags" {
  type        = map(string)
  description = "Map of tags to tag resources with"
}
