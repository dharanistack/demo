bucket_name             = "gcs-exchange-serving-prod-sgp-signals-storage"
project_id              = "exchange-prod-serving-18e7"
location                = "asia-southeast1"
lifecycle_rules         = [
  {
    action = {
      type = "Delete"
    }

    condition = {
      age = 90  # Objects older than 90 days will be deleted
    }
  }
]
soft_delete_policy = {
  retention_duration_seconds = 0
}
versioning              = false
custom_placement_config = null
iam_members             = []
autoclass               = false
encryption              = null
labels = {
  "resource-group" : "exchange",
  "cost-center" : "exchange",
  "funnel" : "inmobi_tenant_bucket",
  "component" : "gcs",
  "sub-component" : "terraform"
}

        
