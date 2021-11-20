resource "mongodbatlas_auditing" "audit" {
  count = var.audit_filter == null ? 0 : 1

  project_id                  = mongodbatlas_project.this.id
  audit_filter                = var.audit_filter
  audit_authorization_success = var.audit_filter_auth_success
  enabled                     = true
}

resource "mongodbatlas_third_party_integration" "datadog" {
  for_each = toset(compact([var.datadog_key]))

  project_id = mongodbatlas_project.this.id
  type       = "DATADOG"
  api_key    = var.datadog_key
  region     = "US"
}

#### all P-1 Alerts
resource "mongodbatlas_alert_configuration" "User_joined_group_p1" {

  count      = var.environment_id == "p-1" ? 1 : 0
  event_type = "JOINED_GROUP"
  enabled    = true
  project_id = mongodbatlas_project.this.id

  notification {
    type_name     = "EMAIL"
    email_address = "citizens@citizens.com"
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }
}
resource "mongodbatlas_alert_configuration" "CLUSTER_MONGOS_IS_MISSING_p1" {

  count      = var.environment_id == "p-1" ? 1 : 0
  event_type = "CLUSTER_MONGOS_IS_MISSING"
  enabled    = true

  project_id = mongodbatlas_project.this.id
  matcher {
    field_name = "CLUSTER_NAME"
    operator   = "EQUALS"
    value      = mongodbatlas_project.this.name

  }
  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "disk_utilization_p1" {
  count      = var.environment_id == "p-1" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "DISK_PARTITION_UTILIZATION_DATA"
    operator    = "GREATER_THAN"
    threshold   = 80.0
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "high_cpu_p1" {
  count      = var.environment_id == "p-1" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "NORMALIZED_SYSTEM_CPU_USER"
    operator    = "GREATER_THAN"
    threshold   = 80
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "disk_partition_utilization_p1" {
  count      = var.environment_id == "p-1" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "DISK_PARTITION_UTILIZATION_INDEX"
    operator    = "GREATER_THAN"
    threshold   = 90.0
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "mongo_connection_p1" {
  count      = var.environment_id == "p-1" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "CONNECTIONS_PERCENT"
    operator    = "GREATER_THAN"
    threshold   = 80.0
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "query_targeting_p1" {
  count      = var.environment_id == "p-1" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "QUERY_TARGETING_SCANNED_OBJECTS_PER_RETURNED"
    operator    = "GREATER_THAN"
    threshold   = 1000
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "Creditcard_expire_p1" {
  count      = var.environment_id == "p-1" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "CREDIT_CARD_ABOUT_TO_EXPIRE"
  enabled    = true

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "page_fault_p1" {
  count      = var.environment_id == "p-1" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "EXTRA_INFO_PAGE_FAULTS"
    operator    = "GREATER_THAN"
    threshold   = 100
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "cpu_steal_p1" {
  count      = var.environment_id == "p-1" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "NORMALIZED_SYSTEM_CPU_STEAL"
    operator    = "GREATER_THAN"
    threshold   = 50
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "queues_total_p1" {
  count      = var.environment_id == "p-1" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "GLOBAL_LOCK_CURRENT_QUEUE_TOTAL"
    operator    = "GREATER_THAN"
    threshold   = 100
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "replication_lag_p1" {
  count      = var.environment_id == "p-1" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "OPCOUNTER_REPL_UPDATE"
    operator    = "GREATER_THAN"
    threshold   = 60
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
#### P-2 env alerts ###
resource "mongodbatlas_alert_configuration" "high_cpu_p2" {
  count      = var.environment_id == "p-2" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "NORMALIZED_SYSTEM_CPU_USER"
    operator    = "GREATER_THAN"
    threshold   = 96.0
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "User_joined_group_p2" {
  # description = "possible values, p -- prod, p-1 -- qa, p-2 -- dev"
  count      = var.environment_id == "p-2" ? 1 : 0
  event_type = "JOINED_GROUP"
  enabled    = true
  project_id = mongodbatlas_project.this.id
  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }
  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "replication_lag_p2" {
  count      = var.environment_id == "p-2" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "OPCOUNTER_REPL_UPDATE"
    operator    = "GREATER_THAN"
    threshold   = 60
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "CLUSTER_MONGOS_IS_MISSING_p2" {

  count      = var.environment_id == "p-2" ? 1 : 0
  event_type = "CLUSTER_MONGOS_IS_MISSING"
  enabled    = true

  project_id = mongodbatlas_project.this.id
  matcher {
    field_name = "CLUSTER_NAME"
    operator   = "EQUALS"
    value      = mongodbatlas_project.this.name

  }
  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "queues_total_p2" {
  count      = var.environment_id == "p-2" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "GLOBAL_LOCK_CURRENT_QUEUE_TOTAL"
    operator    = "GREATER_THAN"
    threshold   = 100
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}

resource "mongodbatlas_alert_configuration" "disk_utilization_p2" {
  count      = var.environment_id == "p-2" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "DISK_PARTITION_UTILIZATION_DATA"
    operator    = "GREATER_THAN"
    threshold   = 80.0
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}


resource "mongodbatlas_alert_configuration" "disk_partition_utilization_p2" {
  count      = var.environment_id == "p-2" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "DISK_PARTITION_UTILIZATION_INDEX"
    operator    = "GREATER_THAN"
    threshold   = 90.0
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "page_fault_p2" {
  count      = var.environment_id == "p-2" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "EXTRA_INFO_PAGE_FAULTS"
    operator    = "GREATER_THAN"
    threshold   = 100
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}

resource "mongodbatlas_alert_configuration" "mongo_connection_p2" {
  count      = var.environment_id == "p-2" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "CONNECTIONS_PERCENT"
    operator    = "GREATER_THAN"
    threshold   = 80.0
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}


resource "mongodbatlas_alert_configuration" "query_targeting_p2" {
  count      = var.environment_id == "p-2" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "QUERY_TARGETING_SCANNED_OBJECTS_PER_RETURNED"
    operator    = "GREATER_THAN"
    threshold   = 1000
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}


resource "mongodbatlas_alert_configuration" "Creditcard_expire_p2" {
  count      = var.environment_id == "p-2" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "CREDIT_CARD_ABOUT_TO_EXPIRE"
  enabled    = true

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}


resource "mongodbatlas_alert_configuration" "cpu_steal_p2" {
  count      = var.environment_id == "p-2" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "NORMALIZED_SYSTEM_CPU_STEAL"
    operator    = "GREATER_THAN"
    threshold   = 50
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}

#### P env alerts ###
resource "mongodbatlas_alert_configuration" "cpu_steal_p" {
  count      = var.environment_id == "p" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "NORMALIZED_SYSTEM_CPU_STEAL"
    operator    = "GREATER_THAN"
    threshold   = 50
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "page_fault_p" {
  count      = var.environment_id == "p" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "EXTRA_INFO_PAGE_FAULTS"
    operator    = "GREATER_THAN"
    threshold   = 100
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "queues_total_p" {
  count      = var.environment_id == "p" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "GLOBAL_LOCK_CURRENT_QUEUE_TOTAL"
    operator    = "GREATER_THAN"
    threshold   = 100
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "replication_lag_p" {
  count      = var.environment_id == "p" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "OPCOUNTER_REPL_UPDATE"
    operator    = "GREATER_THAN"
    threshold   = 60
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "high_cpu_p" {
  count      = var.environment_id == "p" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "NORMALIZED_SYSTEM_CPU_USER"
    operator    = "GREATER_THAN"
    threshold   = 80.0
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "CLUSTER_MONGOS_IS_MISSING_p" {

  count      = var.environment_id == "p" ? 1 : 0
  event_type = "CLUSTER_MONGOS_IS_MISSING"
  enabled    = true

  project_id = mongodbatlas_project.this.id
  matcher {
    field_name = "CLUSTER_NAME"
    operator   = "EQUALS"
    value      = mongodbatlas_project.this.name

  }
  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "disk_utilization_p" {
  count      = var.environment_id == "p" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "DISK_PARTITION_UTILIZATION_DATA"
    operator    = "GREATER_THAN"
    threshold   = 80.0
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "User_joined_group_p" {

  count      = var.environment_id == "p" ? 1 : 0
  event_type = "JOINED_GROUP"
  enabled    = true
  project_id = mongodbatlas_project.this.id

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "disk_partition_utilization_p" {
  count      = var.environment_id == "p" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "DISK_PARTITION_UTILIZATION_INDEX"
    operator    = "GREATER_THAN"
    threshold   = 90.0
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "mongo_connection_p" {
  count      = var.environment_id == "p" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "CONNECTIONS_PERCENT"
    operator    = "GREATER_THAN"
    threshold   = 80.0
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "query_targeting_p" {
  count      = var.environment_id == "p" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "OUTSIDE_METRIC_THRESHOLD"
  enabled    = true

  metric_threshold = {
    metric_name = "QUERY_TARGETING_SCANNED_OBJECTS_PER_RETURNED"
    operator    = "GREATER_THAN"
    threshold   = 1000
    mode        = "AVERAGE"
    units       = "RAW"

  }

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}
resource "mongodbatlas_alert_configuration" "Creditcard_expire_p" {
  count      = var.environment_id == "p" ? 1 : 0
  project_id = mongodbatlas_project.this.id
  event_type = "CREDIT_CARD_ABOUT_TO_EXPIRE"
  enabled    = true

  notification {
    type_name     = "EMAIL"
    email_address = var.alert_email
    interval_min  = 5
    delay_min     = 0
  }

  dynamic "notification" {
    for_each = toset(compact([var.datadog_key]))
    content {
      type_name       = "DATADOG"
      datadog_api_key = var.datadog_key
      datadog_region  = "US"
      interval_min    = 5
    }
  }

}

