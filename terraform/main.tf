terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.34.0"
    }
  }
}

provider "google" {
  credentials = local.credentials
  project = var.project
  region  = var.region
}

resource "google_storage_bucket" "lending_club_bucket" {
  name          = var.gcs_bucket_name
  location      = var.location

  storage_class = var.gcs_storage_class
  uniform_bucket_level_access = true

  versioning {
    enabled     = true
  }

  force_destroy = true
}

resource "google_bigquery_dataset" "lending_club_dataset" {
  dataset_id = var.bq_dataset_name
  location = var.location
}