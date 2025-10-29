module "bucket" {
  source                  = "git::https://github.com/inmobi-operations/terraform-platform-modules-gcp.git//generic-modules/compute/gcp-core-gcs?ref=v1.13.4"
  name                    = var.bucket_name
  project_id              = var.project_id
  location                = var.location
  lifecycle_rules         = var.lifecycle_rules
  custom_placement_config = var.custom_placement_config
  iam_members             = var.iam_members
  versioning              = var.versioning
  soft_delete_policy      = var.soft_delete_policy
  autoclass               = var.autoclass
  encryption              = var.encryption
  labels                  = var.labels
}

